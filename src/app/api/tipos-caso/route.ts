import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import { prisma } from "@/lib/prisma";

export async function GET() {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const tipos = await prisma.tablaTipodecaso.findMany({
    orderBy: { nombre: "asc" },
    include: { clasedecaso: { select: { id_clasecaso: true, nombre: true } } },
  });

  return NextResponse.json(tipos);
}

export async function POST(req: NextRequest) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  try {
    const { nombre, id_clasecaso } = await req.json();
    if (!nombre?.trim()) {
      return NextResponse.json({ error: "El nombre es requerido" }, { status: 400 });
    }

    const tipo = await prisma.tablaTipodecaso.create({
      data: { nombre: nombre.trim(), id_clasecaso: id_clasecaso || null },
    });

    return NextResponse.json(tipo, { status: 201 });
  } catch (error) {
    console.error("Error creating tipo de caso:", error);
    return NextResponse.json({ error: "Error al crear tipo de caso" }, { status: 500 });
  }
}
