import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import { prisma } from "@/lib/prisma";
import { serializeData } from "@/lib/json";

export async function GET(req: NextRequest) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { searchParams } = new URL(req.url);
  const page = parseInt(searchParams.get("page") ?? "1");
  const limit = parseInt(searchParams.get("limit") ?? "20");
  const search = searchParams.get("search") ?? "";
  const estado = searchParams.get("estado") ?? "";
  const skip = (page - 1) * limit;

  const where: Record<string, unknown> = {};

  if (search) {
    where.OR = [
      { id_numero_caso: isNaN(parseInt(search)) ? undefined : parseInt(search) },
      { observaciones: { contains: search, mode: "insensitive" } },
    ].filter((c) => Object.values(c).some((v) => v !== undefined));
  }

  if (estado) {
    where.id_estado = parseInt(estado);
  }

  const [casos, total] = await Promise.all([
    prisma.tablaCasos.findMany({
      where,
      skip,
      take: limit,
      orderBy: { id_numero_caso: "desc" },
      include: {
        tipodecaso: true,
        estado: true,
        analista: { select: { nombres: true, apellidos: true } },
        investigador: { select: { nombres: true, apellidos: true } },
        afiliados: { select: { nombre: true, apellido: true, cedula: true } },
      },
    }),
    prisma.tablaCasos.count({ where }),
  ]);

  return NextResponse.json(serializeData({ casos, total, page, limit }));
}

export async function POST(req: NextRequest) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const data = await req.json();

  const caso = await prisma.tablaCasos.create({
    data: {
      id_tipocaso: data.id_tipocaso,
      id_estado: data.id_estado ?? 1,
      id_analista: data.id_analista,
      id_investigador: data.id_investigador,
      fecha_asignacion: data.fecha_asignacion,
      fecha_posibleentrega: data.fecha_posibleentrega,
      observaciones: data.observaciones,
      ciudad: data.ciudad,
    },
  });

  return NextResponse.json(caso, { status: 201 });
}
