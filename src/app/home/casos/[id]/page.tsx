import { prisma } from "@/lib/prisma";
import { serializeData } from "@/lib/json";
import { notFound } from "next/navigation";
import Link from "next/link";
import { CasoDetailClient } from "./CasoDetailClient";

export default async function CasoDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const casoId = parseInt(id);

  const [caso, estados, analistas, investigadores] = await Promise.all([
    prisma.tablaCasos.findUnique({
      where: { id_numero_caso: casoId },
      include: {
        tipodecaso: { include: { clasedecaso: true } },
        estado: true,
        analista: true,
        investigador: true,
        afiliados: {
          include: {
            seguimientos: { orderBy: { id_seguimientos: "desc" }, take: 30 },
          },
        },
        informes: { include: { tipoinforme: true, estadodocus: true }, orderBy: { id_informe: "desc" } },
        facturas: { orderBy: { n_id_factura: "desc" } },
      },
    }),
    prisma.tablaEstado.findMany({ orderBy: { id_estado: "asc" } }),
    prisma.tablaAnalista.findMany({ orderBy: { nombres: "asc" } }),
    prisma.tablaInvestigador.findMany({ where: { activo: true }, orderBy: { nombres: "asc" } }),
  ]);

  if (!caso) notFound();

  const safeCase = serializeData(caso);

  return (
    <div className="space-y-5">
      {/* Breadcrumb */}
      <div className="flex items-center gap-2 text-sm text-gray-500">
        <Link href="/home/casos" className="hover:text-blue-600">Casos</Link>
        <span>/</span>
        <span className="text-gray-800 font-medium">Caso #{caso.id_numero_caso}</span>
      </div>

      <CasoDetailClient caso={safeCase} estados={estados} analistas={analistas} investigadores={investigadores} />
    </div>
  );
}
