import { NextRequest, NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import { prisma } from "@/lib/prisma";
import { serializeData } from "@/lib/json";

function extractDriveId(input: string): string {
  // Matches: https://drive.google.com/file/d/ID/view or /open?id=ID or ?id=ID
  const match = input.match(/(?:\/d\/|[?&]id=)([\w-]+)/);
  return match ? match[1] : input.trim();
}

export async function GET(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  try {
    const session = await getServerSession(authOptions);
    if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

    const { id } = await params;

    const archivos = await prisma.tblEnlace.findMany({
      where: { t_numero_caso: String(id) },
      orderBy: [{ t_carpeta: "asc" }, { nid_enlace: "asc" }],
    });

    return NextResponse.json(serializeData(archivos));
  } catch (err) {
    console.error("[GET /api/casos/[id]/archivos]", err);
    return NextResponse.json({ error: "Internal server error", detail: String(err) }, { status: 500 });
  }
}

export async function POST(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  try {
    const session = await getServerSession(authOptions);
    if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

    const { id } = await params;
    const { nombre, carpeta, enlace } = await req.json();

    const driveId = extractDriveId(enlace ?? "");

    const nuevo = await prisma.tblEnlace.create({
      data: {
        t_numero_caso: String(id),
        t_nombre_archivo: nombre || null,
        t_carpeta: carpeta || null,
        t_enlace: driveId || null,
      },
    });

    return NextResponse.json(serializeData(nuevo), { status: 201 });
  } catch (err) {
    console.error("[POST /api/casos/[id]/archivos]", err);
    return NextResponse.json({ error: "Internal server error", detail: String(err) }, { status: 500 });
  }
}
