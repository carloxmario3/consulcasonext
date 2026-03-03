"use client";

import { useState, useEffect, useCallback } from "react";
import Link from "next/link";

interface TipoInforme { id_tipoinforme: number; nombre: string | null }
interface EstadoDoc { id_estadodocus: number; nombre: string | null }
interface Informe {
  id_informe: number;
  id_numero_de_caso: number | null;
  tipoinforme: TipoInforme | null;
  estadodocus: EstadoDoc | null;
  ruta_pdf: string | null;
  ruta_word: string | null;
}

export function InformesClient({ tiposInforme, estadosDocs }: { tiposInforme: TipoInforme[]; estadosDocs: EstadoDoc[] }) {
  const [informes, setInformes] = useState<Informe[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const [loading, setLoading] = useState(true);

  const fetchInformes = useCallback(async () => {
    setLoading(true);
    const res = await fetch(`/api/informes?page=${page}&limit=25`);
    const data = await res.json();
    setInformes(data.informes);
    setTotal(data.total);
    setLoading(false);
  }, [page]);

  useEffect(() => { fetchInformes(); }, [fetchInformes]);

  const totalPages = Math.ceil(total / 25);

  return (
    <div className="space-y-5">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Informes</h1>
          <p className="text-sm text-gray-500 mt-0.5">{total.toLocaleString()} informes en total</p>
        </div>
      </div>

      <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="bg-gray-50 border-b border-gray-200">
                <th className="text-left px-4 py-3 font-semibold text-gray-600"># Informe</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600"># Caso</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Tipo</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Estado</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Archivos</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {loading ? (
                <tr><td colSpan={5} className="text-center py-10 text-gray-400">Cargando...</td></tr>
              ) : informes.map((inf) => (
                <tr key={inf.id_informe} className="hover:bg-gray-50">
                  <td className="px-4 py-3 font-mono text-gray-700">#{inf.id_informe}</td>
                  <td className="px-4 py-3">
                    {inf.id_numero_de_caso ? (
                      <Link href={`/home/casos/${inf.id_numero_de_caso}`}
                        className="text-blue-600 hover:underline font-medium">
                        #{inf.id_numero_de_caso}
                      </Link>
                    ) : "—"}
                  </td>
                  <td className="px-4 py-3 text-gray-600">{inf.tipoinforme?.nombre ?? "—"}</td>
                  <td className="px-4 py-3">
                    <span className="inline-flex px-2 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-700">
                      {inf.estadodocus?.nombre ?? "—"}
                    </span>
                  </td>
                  <td className="px-4 py-3 flex gap-3">
                    {inf.ruta_pdf && (
                      <a href={inf.ruta_pdf} target="_blank" rel="noreferrer"
                        className="text-red-600 hover:text-red-800 text-xs font-medium flex items-center gap-1">
                        <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                        PDF
                      </a>
                    )}
                    {inf.ruta_word && (
                      <a href={inf.ruta_word} target="_blank" rel="noreferrer"
                        className="text-blue-600 hover:text-blue-800 text-xs font-medium flex items-center gap-1">
                        <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                        Word
                      </a>
                    )}
                    {!inf.ruta_pdf && !inf.ruta_word && <span className="text-gray-400 text-xs">Sin archivos</span>}
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
      <div className="text-xs text-gray-400">
        Tipos de informe disponibles: {tiposInforme.map(t => t.nombre).join(", ")} &nbsp;|&nbsp;
        Estados: {estadosDocs.map(e => e.nombre).join(", ")}
      </div>
    </div>
  );
}
