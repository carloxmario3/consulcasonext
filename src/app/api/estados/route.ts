import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import { prisma } from "@/lib/prisma";

export async function GET() {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const estados = await prisma.tablaEstado.findMany({ orderBy: { nombre: "asc" } });
  return NextResponse.json(estados);
}

export async function POST(req: NextRequest) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  try {
    const { nombre } = await req.json();
    if (!nombre?.trim()) {
      return NextResponse.json({ error: "El nombre es requerido" }, { status: 400 });
    }

    const estado = await prisma.tablaEstado.create({ data: { nombre: nombre.trim() } });
    return NextResponse.json(estado, { status: 201 });
  } catch (error) {
    console.error("Error creating estado:", error);
    return NextResponse.json({ error: "Error al crear estado" }, { status: 500 });
  }
}
