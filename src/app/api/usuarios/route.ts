import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions, hashAspNetPassword } from "@/lib/auth";
import { prisma } from "@/lib/prisma";
import crypto from "crypto";

const APP_ID = "70da21b6-b580-4351-8298-fd7b81e17c72";

export async function GET() {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const usuarios = await prisma.aspnetUsers.findMany({
    orderBy: { username: "asc" },
    include: {
      membership: { select: { email: true, isapproved: true, createdate: true } },
      usersinroles: { include: { role: { select: { rolename: true } } } },
    },
  });

  return NextResponse.json(usuarios);
}

export async function POST(req: NextRequest) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  try {
    const { username, email, password, roles } = await req.json() as {
      username: string;
      email: string;
      password: string;
      roles: string[];
    };

    if (!username || !email || !password) {
      return NextResponse.json({ error: "Faltan campos requeridos" }, { status: 400 });
    }

    // Check unique username
    const existing = await prisma.aspnetUsers.findFirst({
      where: { loweredusername: username.toLowerCase() },
    });
    if (existing) {
      return NextResponse.json({ error: "El usuario ya existe" }, { status: 409 });
    }

    const userId = crypto.randomUUID();
    const now = new Date();
    const { password: hashedPw, passwordSalt, passwordFormat } = hashAspNetPassword(password);

    // Look up role IDs
    const roleRecords = roles?.length
      ? await prisma.aspnetRoles.findMany({
          where: { rolename: { in: roles } },
        })
      : [];

    await prisma.$transaction(async (tx) => {
      await tx.aspnetUsers.create({
        data: {
          applicationid: APP_ID,
          userid: userId,
          username,
          loweredusername: username.toLowerCase(),
          isanonymous: false,
          lastactivitydate: now,
        },
      });

      await tx.aspnetMembership.create({
        data: {
          applicationid: APP_ID,
          userid: userId,
          password: hashedPw,
          passwordformat: passwordFormat,
          passwordsalt: passwordSalt,
          email,
          loweredemail: email.toLowerCase(),
          isapproved: true,
          islockedout: false,
          createdate: now,
          lastlogindate: now,
          lastpasswordchangeddate: now,
          lastlockoutdate: new Date("1754-01-01"),
          failedpasswordattemptcount: 0,
          failedpasswordattemptwindowstart: new Date("1754-01-01"),
          failedpasswordanswerattemptcount: 0,
          failedpasswordanswerattemptwindowstart: new Date("1754-01-01"),
        },
      });

      if (roleRecords.length > 0) {
        await tx.aspnetUsersinroles.createMany({
          data: roleRecords.map((r) => ({
            userid: userId,
            roleid: r.roleid,
          })),
        });
      }
    });

    return NextResponse.json({ ok: true, userid: userId }, { status: 201 });
  } catch (error) {
    console.error("Error creating user:", error);
    return NextResponse.json({ error: "Error al crear usuario" }, { status: 500 });
  }
}
