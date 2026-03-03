import { prisma } from "@/lib/prisma";
import { AdministracionClient } from "./AdministracionClient";

export default async function AdministracionPage() {
  const [analistas, investigadores, usuarios] = await Promise.all([
    prisma.tablaAnalista.findMany({
      orderBy: { nombres: "asc" },
      include: { oficina: { include: { compania: true } } },
    }),
    prisma.tablaInvestigador.findMany({
      orderBy: { nombres: "asc" },
    }),
    prisma.aspnetUsers.findMany({
      orderBy: { username: "asc" },
      include: {
        membership: { select: { email: true, isapproved: true, createdate: true } },
        usersinroles: { include: { role: { select: { rolename: true } } } },
      },
    }),
  ]);

  return (
    <AdministracionClient
      analistas={analistas}
      investigadores={investigadores}
      usuarios={usuarios}
    />
  );
}
