"use client";

import { useState, useEffect, useCallback } from "react";
import Link from "next/link";

interface Factura {
  n_id_factura: number;
  n_facturafisica: number | null;
  t_fecha: string | null;
  b_finalizada: boolean | null;
  n_valor_subtotal: number | null;
  n_valor_iva: number | null;
  n_valor_total_a_pagar: number | null;
  fk_numero_de_caso: number | null;
  esfactura_multiple: boolean | null;
}

interface Stats {
  totalFacturado: number;
  totalSubtotal: number;
  totalIva: number;
}

function formatCOP(val: number | null | undefined): string {
  if (val == null) return "—";
  return `$${Number(val).toLocaleString("es-CO")}`;
}

export function ContabilidadClient() {
  const [facturas, setFacturas] = useState<Factura[]>([]);
  const [total, setTotal] = useState(0);
  const [stats, setStats] = useState<Stats | null>(null);
  const [page, setPage] = useState(1);
  const [loading, setLoading] = useState(true);

  const fetch_ = useCallback(async () => {
    setLoading(true);
    const res = await fetch(`/api/contabilidad?page=${page}&limit=25`);
    const data = await res.json();
    setFacturas(data.facturas);
    setTotal(data.total);
    setStats(data.stats);
    setLoading(false);
  }, [page]);

  useEffect(() => { fetch_(); }, [fetch_]);

  const totalPages = Math.ceil(total / 25);

  return (
    <div className="space-y-5">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Contabilidad</h1>
        <p className="text-sm text-gray-500 mt-0.5">{total.toLocaleString()} facturas</p>
      </div>

      {/* Stats */}
      {stats && (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          {[
            { label: "Total Facturado", value: formatCOP(stats.totalFacturado), color: "text-green-700" },
            { label: "Subtotal", value: formatCOP(stats.totalSubtotal), color: "text-blue-700" },
            { label: "IVA Total", value: formatCOP(stats.totalIva), color: "text-purple-700" },
          ].map((stat) => (
            <div key={stat.label} className="bg-white rounded-xl border border-gray-200 p-5">
              <p className="text-xs font-medium text-gray-500 uppercase tracking-wide">{stat.label}</p>
              <p className={`text-xl font-bold mt-1 ${stat.color}`}>{stat.value}</p>
              <p className="text-xs text-gray-400 mt-0.5">Facturas finalizadas</p>
            </div>
          ))}
        </div>
      )}

      {/* Table */}
      <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="bg-gray-50 border-b border-gray-200">
                <th className="text-left px-4 py-3 font-semibold text-gray-600"># Factura</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Caso</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Fecha</th>
                <th className="text-right px-4 py-3 font-semibold text-gray-600">Subtotal</th>
                <th className="text-right px-4 py-3 font-semibold text-gray-600">IVA</th>
                <th className="text-right px-4 py-3 font-semibold text-gray-600">Total</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Estado</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {loading ? (
                <tr><td colSpan={7} className="text-center py-10 text-gray-400">Cargando...</td></tr>
              ) : facturas.map((f) => (
                <tr key={f.n_id_factura} className="hover:bg-gray-50">
                  <td className="px-4 py-3 font-mono text-gray-700">
                    {f.n_facturafisica ?? `F-${f.n_id_factura}`}
                  </td>
                  <td className="px-4 py-3">
                    {f.fk_numero_de_caso ? (
                      <Link href={`/home/casos/${f.fk_numero_de_caso}`}
                        className="text-blue-600 hover:underline">#{f.fk_numero_de_caso}</Link>
                    ) : (
                      <span className="text-gray-400">—</span>
                    )}
                    {f.esfactura_multiple && (
                      <span className="ml-2 text-xs bg-blue-100 text-blue-700 px-1.5 py-0.5 rounded">Múltiple</span>
                    )}
                  </td>
                  <td className="px-4 py-3 text-gray-600">
                    {f.t_fecha ? new Date(f.t_fecha).toLocaleDateString("es-CO") : "—"}
                  </td>
                  <td className="px-4 py-3 text-right text-gray-800">{formatCOP(f.n_valor_subtotal)}</td>
                  <td className="px-4 py-3 text-right text-gray-600">{formatCOP(f.n_valor_iva)}</td>
                  <td className="px-4 py-3 text-right font-semibold text-gray-900">{formatCOP(f.n_valor_total_a_pagar)}</td>
                  <td className="px-4 py-3">
                    <span className={`inline-flex px-2 py-0.5 rounded-full text-xs font-medium ${
                      f.b_finalizada ? "bg-green-100 text-green-800" : "bg-yellow-100 text-yellow-800"
                    }`}>
                      {f.b_finalizada ? "Finalizada" : "Pendiente"}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        {totalPages > 1 && (
          <div className="px-4 py-3 border-t border-gray-200 flex items-center justify-between text-sm text-gray-600">
            <span>Página {page} de {totalPages}</span>
            <div className="flex gap-2">
              <button onClick={() => setPage(p => Math.max(1, p - 1))} disabled={page === 1}
                className="px-3 py-1 border border-gray-300 rounded-md disabled:opacity-50 hover:bg-gray-50">Anterior</button>
              <button onClick={() => setPage(p => Math.min(totalPages, p + 1))} disabled={page === totalPages}
                className="px-3 py-1 border border-gray-300 rounded-md disabled:opacity-50 hover:bg-gray-50">Siguiente</button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
