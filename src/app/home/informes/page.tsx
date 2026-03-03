import { prisma } from "@/lib/prisma";
import { InformesClient } from "./InformesClient";

export default async function InformesPage() {
  const [tiposInforme, estadosDocs] = await Promise.all([
    prisma.tablaTipodeinforme.findMany({ orderBy: { id_tipoinforme: "asc" } }),
    prisma.tablaEstadodocus.findMany({ orderBy: { id_estadodocus: "asc" } }),
  ]);

  return <InformesClient tiposInforme={tiposInforme} estadosDocs={estadosDocs} />;
}
