import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import { prisma } from "@/lib/prisma";
import { serializeData } from "@/lib/json";

export async function PUT(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;
  const data = await req.json();

  const reclamante = await prisma.tablaReclamantes.update({
    where: { id_reclamantes: parseInt(id) },
    data: {
      nombre: data.nombre || null,
      apellido: data.apellido || null,
      cedula: data.cedula ? BigInt(data.cedula) : null,
      celular: data.celular ? BigInt(data.celular) : null,
      telefono: data.telefono ? parseInt(data.telefono) : null,
      parentesco: data.parentesco || null,
      direccion: data.direccion || null,
      barrio: data.barrio || null,
    },
  });

  return NextResponse.json(serializeData(reclamante));
}

export async function DELETE(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;

  await prisma.tablaReclamantes.delete({
    where: { id_reclamantes: parseInt(id) },
  });

  return NextResponse.json({ ok: true });
}
