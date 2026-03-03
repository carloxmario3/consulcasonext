import { prisma } from "@/lib/prisma";
import { CasosClient } from "./CasosClient";

export default async function CasosPage() {
  const [estados, tiposCaso] = await Promise.all([
    prisma.tablaEstado.findMany({ orderBy: { id_estado: "asc" } }),
    prisma.tablaTipodecaso.findMany({
      orderBy: { nombre: "asc" },
      include: { clasedecaso: true },
    }),
  ]);

  return <CasosClient estados={estados} tiposCaso={tiposCaso} />;
}
