import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions, hashAspNetPassword } from "@/lib/auth";
import { prisma } from "@/lib/prisma";

export async function PUT(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;

  try {
    const { roles, isapproved, password } = await req.json() as {
      roles?: string[];
      isapproved?: boolean;
      password?: string;
    };

    await prisma.$transaction(async (tx) => {
      // Update roles if provided
      if (roles !== undefined) {
        await tx.aspnetUsersinroles.deleteMany({ where: { userid: id } });

        if (roles.length > 0) {
          const roleRecords = await tx.aspnetRoles.findMany({
            where: { rolename: { in: roles } },
          });
          await tx.aspnetUsersinroles.createMany({
            data: roleRecords.map((r) => ({
              userid: id,
              roleid: r.roleid,
            })),
          });
        }
      }

      // Update isapproved if provided
      if (isapproved !== undefined) {
        await tx.aspnetMembership.update({
          where: { userid: id },
          data: { isapproved },
        });
      }

      // Update password if provided
      if (password) {
        const { password: hashedPw, passwordSalt, passwordFormat } = hashAspNetPassword(password);
        await tx.aspnetMembership.update({
          where: { userid: id },
          data: {
            password: hashedPw,
            passwordsalt: passwordSalt,
            passwordformat: passwordFormat,
            lastpasswordchangeddate: new Date(),
          },
        });
      }
    });

    return NextResponse.json({ ok: true });
  } catch (error) {
    console.error("Error updating user:", error);
    return NextResponse.json({ error: "Error al actualizar usuario" }, { status: 500 });
  }
}

export async function DELETE(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;

  try {
    await prisma.$transaction(async (tx) => {
      await tx.aspnetUsersinroles.deleteMany({ where: { userid: id } });
      await tx.aspnetMembership.delete({ where: { userid: id } });
      await tx.aspnetUsers.delete({ where: { userid: id } });
    });

    return NextResponse.json({ ok: true });
  } catch (error) {
    console.error("Error deleting user:", error);
    return NextResponse.json({ error: "Error al eliminar usuario" }, { status: 500 });
  }
}
