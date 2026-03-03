"use client";

import { useState, useEffect, useCallback } from "react";
import Link from "next/link";

interface Estado {
  id_estado: number;
  nombre: string | null;
}

interface TipoCaso {
  id_tipocaso: number;
  nombre: string | null;
}

interface Caso {
  id_numero_caso: number;
  fecha_asignacion: string | null;
  fecha_posibleentrega: string | null;
  observaciones: string | null;
  estado: Estado | null;
  tipodecaso: TipoCaso | null;
  analista: { nombres: string | null; apellidos: string | null } | null;
  investigador: { nombres: string | null; apellidos: string | null } | null;
  afiliados: { nombre: string | null; apellido: string | null; cedula: string | null; celular: string | null; direccion: string | null }[];
}

const ESTADO_COLORS: Record<string, string> = {
  Activo: "bg-green-100 text-green-800",
  Completo: "bg-blue-100 text-blue-800",
  Suspendido: "bg-yellow-100 text-yellow-800",
  Facturado: "bg-purple-100 text-purple-800",
  PorRevisar: "bg-orange-100 text-orange-800",
  Pagado: "bg-teal-100 text-teal-800",
  PorEnviar: "bg-pink-100 text-pink-800",
};

export function CasosClient({ estados, tiposCaso }: { estados: Estado[]; tiposCaso: TipoCaso[] }) {
  const [casos, setCasos] = useState<Caso[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [estadoFilter, setEstadoFilter] = useState("");
  const [tipocasoFilter, setTipocasoFilter] = useState("");
  const [showNew, setShowNew] = useState(false);

  const fetchCasos = useCallback(async () => {
    setLoading(true);
    const params = new URLSearchParams({
      page: String(page),
      limit: "20",
      search,
      estado: estadoFilter,
      tipocaso: tipocasoFilter,
    });
    const res = await fetch(`/api/casos?${params}`);
    const data = await res.json();
    setCasos(data.casos);
    setTotal(data.total);
    setLoading(false);
  }, [page, search, estadoFilter, tipocasoFilter]);

  useEffect(() => {
    fetchCasos();
  }, [fetchCasos]);

  const totalPages = Math.ceil(total / 20);

  return (
    <div className="space-y-5">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Gestión de Casos</h1>
          <p className="text-sm text-gray-500 mt-0.5">{total.toLocaleString()} casos en total</p>
        </div>
        <button
          onClick={() => setShowNew(true)}
          className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition-colors"
        >
          <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
          </svg>
          Nuevo Caso
        </button>
      </div>

      {/* Filters */}
      <div className="bg-white rounded-xl border border-gray-200 p-4 flex flex-wrap gap-3">
        <div className="flex-1 min-w-48">
          <input
            type="text"
            placeholder="Buscar por # caso, afiliado, cédula, analista, investigador..."
            value={search}
            onChange={(e) => { setSearch(e.target.value); setPage(1); }}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
        <select
          value={estadoFilter}
          onChange={(e) => { setEstadoFilter(e.target.value); setPage(1); }}
          className="px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="">Todos los estados</option>
          {estados.map((e) => (
            <option key={e.id_estado} value={e.id_estado}>{e.nombre}</option>
          ))}
        </select>
        <select
          value={tipocasoFilter}
          onChange={(e) => { setTipocasoFilter(e.target.value); setPage(1); }}
          className="px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="">Todos los tipos</option>
          {tiposCaso.map((t) => (
            <option key={t.id_tipocaso} value={t.id_tipocaso}>{t.nombre}</option>
          ))}
        </select>
      </div>

      {/* Table */}
      <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="bg-gray-50 border-b border-gray-200">
                <th className="text-left px-4 py-3 font-semibold text-gray-600">N° Caso</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Afiliado</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Tipo</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Estado</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Analista</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Investigador</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">F. Asignación</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Acciones</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {loading ? (
                <tr>
                  <td colSpan={8} className="text-center py-10 text-gray-400">Cargando...</td>
                </tr>
              ) : casos.length === 0 ? (
                <tr>
                  <td colSpan={8} className="text-center py-10 text-gray-400">No se encontraron casos</td>
                </tr>
              ) : (
                casos.map((caso) => (
                  <tr key={caso.id_numero_caso} className="hover:bg-gray-50 transition-colors">
                    <td className="px-4 py-3 font-mono font-semibold text-blue-700">
                      #{caso.id_numero_caso}
                    </td>
                    <td className="px-4 py-3">
                      {caso.afiliados[0] ? (
                        <div>
                          <p className="font-medium text-gray-800">
                            {`${caso.afiliados[0].nombre ?? ""} ${caso.afiliados[0].apellido ?? ""}`.trim() || "—"}
                          </p>
                          {caso.afiliados[0].cedula && (
                            <p className="text-xs text-gray-500">CC: {caso.afiliados[0].cedula}</p>
                          )}
                          {caso.afiliados[0].celular && (
                            <p className="text-xs text-gray-500">Cel: {caso.afiliados[0].celular}</p>
                          )}
                          {caso.afiliados[0].direccion && (
                            <p className="text-xs text-gray-400 truncate max-w-xs">{caso.afiliados[0].direccion}</p>
                          )}
                        </div>
                      ) : (
                        <span className="text-gray-400">—</span>
                      )}
                    </td>
                    <td className="px-4 py-3 text-gray-600">{caso.tipodecaso?.nombre ?? "—"}</td>
                    <td className="px-4 py-3">
                      <span className={`inline-flex px-2 py-0.5 rounded-full text-xs font-medium ${ESTADO_COLORS[caso.estado?.nombre ?? ""] ?? "bg-gray-100 text-gray-600"}`}>
                        {caso.estado?.nombre ?? "—"}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-gray-600">
                      {caso.analista
                        ? `${caso.analista.nombres ?? ""} ${caso.analista.apellidos ?? ""}`.trim()
                        : <span className="text-gray-400">—</span>
                      }
                    </td>
                    <td className="px-4 py-3 text-gray-600">
                      {caso.investigador
                        ? `${caso.investigador.nombres ?? ""} ${caso.investigador.apellidos ?? ""}`.trim()
                        : <span className="text-gray-400">—</span>
                      }
                    </td>
                    <td className="px-4 py-3 text-gray-600">{caso.fecha_asignacion ?? "—"}</td>
                    <td className="px-4 py-3">
                      <Link
                        href={`/home/casos/${caso.id_numero_caso}`}
                        className="text-blue-600 hover:text-blue-800 font-medium text-xs"
                      >
                        Ver detalle
                      </Link>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>

        {/* Pagination */}
        {totalPages > 1 && (
          <div className="px-4 py-3 border-t border-gray-200 flex items-center justify-between text-sm text-gray-600">
            <span>Página {page} de {totalPages}</span>
            <div className="flex gap-2">
              <button
                onClick={() => setPage(p => Math.max(1, p - 1))}
                disabled={page === 1}
                className="px-3 py-1 border border-gray-300 rounded-md disabled:opacity-50 hover:bg-gray-50"
              >
                Anterior
              </button>
              <button
                onClick={() => setPage(p => Math.min(totalPages, p + 1))}
                disabled={page === totalPages}
                className="px-3 py-1 border border-gray-300 rounded-md disabled:opacity-50 hover:bg-gray-50"
              >
                Siguiente
              </button>
            </div>
          </div>
        )}
      </div>

      {/* New Caso Modal */}
      {showNew && (
        <NuevoCasoModal
          estados={estados}
          tiposCaso={tiposCaso}
          onClose={() => setShowNew(false)}
          onCreated={() => { setShowNew(false); fetchCasos(); }}
        />
      )}
    </div>
  );
}

function NuevoCasoModal({
  estados,
  tiposCaso,
  onClose,
  onCreated,
}: {
  estados: Estado[];
  tiposCaso: TipoCaso[];
  onClose: () => void;
  onCreated: () => void;
}) {
  const [form, setForm] = useState({
    id_tipocaso: "",
    id_estado: "1",
    id_analista: "",
    fecha_asignacion: "",
    fecha_posibleentrega: "",
    observaciones: "",
  });
  const [saving, setSaving] = useState(false);
  const [analistas, setAnalistas] = useState<{ id_analista: number; nombres: string | null; apellidos: string | null }[]>([]);

  useEffect(() => {
    fetch("/api/analistas").then(r => r.json()).then(setAnalistas);
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    await fetch("/api/casos", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        ...form,
        id_tipocaso: form.id_tipocaso ? parseInt(form.id_tipocaso) : null,
        id_estado: form.id_estado ? parseInt(form.id_estado) : 1,
        id_analista: form.id_analista ? parseInt(form.id_analista) : null,
      }),
    });
    setSaving(false);
    onCreated();
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl w-full max-w-lg p-6 shadow-xl">
        <div className="flex items-center justify-between mb-5">
          <h2 className="text-lg font-bold text-gray-900">Nuevo Caso</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Tipo de Caso</label>
              <select
                value={form.id_tipocaso}
                onChange={e => setForm(f => ({ ...f, id_tipocaso: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                required
              >
                <option value="">Seleccionar...</option>
                {tiposCaso.map(t => (
                  <option key={t.id_tipocaso} value={t.id_tipocaso}>{t.nombre}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Estado</label>
              <select
                value={form.id_estado}
                onChange={e => setForm(f => ({ ...f, id_estado: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                {estados.map(e => (
                  <option key={e.id_estado} value={e.id_estado}>{e.nombre}</option>
                ))}
              </select>
            </div>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Analista</label>
            <select
              value={form.id_analista}
              onChange={e => setForm(f => ({ ...f, id_analista: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Sin asignar</option>
              {analistas.map(a => (
                <option key={a.id_analista} value={a.id_analista}>
                  {`${a.nombres ?? ""} ${a.apellidos ?? ""}`.trim()}
                </option>
              ))}
            </select>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">F. Asignación</label>
              <input
                type="date"
                value={form.fecha_asignacion}
                onChange={e => setForm(f => ({ ...f, fecha_asignacion: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">F. Posible Entrega</label>
              <input
                type="date"
                value={form.fecha_posibleentrega}
                onChange={e => setForm(f => ({ ...f, fecha_posibleentrega: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Observaciones</label>
            <textarea
              value={form.observaciones}
              onChange={e => setForm(f => ({ ...f, observaciones: e.target.value }))}
              rows={3}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
            />
          </div>
          <div className="flex justify-end gap-3 pt-2">
            <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50">
              Cancelar
            </button>
            <button type="submit" disabled={saving} className="px-4 py-2 text-sm bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white rounded-lg">
              {saving ? "Guardando..." : "Crear Caso"}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
