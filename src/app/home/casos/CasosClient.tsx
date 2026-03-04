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
          className="flex items-center gap-2 bg-brand hover:bg-brand-dark text-white px-4 py-2 rounded-lg text-sm font-medium transition-colors"
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
            className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand"
          />
        </div>
        <select
          value={estadoFilter}
          onChange={(e) => { setEstadoFilter(e.target.value); setPage(1); }}
          className="px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand"
        >
          <option value="">Todos los estados</option>
          {estados.map((e) => (
            <option key={e.id_estado} value={e.id_estado}>{e.nombre}</option>
          ))}
        </select>
        <select
          value={tipocasoFilter}
          onChange={(e) => { setTipocasoFilter(e.target.value); setPage(1); }}
          className="px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand"
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
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Carpeta</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Acciones</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {loading ? (
                <tr>
                  <td colSpan={9} className="text-center py-10 text-gray-400">Cargando...</td>
                </tr>
              ) : casos.length === 0 ? (
                <tr>
                  <td colSpan={9} className="text-center py-10 text-gray-400">No se encontraron casos</td>
                </tr>
              ) : (
                casos.map((caso) => (
                  <tr key={caso.id_numero_caso} className="hover:bg-gray-50 transition-colors">
                    <td className="px-4 py-3 font-mono font-semibold text-brand-dark">
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
                      <a
                        href="https://drive.google.com/drive/folders/1gQnvKriHzQNERPY8dAcehIBiYBiTb_Lf"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-green-600 hover:text-green-800 font-medium text-xs"
                      >
                        Ver carpeta
                      </a>
                    </td>
                    <td className="px-4 py-3">
                      <Link
                        href={`/home/casos/${caso.id_numero_caso}`}
                        className="text-brand hover:text-brand-dark font-medium text-xs"
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

type ReclamanteForm = {
  nombre: string; apellido: string; cedula: string; parentesco: string;
  celular: string; telefono: string; direccion: string; barrio: string;
};

const emptyReclamante = (): ReclamanteForm => ({
  nombre: "", apellido: "", cedula: "", parentesco: "",
  celular: "", telefono: "", direccion: "", barrio: "",
});

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
  const tabs = ["caso", "afiliado", "reclamantes"] as const;
  const [tab, setTab] = useState<typeof tabs[number]>("caso");
  const [casoForm, setCasoForm] = useState({
    id_tipocaso: "", id_estado: "1", id_analista: "",
    fecha_asignacion: "", fecha_posibleentrega: "", observaciones: "",
  });
  const [afiliadoForm, setAfiliadoForm] = useState({
    nombre: "", apellido: "", cedula: "", celular: "", telefono: "", direccion: "", barrio: "",
  });
  const [reclamantes, setReclamantes] = useState<ReclamanteForm[]>([]);
  const [saving, setSaving] = useState(false);
  const [analistas, setAnalistas] = useState<{ id_analista: number; nombres: string | null; apellidos: string | null }[]>([]);

  useEffect(() => {
    fetch("/api/analistas").then(r => r.json()).then(setAnalistas);
  }, []);

  const addReclamante = () => setReclamantes(rs => [...rs, emptyReclamante()]);
  const removeReclamante = (i: number) => setReclamantes(rs => rs.filter((_, idx) => idx !== i));
  const updateReclamante = (i: number, field: keyof ReclamanteForm, value: string) =>
    setReclamantes(rs => rs.map((r, idx) => idx === i ? { ...r, [field]: value } : r));

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    await fetch("/api/casos", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        ...casoForm,
        id_tipocaso: casoForm.id_tipocaso ? parseInt(casoForm.id_tipocaso) : null,
        id_estado: casoForm.id_estado ? parseInt(casoForm.id_estado) : 1,
        id_analista: casoForm.id_analista ? parseInt(casoForm.id_analista) : null,
        afiliado: (afiliadoForm.nombre || afiliadoForm.apellido || afiliadoForm.cedula) ? afiliadoForm : null,
        reclamantes: reclamantes.filter(r => r.nombre || r.apellido || r.cedula),
      }),
    });
    setSaving(false);
    onCreated();
  };

  const ic = "w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand";
  const tabIdx = tabs.indexOf(tab);
  const isLast = tabIdx === tabs.length - 1;
  const isFirst = tabIdx === 0;

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl w-full max-w-lg shadow-xl flex flex-col max-h-[90vh]">
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b border-gray-200 flex-shrink-0">
          <h2 className="text-lg font-bold text-gray-900">Nuevo Caso</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        {/* Tabs */}
        <div className="flex border-b border-gray-200 flex-shrink-0 text-sm">
          {[["caso", "Datos del Caso"], ["afiliado", "Afiliado"], ["reclamantes", `Reclamantes${reclamantes.length ? ` (${reclamantes.length})` : ""}`]].map(([id, label]) => (
            <button key={id} type="button" onClick={() => setTab(id as typeof tabs[number])}
              className={`px-5 py-2.5 font-medium transition-colors whitespace-nowrap ${tab === id ? "text-brand border-b-2 border-brand" : "text-gray-500 hover:text-gray-700"}`}>
              {label}
            </button>
          ))}
        </div>

        {/* Body */}
        <form onSubmit={handleSubmit} className="flex flex-col flex-1 overflow-hidden">
          <div className="overflow-y-auto flex-1 px-6 py-5">

            {tab === "caso" && (
              <div className="space-y-4">
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Tipo de Caso</label>
                    <select value={casoForm.id_tipocaso} onChange={e => setCasoForm(f => ({ ...f, id_tipocaso: e.target.value }))} className={ic} required>
                      <option value="">Seleccionar...</option>
                      {tiposCaso.map(t => <option key={t.id_tipocaso} value={t.id_tipocaso}>{t.nombre}</option>)}
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Estado</label>
                    <select value={casoForm.id_estado} onChange={e => setCasoForm(f => ({ ...f, id_estado: e.target.value }))} className={ic}>
                      {estados.map(e => <option key={e.id_estado} value={e.id_estado}>{e.nombre}</option>)}
                    </select>
                  </div>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Analista</label>
                  <select value={casoForm.id_analista} onChange={e => setCasoForm(f => ({ ...f, id_analista: e.target.value }))} className={ic}>
                    <option value="">Sin asignar</option>
                    {analistas.map(a => <option key={a.id_analista} value={a.id_analista}>{`${a.nombres ?? ""} ${a.apellidos ?? ""}`.trim()}</option>)}
                  </select>
                </div>
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">F. Asignación</label>
                    <input type="date" value={casoForm.fecha_asignacion} onChange={e => setCasoForm(f => ({ ...f, fecha_asignacion: e.target.value }))} className={ic} />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">F. Posible Entrega</label>
                    <input type="date" value={casoForm.fecha_posibleentrega} onChange={e => setCasoForm(f => ({ ...f, fecha_posibleentrega: e.target.value }))} className={ic} />
                  </div>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Observaciones</label>
                  <textarea value={casoForm.observaciones} onChange={e => setCasoForm(f => ({ ...f, observaciones: e.target.value }))} rows={3} className={`${ic} resize-none`} />
                </div>
              </div>
            )}

            {tab === "afiliado" && (
              <div className="space-y-4">
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Nombre</label>
                    <input value={afiliadoForm.nombre} onChange={e => setAfiliadoForm(f => ({ ...f, nombre: e.target.value }))} className={ic} placeholder="Nombre" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Apellido</label>
                    <input value={afiliadoForm.apellido} onChange={e => setAfiliadoForm(f => ({ ...f, apellido: e.target.value }))} className={ic} placeholder="Apellido" />
                  </div>
                </div>
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Cédula</label>
                    <input type="number" value={afiliadoForm.cedula} onChange={e => setAfiliadoForm(f => ({ ...f, cedula: e.target.value }))} className={ic} placeholder="Número de cédula" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Celular</label>
                    <input type="number" value={afiliadoForm.celular} onChange={e => setAfiliadoForm(f => ({ ...f, celular: e.target.value }))} className={ic} placeholder="Celular" />
                  </div>
                </div>
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Teléfono</label>
                    <input type="number" value={afiliadoForm.telefono} onChange={e => setAfiliadoForm(f => ({ ...f, telefono: e.target.value }))} className={ic} placeholder="Teléfono fijo" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Barrio</label>
                    <input value={afiliadoForm.barrio} onChange={e => setAfiliadoForm(f => ({ ...f, barrio: e.target.value }))} className={ic} placeholder="Barrio" />
                  </div>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Dirección</label>
                  <input value={afiliadoForm.direccion} onChange={e => setAfiliadoForm(f => ({ ...f, direccion: e.target.value }))} className={ic} placeholder="Dirección completa" />
                </div>
              </div>
            )}

            {tab === "reclamantes" && (
              <div className="space-y-4">
                {reclamantes.length === 0 && (
                  <p className="text-sm text-gray-400 text-center py-4">Sin reclamantes. Haz clic en &quot;Agregar&quot; para añadir uno.</p>
                )}
                {reclamantes.map((r, i) => (
                  <div key={i} className="border border-gray-200 rounded-xl p-4 space-y-3">
                    <div className="flex items-center justify-between mb-1">
                      <span className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Reclamante {i + 1}</span>
                      <button type="button" onClick={() => removeReclamante(i)} className="text-red-400 hover:text-red-600 text-xs font-medium flex items-center gap-1">
                        <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                        </svg>
                        Eliminar
                      </button>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className="block text-xs font-medium text-gray-600 mb-1">Nombre</label>
                        <input value={r.nombre} onChange={e => updateReclamante(i, "nombre", e.target.value)} className={ic} placeholder="Nombre" />
                      </div>
                      <div>
                        <label className="block text-xs font-medium text-gray-600 mb-1">Apellido</label>
                        <input value={r.apellido} onChange={e => updateReclamante(i, "apellido", e.target.value)} className={ic} placeholder="Apellido" />
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className="block text-xs font-medium text-gray-600 mb-1">Cédula</label>
                        <input type="number" value={r.cedula} onChange={e => updateReclamante(i, "cedula", e.target.value)} className={ic} placeholder="Cédula" />
                      </div>
                      <div>
                        <label className="block text-xs font-medium text-gray-600 mb-1">Parentesco</label>
                        <input value={r.parentesco} onChange={e => updateReclamante(i, "parentesco", e.target.value)} className={ic} placeholder="Ej: Esposa, Hijo..." />
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className="block text-xs font-medium text-gray-600 mb-1">Celular</label>
                        <input type="number" value={r.celular} onChange={e => updateReclamante(i, "celular", e.target.value)} className={ic} placeholder="Celular" />
                      </div>
                      <div>
                        <label className="block text-xs font-medium text-gray-600 mb-1">Teléfono</label>
                        <input type="number" value={r.telefono} onChange={e => updateReclamante(i, "telefono", e.target.value)} className={ic} placeholder="Teléfono fijo" />
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className="block text-xs font-medium text-gray-600 mb-1">Dirección</label>
                        <input value={r.direccion} onChange={e => updateReclamante(i, "direccion", e.target.value)} className={ic} placeholder="Dirección" />
                      </div>
                      <div>
                        <label className="block text-xs font-medium text-gray-600 mb-1">Barrio</label>
                        <input value={r.barrio} onChange={e => updateReclamante(i, "barrio", e.target.value)} className={ic} placeholder="Barrio" />
                      </div>
                    </div>
                  </div>
                ))}
                <button type="button" onClick={addReclamante}
                  className="w-full py-2.5 border-2 border-dashed border-gray-300 rounded-xl text-sm text-gray-500 hover:border-brand hover:text-brand transition-colors flex items-center justify-center gap-2">
                  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                  </svg>
                  Agregar reclamante
                </button>
              </div>
            )}

          </div>

          {/* Footer */}
          <div className="flex justify-between items-center px-6 py-4 border-t border-gray-200 flex-shrink-0">
            <div className="flex gap-1">
              {tabs.map(t => (
                <button key={t} type="button" onClick={() => setTab(t)}
                  className={`w-2 h-2 rounded-full transition-colors ${tab === t ? "bg-brand" : "bg-gray-300"}`} />
              ))}
            </div>
            <div className="flex gap-3">
              <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50">
                Cancelar
              </button>
              {!isFirst && (
                <button type="button" onClick={() => setTab(tabs[tabIdx - 1])} className="px-4 py-2 text-sm text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
                  ← Anterior
                </button>
              )}
              {isLast ? (
                <button type="submit" disabled={saving} className="px-4 py-2 text-sm bg-brand hover:bg-brand-dark disabled:opacity-60 text-white rounded-lg">
                  {saving ? "Guardando..." : "Crear Caso"}
                </button>
              ) : (
                <button type="button" onClick={() => setTab(tabs[tabIdx + 1])} className="px-4 py-2 text-sm bg-brand hover:bg-brand-dark text-white rounded-lg">
                  Siguiente →
                </button>
              )}
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}
