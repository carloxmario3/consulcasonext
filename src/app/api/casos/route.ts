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
  const tipocaso = searchParams.get("tipocaso") ?? "";
  const skip = (page - 1) * limit;

  const where: Record<string, unknown> = {};

  if (search) {
    const numericSearch = parseInt(search);
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const conditions: any[] = [
      { observaciones: { contains: search, mode: "insensitive" } },
      { fecha_asignacion: { contains: search, mode: "insensitive" } },
      { afiliados: { some: { nombre: { contains: search, mode: "insensitive" } } } },
      { afiliados: { some: { apellido: { contains: search, mode: "insensitive" } } } },
      { afiliados: { some: { direccion: { contains: search, mode: "insensitive" } } } },
      { afiliados: { some: { barrio: { contains: search, mode: "insensitive" } } } },
      { analista: { nombres: { contains: search, mode: "insensitive" } } },
      { analista: { apellidos: { contains: search, mode: "insensitive" } } },
      { investigador: { nombres: { contains: search, mode: "insensitive" } } },
      { investigador: { apellidos: { contains: search, mode: "insensitive" } } },
    ];

    if (!isNaN(numericSearch)) {
      conditions.push({ id_numero_caso: numericSearch });
    }

    // Búsqueda exacta de cédula (BigInt)
    try {
      conditions.push({ afiliados: { some: { cedula: BigInt(search) } } });
    } catch {
      // no es un número válido para cédula
    }

    where.OR = conditions;
  }

  if (estado) {
    where.id_estado = parseInt(estado);
  }

  if (tipocaso) {
    where.id_tipocaso = parseInt(tipocaso);
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
