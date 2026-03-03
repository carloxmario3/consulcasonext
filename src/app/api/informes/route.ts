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
  const casoId = searchParams.get("caso");
  const skip = (page - 1) * limit;

  const where = casoId ? { id_numero_de_caso: parseInt(casoId) } : {};

  const [informes, total] = await Promise.all([
    prisma.tablaInformes.findMany({
      where,
      skip,
      take: limit,
      orderBy: { id_informe: "desc" },
      include: {
        caso: { select: { id_numero_caso: true } },
        tipoinforme: true,
        estadodocus: true,
      },
    }),
    prisma.tablaInformes.count({ where }),
  ]);

  return NextResponse.json(serializeData({ informes, total, page, limit }));
}

export async function POST(req: NextRequest) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const data = await req.json();

  const informe = await prisma.tablaInformes.create({
    data: {
      id_numero_de_caso: data.id_numero_de_caso,
      id_tipoinforme: data.id_tipoinforme,
      id_estadodocus: data.id_estadodocus ?? 1,
      ruta_pdf: data.ruta_pdf,
      ruta_word: data.ruta_word,
    },
  });

  return NextResponse.json(informe, { status: 201 });
}
