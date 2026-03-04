"use client";

import { useState, useEffect } from "react";
import { CaratulaModal } from "./CaratulaModal";

interface ReclamanteType {
  id_reclamantes: number;
  nombre?: string | null;
  apellido?: string | null;
  cedula?: string | null;
  celular?: string | null;
  telefono?: number | null;
  parentesco?: string | null;
  direccion?: string | null;
  barrio?: string | null;
}

interface ArchivoType {
  nid_enlace: string;
  t_nombre_archivo?: string | null;
  t_numero_caso?: string | null;
  t_carpeta?: string | null;
  t_enlace?: string | null;
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

const CARPETA_COLORS: Record<string, string> = {
  Informes: "bg-blue-100 text-blue-800",
  Anexos: "bg-orange-100 text-orange-800",
  Videos: "bg-purple-100 text-purple-800",
  Recuinve: "bg-gray-100 text-gray-700",
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function CasoDetailClient({ caso, estados, analistas, investigadores }: any) {
  const [activeTab, setActiveTab] = useState<"info" | "afiliados" | "reclamantes" | "archivos">("info");
  const [showNuevoReclamante, setShowNuevoReclamante] = useState(false);
  const [editingReclamante, setEditingReclamante] = useState<ReclamanteType | null>(null);
  const [deletingReclamanteId, setDeletingReclamanteId] = useState<number | null>(null);
  const [reclamantes, setReclamantes] = useState<ReclamanteType[]>(caso.reclamantes ?? []);
  const [archivos, setArchivos] = useState<ArchivoType[]>([]);
  const [showNuevoArchivo, setShowNuevoArchivo] = useState(false);

  useEffect(() => {
    fetch(`/api/casos/${caso.id_numero_caso}/archivos`)
      .then((r) => r.json())
      .then((data) => setArchivos(Array.isArray(data) ? data : []))
      .catch(() => {});
  }, [caso.id_numero_caso]);

  const reloadArchivos = async () => {
    const res = await fetch(`/api/casos/${caso.id_numero_caso}/archivos`);
    const data = await res.json();
    setArchivos(Array.isArray(data) ? data : []);
  };

  const reloadReclamantes = async () => {
    const res = await fetch(`/api/casos/${caso.id_numero_caso}/reclamantes`);
    const data = await res.json();
    setReclamantes(data);
  };

  const handleDeleteReclamante = async (id: number) => {
    await fetch(`/api/reclamantes/${id}`, { method: "DELETE" });
    setDeletingReclamanteId(null);
    reloadReclamantes();
  };
  const [editing, setEditing] = useState(false);
  const [form, setForm] = useState({
    id_estado: String(caso.id_estado ?? ""),
    id_analista: String(caso.id_analista ?? ""),
    id_investigador: String(caso.id_investigador ?? ""),
    fecha_asignacion: caso.fecha_asignacion ?? "",
    fecha_posibleentrega: caso.fecha_posibleentrega ?? "",
    fecha_entregareal: caso.fecha_entregareal ?? "",
    observaciones: caso.observaciones ?? "",
  });
  const [saving, setSaving] = useState(false);
  const [showCaratula, setShowCaratula] = useState(false);

  const handleSave = async () => {
    setSaving(true);
    await fetch(`/api/casos/${caso.id_numero_caso}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        ...form,
        id_estado: form.id_estado ? parseInt(form.id_estado) : null,
        id_analista: form.id_analista ? parseInt(form.id_analista) : null,
        id_investigador: form.id_investigador ? parseInt(form.id_investigador) : null,
        id_tipocaso: caso.id_tipocaso,
      }),
    });
    setSaving(false);
    setEditing(false);
    window.location.reload();
  };

  const tabs = [
    { id: "info", label: "Información" },
    { id: "afiliados", label: `Afiliados (${caso.afiliados?.length ?? 0})` },
    { id: "reclamantes", label: `Reclamantes (${reclamantes.length})` },
    { id: "archivos", label: `Archivos (${archivos.length})` },
  ];

  return (
    <>
    <div className="space-y-5">
      {/* Header */}
      <div className="bg-white rounded-xl border border-gray-200 p-5">
        <div className="flex items-start justify-between">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Caso #{caso.id_numero_caso}</h1>
            <div className="flex items-center gap-3 mt-2">
              <span className={`inline-flex px-2.5 py-0.5 rounded-full text-xs font-medium ${ESTADO_COLORS[caso.estado?.nombre ?? ""] ?? "bg-gray-100 text-gray-600"}`}>
                {caso.estado?.nombre ?? "Sin estado"}
              </span>
              <span className="text-sm text-gray-500">{caso.tipodecaso?.nombre ?? "Sin tipo"}</span>
              {caso.tipodecaso?.clasedecaso && (
                <span className="text-sm text-gray-400">• {caso.tipodecaso.clasedecaso.nombre}</span>
              )}
            </div>
          </div>
          <div className="flex items-center gap-2">
            <button
              onClick={() => setShowCaratula(true)}
              className="flex items-center gap-2 px-4 py-2 rounded-lg text-sm font-medium bg-gray-100 text-gray-700 hover:bg-gray-200 transition-colors"
            >
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2}
                  d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
              </svg>
              Imprimir Carátula
            </button>
            <button
              onClick={() => setEditing(!editing)}
              className={`flex items-center gap-2 px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                editing
                  ? "bg-gray-100 text-gray-700 hover:bg-gray-200"
                  : "bg-blue-600 text-white hover:bg-blue-700"
              }`}
            >
              {editing ? "Cancelar" : "Editar"}
            </button>
          </div>
        </div>
      </div>

      {/* Tabs */}
      <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
        <div className="flex border-b border-gray-200 overflow-x-auto">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id as typeof activeTab)}
              className={`px-5 py-3 text-sm font-medium whitespace-nowrap transition-colors ${
                activeTab === tab.id
                  ? "text-blue-600 border-b-2 border-blue-600"
                  : "text-gray-500 hover:text-gray-700"
              }`}
            >
              {tab.label}
            </button>
          ))}
        </div>

        <div className="p-5">
          {activeTab === "info" && (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              {editing ? (
                <>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Estado</label>
                    <select value={form.id_estado} onChange={e => setForm(f => ({ ...f, id_estado: e.target.value }))}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                      {estados.map((e: { id_estado: number; nombre: string }) => (
                        <option key={e.id_estado} value={e.id_estado}>{e.nombre}</option>
                      ))}
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Analista</label>
                    <select value={form.id_analista} onChange={e => setForm(f => ({ ...f, id_analista: e.target.value }))}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                      <option value="">Sin asignar</option>
                      {analistas.map((a: { id_analista: number; nombres: string; apellidos: string }) => (
                        <option key={a.id_analista} value={a.id_analista}>{`${a.nombres ?? ""} ${a.apellidos ?? ""}`.trim()}</option>
                      ))}
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Investigador</label>
                    <select value={form.id_investigador} onChange={e => setForm(f => ({ ...f, id_investigador: e.target.value }))}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                      <option value="">Sin asignar</option>
                      {investigadores.map((i: { id_investigador: number; nombres: string; apellidos: string }) => (
                        <option key={i.id_investigador} value={i.id_investigador}>{`${i.nombres ?? ""} ${i.apellidos ?? ""}`.trim()}</option>
                      ))}
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">F. Asignación</label>
                    <input type="date" value={form.fecha_asignacion} onChange={e => setForm(f => ({ ...f, fecha_asignacion: e.target.value }))}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">F. Posible Entrega</label>
                    <input type="date" value={form.fecha_posibleentrega} onChange={e => setForm(f => ({ ...f, fecha_posibleentrega: e.target.value }))}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">F. Entrega Real</label>
                    <input type="date" value={form.fecha_entregareal} onChange={e => setForm(f => ({ ...f, fecha_entregareal: e.target.value }))}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" />
                  </div>
                  <div className="md:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Observaciones</label>
                    <textarea value={form.observaciones} onChange={e => setForm(f => ({ ...f, observaciones: e.target.value }))}
                      rows={4} className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none" />
                  </div>
                  <div className="md:col-span-2 flex justify-end gap-3">
                    <button onClick={() => setEditing(false)} className="px-4 py-2 text-sm text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50">Cancelar</button>
                    <button onClick={handleSave} disabled={saving} className="px-4 py-2 text-sm bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white rounded-lg">
                      {saving ? "Guardando..." : "Guardar cambios"}
                    </button>
                  </div>
                </>
              ) : (
                <>
                  <InfoRow label="Analista" value={caso.analista ? `${caso.analista.nombres ?? ""} ${caso.analista.apellidos ?? ""}`.trim() : "—"} />
                  <InfoRow label="Investigador" value={caso.investigador ? `${caso.investigador.nombres ?? ""} ${caso.investigador.apellidos ?? ""}`.trim() : "—"} />
                  <InfoRow label="F. Asignación" value={caso.fecha_asignacion ?? "—"} />
                  <InfoRow label="F. Posible Entrega" value={caso.fecha_posibleentrega ?? "—"} />
                  <InfoRow label="F. Entrega Real" value={caso.fecha_entregareal ?? "—"} />
                  <div className="md:col-span-2">
                    <InfoRow label="Observaciones" value={caso.observaciones ?? "—"} />
                  </div>
                </>
              )}
            </div>
          )}

          {activeTab === "afiliados" && (
            <div className="space-y-3">
              {caso.afiliados?.length === 0 ? (
                <p className="text-gray-400 text-sm">Sin afiliados registrados</p>
              ) : (
                caso.afiliados?.map((a: { id_afiliado: number; nombre: string; apellido: string; cedula: string; celular: string; telefono: string; direccion: string }) => (
                  <div key={a.id_afiliado} className="border border-gray-200 rounded-lg p-4 grid grid-cols-2 md:grid-cols-3 gap-3 text-sm">
                    <InfoRow label="Nombre" value={`${a.nombre ?? ""} ${a.apellido ?? ""}`.trim()} />
                    <InfoRow label="Cédula" value={String(a.cedula ?? "—")} />
                    <InfoRow label="Celular" value={String(a.celular ?? "—")} />
                    <InfoRow label="Teléfono" value={String(a.telefono ?? "—")} />
                    <InfoRow label="Dirección" value={a.direccion ?? "—"} />
                  </div>
                ))
              )}
            </div>
          )}

          {activeTab === "archivos" && (
            <div className="space-y-4">
              <div className="flex justify-end">
                <button
                  onClick={() => setShowNuevoArchivo(true)}
                  className="flex items-center gap-2 px-3 py-1.5 text-sm bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium"
                >
                  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                  </svg>
                  Agregar archivo
                </button>
              </div>
              {archivos.length === 0 ? (
                <p className="text-gray-400 text-sm">Sin archivos registrados</p>
              ) : (
                (() => {
                  const grouped: Record<string, ArchivoType[]> = {};
                  for (const a of archivos) {
                    const carpeta = a.t_carpeta ?? "Sin carpeta";
                    if (!grouped[carpeta]) grouped[carpeta] = [];
                    grouped[carpeta].push(a);
                  }
                  return Object.entries(grouped).map(([carpeta, items]) => (
                    <div key={carpeta}>
                      <div className="flex items-center gap-2 mb-2">
                        <span className={`inline-flex px-2.5 py-0.5 rounded-full text-xs font-semibold ${CARPETA_COLORS[carpeta] ?? "bg-gray-100 text-gray-600"}`}>
                          {carpeta}
                        </span>
                      </div>
                      <div className="space-y-2">
                        {items.map((archivo) => {
                          const tieneEnlace = archivo.t_enlace && archivo.t_enlace !== "GenerandoEnlace";
                          return (
                            <div key={archivo.nid_enlace} className="flex items-center justify-between border border-gray-200 rounded-lg px-4 py-3 text-sm">
                              <span className="text-gray-800 font-medium truncate">{archivo.t_nombre_archivo ?? "Sin nombre"}</span>
                              {tieneEnlace && (
                                <div className="flex items-center gap-2 flex-shrink-0 ml-3">
                                  <a
                                    href={`https://drive.google.com/file/d/${archivo.t_enlace}/view?usp=sharing`}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="text-xs text-blue-600 hover:text-blue-800 border border-blue-200 hover:border-blue-400 px-2 py-1 rounded-md transition-colors"
                                  >
                                    Ver
                                  </a>
                                  <a
                                    href={`https://drive.google.com/uc?export=download&id=${archivo.t_enlace}`}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="text-xs text-gray-500 hover:text-gray-700 border border-gray-200 hover:border-gray-400 px-2 py-1 rounded-md transition-colors"
                                  >
                                    Descargar
                                  </a>
                                </div>
                              )}
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  ));
                })()
              )}
            </div>
          )}

          {activeTab === "reclamantes" && (
            <div className="space-y-3">
              <div className="flex justify-end">
                <button
                  onClick={() => setShowNuevoReclamante(true)}
                  className="flex items-center gap-2 px-3 py-1.5 text-sm bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium"
                >
                  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                  </svg>
                  Agregar Reclamante
                </button>
              </div>
              {reclamantes.length === 0 ? (
                <p className="text-gray-400 text-sm">Sin reclamantes registrados</p>
              ) : (
                reclamantes.map((r) => (
                  <div key={r.id_reclamantes} className="border border-gray-200 rounded-lg p-4 text-sm">
                    <div className="flex items-start justify-between mb-3">
                      <p className="font-semibold text-gray-800">
                        {`${r.nombre ?? ""} ${r.apellido ?? ""}`.trim() || "—"}
                        {r.parentesco && <span className="ml-2 text-xs font-normal text-blue-600 bg-blue-50 px-2 py-0.5 rounded-full">{r.parentesco}</span>}
                      </p>
                      <div className="flex gap-2 flex-shrink-0 ml-3">
                        <button
                          onClick={() => setEditingReclamante(r)}
                          className="text-xs text-gray-500 hover:text-blue-600 border border-gray-200 hover:border-blue-300 px-2 py-1 rounded-md transition-colors"
                        >
                          Editar
                        </button>
                        <button
                          onClick={() => setDeletingReclamanteId(r.id_reclamantes)}
                          className="text-xs text-gray-500 hover:text-red-600 border border-gray-200 hover:border-red-300 px-2 py-1 rounded-md transition-colors"
                        >
                          Eliminar
                        </button>
                      </div>
                    </div>
                    <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                      <InfoRow label="Cédula" value={r.cedula ? String(r.cedula) : "—"} />
                      <InfoRow label="Celular" value={r.celular ? String(r.celular) : "—"} />
                      <InfoRow label="Teléfono" value={r.telefono ? String(r.telefono) : "—"} />
                      <InfoRow label="Barrio" value={r.barrio ?? "—"} />
                      <div className="md:col-span-2">
                        <InfoRow label="Dirección" value={r.direccion ?? "—"} />
                      </div>
                    </div>
                  </div>
                ))
              )}
            </div>
          )}


        </div>
      </div>
    </div>

    {showCaratula && (
      <CaratulaModal caso={caso} onClose={() => setShowCaratula(false)} />
    )}

    {showNuevoReclamante && (
      <ReclamanteModal
        casoId={caso.id_numero_caso}
        onClose={() => setShowNuevoReclamante(false)}
        onSaved={() => { setShowNuevoReclamante(false); reloadReclamantes(); }}
      />
    )}

    {editingReclamante && (
      <ReclamanteModal
        casoId={caso.id_numero_caso}
        initial={editingReclamante}
        onClose={() => setEditingReclamante(null)}
        onSaved={() => { setEditingReclamante(null); reloadReclamantes(); }}
      />
    )}

    {deletingReclamanteId !== null && (
      <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
        <div className="bg-white rounded-2xl w-full max-w-sm p-6 shadow-xl">
          <h3 className="text-base font-bold text-gray-900 mb-2">¿Eliminar reclamante?</h3>
          <p className="text-sm text-gray-500 mb-5">Esta acción no se puede deshacer.</p>
          <div className="flex justify-end gap-3">
            <button onClick={() => setDeletingReclamanteId(null)} className="px-4 py-2 text-sm text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50">
              Cancelar
            </button>
            <button onClick={() => handleDeleteReclamante(deletingReclamanteId)} className="px-4 py-2 text-sm bg-red-600 hover:bg-red-700 text-white rounded-lg">
              Eliminar
            </button>
          </div>
        </div>
      </div>
    )}

    {showNuevoArchivo && (
      <ArchivoModal
        casoId={caso.id_numero_caso}
        onClose={() => setShowNuevoArchivo(false)}
        onSaved={() => { setShowNuevoArchivo(false); reloadArchivos(); }}
      />
    )}
    </>
  );
}

function ReclamanteModal({
  casoId,
  initial,
  onClose,
  onSaved,
}: {
  casoId: number;
  initial?: ReclamanteType;
  onClose: () => void;
  onSaved: () => void;
}) {
  const isEdit = !!initial;
  const [form, setForm] = useState({
    nombre:     initial?.nombre     ?? "",
    apellido:   initial?.apellido   ?? "",
    cedula:     initial?.cedula     ? String(initial.cedula) : "",
    celular:    initial?.celular    ? String(initial.celular) : "",
    telefono:   initial?.telefono   ? String(initial.telefono) : "",
    parentesco: initial?.parentesco ?? "",
    direccion:  initial?.direccion  ?? "",
    barrio:     initial?.barrio     ?? "",
  });
  const [saving, setSaving] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    if (isEdit) {
      await fetch(`/api/reclamantes/${initial!.id_reclamantes}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(form),
      });
    } else {
      await fetch(`/api/casos/${casoId}/reclamantes`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(form),
      });
    }
    setSaving(false);
    onSaved();
  };

  const ic = "w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500";

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl w-full max-w-lg shadow-xl flex flex-col max-h-[90vh]">
        <div className="flex items-center justify-between px-6 py-4 border-b border-gray-200 flex-shrink-0">
          <h2 className="text-lg font-bold text-gray-900">{isEdit ? "Editar Reclamante" : "Nuevo Reclamante"}</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
        <form onSubmit={handleSubmit} className="flex flex-col flex-1 overflow-hidden">
          <div className="overflow-y-auto flex-1 px-6 py-5 space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nombre</label>
                <input value={form.nombre} onChange={e => setForm(f => ({ ...f, nombre: e.target.value }))} className={ic} placeholder="Nombre" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Apellido</label>
                <input value={form.apellido} onChange={e => setForm(f => ({ ...f, apellido: e.target.value }))} className={ic} placeholder="Apellido" />
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Cédula</label>
                <input type="number" value={form.cedula} onChange={e => setForm(f => ({ ...f, cedula: e.target.value }))} className={ic} placeholder="Número de cédula" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Parentesco</label>
                <input value={form.parentesco} onChange={e => setForm(f => ({ ...f, parentesco: e.target.value }))} className={ic} placeholder="Ej: Esposa, Hijo, Madre..." />
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Celular</label>
                <input type="number" value={form.celular} onChange={e => setForm(f => ({ ...f, celular: e.target.value }))} className={ic} placeholder="Celular" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Teléfono</label>
                <input type="number" value={form.telefono} onChange={e => setForm(f => ({ ...f, telefono: e.target.value }))} className={ic} placeholder="Teléfono fijo" />
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Dirección</label>
                <input value={form.direccion} onChange={e => setForm(f => ({ ...f, direccion: e.target.value }))} className={ic} placeholder="Dirección" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Barrio</label>
                <input value={form.barrio} onChange={e => setForm(f => ({ ...f, barrio: e.target.value }))} className={ic} placeholder="Barrio" />
              </div>
            </div>
          </div>
          <div className="flex justify-end gap-3 px-6 py-4 border-t border-gray-200 flex-shrink-0">
            <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50">
              Cancelar
            </button>
            <button type="submit" disabled={saving} className="px-4 py-2 text-sm bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white rounded-lg">
              {saving ? "Guardando..." : isEdit ? "Guardar cambios" : "Crear"}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

function ArchivoModal({
  casoId,
  onClose,
  onSaved,
}: {
  casoId: number;
  onClose: () => void;
  onSaved: () => void;
}) {
  const [form, setForm] = useState({ nombre: "", carpeta: "Informes", enlace: "" });
  const [saving, setSaving] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    await fetch(`/api/casos/${casoId}/archivos`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(form),
    });
    setSaving(false);
    onSaved();
  };

  const ic = "w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500";

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl w-full max-w-md shadow-xl flex flex-col">
        <div className="flex items-center justify-between px-6 py-4 border-b border-gray-200">
          <h2 className="text-lg font-bold text-gray-900">Agregar archivo</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
        <form onSubmit={handleSubmit} className="px-6 py-5 space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Nombre del archivo</label>
            <input
              value={form.nombre}
              onChange={e => setForm(f => ({ ...f, nombre: e.target.value }))}
              className={ic}
              placeholder="Ej: Informe final"
              required
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Carpeta</label>
            <select
              value={form.carpeta}
              onChange={e => setForm(f => ({ ...f, carpeta: e.target.value }))}
              className={ic}
            >
              <option>Informes</option>
              <option>Anexos</option>
              <option>Videos</option>
              <option>Recuinve</option>
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Link o ID de Google Drive</label>
            <input
              value={form.enlace}
              onChange={e => setForm(f => ({ ...f, enlace: e.target.value }))}
              className={ic}
              placeholder="https://drive.google.com/file/d/… o solo el ID"
              required
            />
          </div>
          <div className="flex justify-end gap-3 pt-2">
            <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50">
              Cancelar
            </button>
            <button type="submit" disabled={saving} className="px-4 py-2 text-sm bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white rounded-lg">
              {saving ? "Guardando..." : "Guardar"}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

function InfoRow({ label, value }: { label: string; value: string }) {
  return (
    <div>
      <p className="text-xs font-medium text-gray-500 uppercase tracking-wide">{label}</p>
      <p className="text-sm text-gray-800 mt-0.5">{value}</p>
    </div>
  );
}
