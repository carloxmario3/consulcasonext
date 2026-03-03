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
  const skip = (page - 1) * limit;

  const [facturas, total, stats] = await Promise.all([
    prisma.tblFacturas.findMany({
      skip,
      take: limit,
      orderBy: { n_id_factura: "desc" },
      include: {
        caso: { select: { id_numero_caso: true } },
      },
    }),
    prisma.tblFacturas.count(),
    prisma.tblFacturas.aggregate({
      _sum: {
        n_valor_total_a_pagar: true,
        n_valor_subtotal: true,
        n_valor_iva: true,
      },
      where: { b_finalizada: true },
    }),
  ]);

  return NextResponse.json(serializeData({
    facturas,
    total,
    page,
    limit,
    stats: {
      totalFacturado: stats._sum.n_valor_total_a_pagar ?? 0,
      totalSubtotal: stats._sum.n_valor_subtotal ?? 0,
      totalIva: stats._sum.n_valor_iva ?? 0,
    },
  }));
}
