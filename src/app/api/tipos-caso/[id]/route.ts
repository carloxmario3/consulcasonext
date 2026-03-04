import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import { prisma } from "@/lib/prisma";

export async function PUT(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;
  try {
    const { nombre, id_clasecaso } = await req.json();
    if (!nombre?.trim()) {
      return NextResponse.json({ error: "El nombre es requerido" }, { status: 400 });
    }

    const tipo = await prisma.tablaTipodecaso.update({
      where: { id_tipocaso: parseInt(id) },
      data: { nombre: nombre.trim(), id_clasecaso: id_clasecaso || null },
    });

    return NextResponse.json(tipo);
  } catch (error) {
    console.error("Error updating tipo de caso:", error);
    return NextResponse.json({ error: "Error al actualizar tipo de caso" }, { status: 500 });
  }
}

export async function DELETE(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;
  try {
    await prisma.tablaTipodecaso.delete({ where: { id_tipocaso: parseInt(id) } });
    return NextResponse.json({ ok: true });
  } catch (error) {
    console.error("Error deleting tipo de caso:", error);
    return NextResponse.json({ error: "No se puede eliminar, puede tener casos asociados" }, { status: 500 });
  }
}
