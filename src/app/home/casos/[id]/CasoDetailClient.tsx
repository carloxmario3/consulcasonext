"use client";

import { useState } from "react";
import { CaratulaModal } from "./CaratulaModal";

const ESTADO_COLORS: Record<string, string> = {
  Activo: "bg-green-100 text-green-800",
  Completo: "bg-blue-100 text-blue-800",
  Suspendido: "bg-yellow-100 text-yellow-800",
  Facturado: "bg-purple-100 text-purple-800",
  PorRevisar: "bg-orange-100 text-orange-800",
  Pagado: "bg-teal-100 text-teal-800",
  PorEnviar: "bg-pink-100 text-pink-800",
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function CasoDetailClient({ caso, estados, analistas, investigadores }: any) {
  const [activeTab, setActiveTab] = useState<"info" | "afiliados">("info");
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


        </div>
      </div>
    </div>

    {showCaratula && (
      <CaratulaModal caso={caso} onClose={() => setShowCaratula(false)} />
    )}
    </>
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
