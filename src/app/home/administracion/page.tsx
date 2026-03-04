import { prisma } from "@/lib/prisma";
import { AdministracionClient } from "./AdministracionClient";

export default async function AdministracionPage() {
  const [usuarios, roles, tiposCaso, clasesCaso, estados] = await Promise.all([
    prisma.aspnetUsers.findMany({
      orderBy: { username: "asc" },
      include: {
        membership: { select: { email: true, isapproved: true, createdate: true } },
        usersinroles: { include: { role: { select: { rolename: true } } } },
      },
    }),
    prisma.aspnetRoles.findMany({ orderBy: { rolename: "asc" } }),
    prisma.tablaTipodecaso.findMany({
      orderBy: { nombre: "asc" },
      include: { clasedecaso: { select: { id_clasecaso: true, nombre: true } } },
    }),
    prisma.tablaClasedecaso.findMany({ orderBy: { nombre: "asc" } }),
    prisma.tablaEstado.findMany({ orderBy: { nombre: "asc" } }),
  ]);

  return (
    <AdministracionClient
      usuarios={usuarios}
      roles={roles}
      tiposCaso={tiposCaso}
      clasesCaso={clasesCaso}
      estados={estados}
    />
  );
}
