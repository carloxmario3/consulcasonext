import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import { prisma } from "@/lib/prisma";

export async function PUT(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;
  try {
    const { nombre } = await req.json();
    if (!nombre?.trim()) {
      return NextResponse.json({ error: "El nombre es requerido" }, { status: 400 });
    }

    const estado = await prisma.tablaEstado.update({
      where: { id_estado: parseInt(id) },
      data: { nombre: nombre.trim() },
    });

    return NextResponse.json(estado);
  } catch (error) {
    console.error("Error updating estado:", error);
    return NextResponse.json({ error: "Error al actualizar estado" }, { status: 500 });
  }
}

export async function DELETE(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;
  try {
    await prisma.tablaEstado.delete({ where: { id_estado: parseInt(id) } });
    return NextResponse.json({ ok: true });
  } catch (error) {
    console.error("Error deleting estado:", error);
    return NextResponse.json({ error: "No se puede eliminar, puede tener casos asociados" }, { status: 500 });
  }
}
