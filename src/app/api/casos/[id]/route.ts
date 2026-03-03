import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import { prisma } from "@/lib/prisma";
import { serializeData } from "@/lib/json";

export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;
  const caso = await prisma.tablaCasos.findUnique({
    where: { id_numero_caso: parseInt(id) },
    include: {
      tipodecaso: { include: { clasedecaso: true } },
      estado: true,
      analista: true,
      investigador: true,
      afiliados: {
        include: {
          seguimientos: { orderBy: { id_seguimientos: "desc" }, take: 20 },
        },
      },
      informes: { include: { tipoinforme: true, estadodocus: true } },
      facturas: true,
    },
  });

  if (!caso) return NextResponse.json({ error: "Not found" }, { status: 404 });
  return NextResponse.json(serializeData(caso));
}

export async function PUT(
  req: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { id } = await params;
  const data = await req.json();

  const caso = await prisma.tablaCasos.update({
    where: { id_numero_caso: parseInt(id) },
    data: {
      id_tipocaso: data.id_tipocaso,
      id_estado: data.id_estado,
      id_analista: data.id_analista,
      id_investigador: data.id_investigador,
      fecha_asignacion: data.fecha_asignacion,
      fecha_posibleentrega: data.fecha_posibleentrega,
      fecha_entregareal: data.fecha_entregareal,
      observaciones: data.observaciones,
      ciudad: data.ciudad,
    },
  });

  return NextResponse.json(serializeData(caso));
}
