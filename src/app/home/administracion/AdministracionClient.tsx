"use client";

import { useState } from "react";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function AdministracionClient({ analistas, investigadores, usuarios }: any) {
  const [tab, setTab] = useState<"usuarios" | "analistas" | "investigadores">("usuarios");

  return (
    <div className="space-y-5">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Administración</h1>
        <p className="text-sm text-gray-500 mt-0.5">Gestión de usuarios, analistas e investigadores</p>
      </div>

      {/* Stats cards */}
      <div className="grid grid-cols-3 gap-4">
        {[
          { label: "Usuarios del sistema", value: usuarios.length, icon: "👤" },
          { label: "Analistas", value: analistas.length, icon: "📊" },
          { label: "Investigadores activos", value: investigadores.filter((i: { activo: boolean }) => i.activo).length, icon: "🔍" },
        ].map((s) => (
          <div key={s.label} className="bg-white rounded-xl border border-gray-200 p-4">
            <div className="flex items-center gap-3">
              <span className="text-2xl">{s.icon}</span>
              <div>
                <p className="text-xl font-bold text-gray-900">{s.value}</p>
                <p className="text-xs text-gray-500">{s.label}</p>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Tabs */}
      <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
        <div className="flex border-b border-gray-200">
          {(["usuarios", "analistas", "investigadores"] as const).map((t) => (
            <button key={t} onClick={() => setTab(t)}
              className={`px-5 py-3 text-sm font-medium capitalize transition-colors ${
                tab === t ? "text-brand border-b-2 border-brand" : "text-gray-500 hover:text-gray-700"
              }`}>
              {t === "usuarios" ? "Usuarios" : t === "analistas" ? "Analistas" : "Investigadores"}
            </button>
          ))}
        </div>

        <div className="p-5">
          {tab === "usuarios" && (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="bg-gray-50 border-b border-gray-200">
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Usuario</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Email</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Roles</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Estado</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Creado</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {usuarios.map((u: { userid: string; username: string; membership?: { email?: string; isapproved?: boolean; createdate?: string }; usersinroles?: { role?: { rolename?: string } }[] }) => (
                    <tr key={u.userid} className="hover:bg-gray-50">
                      <td className="px-3 py-2.5 font-medium text-gray-800">{u.username}</td>
                      <td className="px-3 py-2.5 text-gray-600">{u.membership?.email ?? "—"}</td>
                      <td className="px-3 py-2.5">
                        <div className="flex flex-wrap gap-1">
                          {u.usersinroles?.map((ur: { role?: { rolename?: string } }) => (
                            <span key={ur.role?.rolename}
                              className="inline-flex px-1.5 py-0.5 rounded text-xs font-medium bg-blue-100 text-blue-800">
                              {ur.role?.rolename}
                            </span>
                          )) ?? "—"}
                        </div>
                      </td>
                      <td className="px-3 py-2.5">
                        <span className={`inline-flex px-2 py-0.5 rounded-full text-xs font-medium ${
                          u.membership?.isapproved ? "bg-green-100 text-green-800" : "bg-red-100 text-red-800"
                        }`}>
                          {u.membership?.isapproved ? "Activo" : "Inactivo"}
                        </span>
                      </td>
                      <td className="px-3 py-2.5 text-gray-500 text-xs">
                        {u.membership?.createdate
                          ? new Date(u.membership.createdate).toLocaleDateString("es-CO")
                          : "—"}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}

          {tab === "analistas" && (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="bg-gray-50 border-b border-gray-200">
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Nombre</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Correo</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Celular</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Empresa / Oficina</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {analistas.map((a: { id_analista: number; nombres: string; apellidos: string; correo: string; celular: number; oficina?: { compania?: { nombre?: string }; id_oficina: number } }) => (
                    <tr key={a.id_analista} className="hover:bg-gray-50">
                      <td className="px-3 py-2.5 font-medium text-gray-800">
                        {`${a.nombres ?? ""} ${a.apellidos ?? ""}`.trim() || "—"}
                      </td>
                      <td className="px-3 py-2.5 text-gray-600">{a.correo ?? "—"}</td>
                      <td className="px-3 py-2.5 text-gray-600">{a.celular ? String(a.celular) : "—"}</td>
                      <td className="px-3 py-2.5 text-gray-600">
                        {a.oficina?.compania?.nombre ?? "—"}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}

          {tab === "investigadores" && (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="bg-gray-50 border-b border-gray-200">
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Nombre</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Cédula</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Celular</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Correo</th>
                    <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Estado</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {investigadores.map((inv: { id_investigador: number; nombres: string; apellidos: string; cedula: number; celular: number; correo: string; activo: boolean }) => (
                    <tr key={inv.id_investigador} className="hover:bg-gray-50">
                      <td className="px-3 py-2.5 font-medium text-gray-800">
                        {`${inv.nombres ?? ""} ${inv.apellidos ?? ""}`.trim() || "—"}
                      </td>
                      <td className="px-3 py-2.5 text-gray-600 font-mono">{inv.cedula ? String(inv.cedula) : "—"}</td>
                      <td className="px-3 py-2.5 text-gray-600">{inv.celular ? String(inv.celular) : "—"}</td>
                      <td className="px-3 py-2.5 text-gray-600">{inv.correo ?? "—"}</td>
                      <td className="px-3 py-2.5">
                        <span className={`inline-flex px-2 py-0.5 rounded-full text-xs font-medium ${
                          inv.activo ? "bg-green-100 text-green-800" : "bg-red-100 text-red-800"
                        }`}>
                          {inv.activo ? "Activo" : "Inactivo"}
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
