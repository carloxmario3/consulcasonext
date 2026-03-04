import { NextAuthOptions } from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";
import { prisma } from "./prisma";
import crypto from "crypto";

/**
 * Genera hash de contraseña compatible con ASP.NET Membership (SHA1 + salt)
 */
export function hashAspNetPassword(password: string) {
  const saltBytes = crypto.randomBytes(16);
  const passwordBytes = Buffer.from(password, "utf16le");
  const combined = Buffer.concat([saltBytes, passwordBytes]);
  const hash = crypto.createHash("sha1").update(combined).digest("base64");
  return {
    password: hash,
    passwordSalt: saltBytes.toString("base64"),
    passwordFormat: 1,
  };
}

/**
 * Verifica contraseña de ASP.NET Membership
 * Format 0 = Clear text
 * Format 1 = SHA1 hashed with salt (Base64)
 */
function verifyAspNetPassword(
  inputPassword: string,
  storedPassword: string,
  passwordSalt: string,
  format: number
): boolean {
  if (format === 0) {
    // Clear text
    return inputPassword === storedPassword;
  } else if (format === 1) {
    // SHA1 with salt
    const saltBytes = Buffer.from(passwordSalt, "base64");
    const passwordBytes = Buffer.from(inputPassword, "utf16le");
    const combined = Buffer.concat([saltBytes, passwordBytes]);
    const hash = crypto.createHash("sha1").update(combined).digest("base64");
    return hash === storedPassword;
  }
  return false;
}

export const authOptions: NextAuthOptions = {
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {
        username: { label: "Usuario", type: "text" },
        password: { label: "Contraseña", type: "password" },
      },
      async authorize(credentials) {
        if (!credentials?.username || !credentials?.password) return null;

        try {
          // Find user (case-insensitive)
          const user = await prisma.aspnetUsers.findFirst({
            where: {
              loweredusername: credentials.username.toLowerCase(),
            },
            include: {
              membership: true,
              usersinroles: {
                include: {
                  role: true,
                },
              },
            },
          });

          if (!user || !user.membership) return null;
          if (user.membership.islockedout) return null;

          const isValid = verifyAspNetPassword(
            credentials.password,
            user.membership.password,
            user.membership.passwordsalt,
            user.membership.passwordformat
          );

          if (!isValid) return null;

          const roles = user.usersinroles.map((ur) => ur.role.rolename);

          return {
            id: user.userid,
            name: user.username,
            email: user.membership.email ?? user.username,
            roles,
          };
        } catch (error) {
          console.error("Auth error:", error);
          return null;
        }
      },
    }),
  ],
  callbacks: {
    async jwt({ token, user }) {
      if (user) {
        token.id = user.id;
        token.roles = (user as { roles?: string[] }).roles ?? [];
      }
      return token;
    },
    async session({ session, token }) {
      if (token) {
        session.user.id = token.id as string;
        session.user.roles = token.roles as string[];
      }
      return session;
    },
  },
  pages: {
    signIn: "/login",
  },
  session: {
    strategy: "jwt",
    maxAge: 24 * 60 * 60, // 24 hours
  },
  secret: process.env.NEXTAUTH_SECRET,
};
