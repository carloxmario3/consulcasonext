import { prisma } from "@/lib/prisma";
import { serializeData } from "@/lib/json";
import Link from "next/link";

export default async function SeguimientosPage() {
  const seguimientos = await prisma.tablaSeguimientos.findMany({
    orderBy: { id_seguimientos: "desc" },
    take: 100,
    include: {
      afiliado: {
        select: {
          nombre: true,
          apellido: true,
          cedula: true,
          id_numero_caso: true,
        },
      },
    },
  });

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const data = serializeData(seguimientos) as any[];

  return (
    <div className="space-y-5">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Seguimientos</h1>
        <p className="text-sm text-gray-500 mt-0.5">Últimos 100 registros de seguimiento</p>
      </div>

      <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="bg-gray-50 border-b border-gray-200">
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Fecha / Hora</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Afiliado</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Caso</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Entidad</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Contacto</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Dirección</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {data.length === 0 ? (
                <tr><td colSpan={6} className="text-center py-8 text-gray-400">Sin registros</td></tr>
              ) : (
                data.map((s) => (
                  <tr key={s.id_seguimientos} className="hover:bg-gray-50">
                    <td className="px-4 py-3 text-gray-600 whitespace-nowrap">
                      <p>{s.fecha ?? "—"}</p>
                      <p className="text-xs text-gray-400">{s.hora ?? ""}</p>
                    </td>
                    <td className="px-4 py-3">
                      <p className="font-medium text-gray-800">
                        {s.afiliado ? `${s.afiliado.nombre ?? ""} ${s.afiliado.apellido ?? ""}`.trim() : "—"}
                      </p>
                      {s.afiliado?.cedula && (
                        <p className="text-xs text-gray-400">CC: {s.afiliado.cedula}</p>
                      )}
                    </td>
                    <td className="px-4 py-3">
                      {s.afiliado?.id_numero_caso ? (
                        <Link href={`/home/casos/${s.afiliado.id_numero_caso}`}
                          className="text-blue-600 hover:underline font-medium">
                          #{s.afiliado.id_numero_caso}
                        </Link>
                      ) : <span className="text-gray-400">—</span>}
                    </td>
                    <td className="px-4 py-3 text-gray-700">{s.entidad ?? "—"}</td>
                    <td className="px-4 py-3 text-gray-600">{s.nombre_contacto ?? "—"}</td>
                    <td className="px-4 py-3 text-gray-500 text-xs max-w-xs truncate">{s.direccion ?? "—"}</td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
