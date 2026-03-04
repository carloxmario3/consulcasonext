"use client";

import { useState, useCallback, useMemo } from "react";

type Usuario = {
  userid: string;
  username: string;
  membership?: { email?: string; isapproved?: boolean; createdate?: string };
  usersinroles?: { role?: { rolename?: string } }[];
};

type Role = { roleid: string; rolename: string };
type TipoCaso = { id_tipocaso: number; nombre: string | null; id_clasecaso: number | null; clasedecaso?: { id_clasecaso: number; nombre: string | null } | null };
type ClaseCaso = { id_clasecaso: number; nombre: string | null };
type Estado = { id_estado: number; nombre: string | null };

type Tab = "usuarios" | "tiposCaso" | "estados";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function AdministracionClient({ usuarios: initialUsuarios, roles, tiposCaso: initialTipos, clasesCaso, estados: initialEstados }: any) {
  const [tab, setTab] = useState<Tab>("usuarios");

  // === USUARIOS ===
  const [usuarios, setUsuarios] = useState<Usuario[]>(initialUsuarios);
  const [modalOpen, setModalOpen] = useState(false);
  const [deleteModal, setDeleteModal] = useState<Usuario | null>(null);
  const [editingUser, setEditingUser] = useState<Usuario | null>(null);
  const [saving, setSaving] = useState(false);
  const [filterRole, setFilterRole] = useState("");
  const [filterStatus, setFilterStatus] = useState<"" | "activo" | "inactivo">("");
  const [formUsername, setFormUsername] = useState("");
  const [formEmail, setFormEmail] = useState("");
  const [formPassword, setFormPassword] = useState("");
  const [formRoles, setFormRoles] = useState<string[]>([]);
  const [formActive, setFormActive] = useState(true);
  const [formError, setFormError] = useState("");

  // === TIPOS DE CASO ===
  const [tiposCaso, setTiposCaso] = useState<TipoCaso[]>(initialTipos);
  const [tipoModal, setTipoModal] = useState(false);
  const [editingTipo, setEditingTipo] = useState<TipoCaso | null>(null);
  const [deleteTipoModal, setDeleteTipoModal] = useState<TipoCaso | null>(null);
  const [tipoNombre, setTipoNombre] = useState("");
  const [tipoClase, setTipoClase] = useState<number | "">("");
  const [tipoError, setTipoError] = useState("");

  // === ESTADOS ===
  const [estados, setEstados] = useState<Estado[]>(initialEstados);
  const [estadoModal, setEstadoModal] = useState(false);
  const [editingEstado, setEditingEstado] = useState<Estado | null>(null);
  const [deleteEstadoModal, setDeleteEstadoModal] = useState<Estado | null>(null);
  const [estadoNombre, setEstadoNombre] = useState("");
  const [estadoError, setEstadoError] = useState("");

  const allRoles = (roles as Role[]) ?? [];
  const allClases = (clasesCaso as ClaseCaso[]) ?? [];

  // --- Usuarios logic ---
  const filteredUsuarios = useMemo(() => {
    return usuarios.filter((u) => {
      if (filterRole && !u.usersinroles?.some((ur) => ur.role?.rolename === filterRole)) return false;
      if (filterStatus === "activo" && !u.membership?.isapproved) return false;
      if (filterStatus === "inactivo" && u.membership?.isapproved) return false;
      return true;
    });
  }, [usuarios, filterRole, filterStatus]);

  const reloadUsuarios = useCallback(async () => {
    const res = await fetch("/api/usuarios");
    if (res.ok) setUsuarios(await res.json());
  }, []);

  const openCreateModal = () => {
    setEditingUser(null); setFormUsername(""); setFormEmail(""); setFormPassword("");
    setFormRoles([]); setFormActive(true); setFormError(""); setModalOpen(true);
  };

  const openEditModal = (u: Usuario) => {
    setEditingUser(u); setFormUsername(u.username); setFormEmail(u.membership?.email ?? "");
    setFormPassword(""); setFormRoles(u.usersinroles?.map((ur) => ur.role?.rolename ?? "").filter(Boolean) ?? []);
    setFormActive(u.membership?.isapproved ?? true); setFormError(""); setModalOpen(true);
  };

  const toggleRole = (rolename: string) => {
    setFormRoles((prev) => prev.includes(rolename) ? prev.filter((r) => r !== rolename) : [...prev, rolename]);
  };

  const handleSaveUser = async () => {
    setFormError(""); setSaving(true);
    try {
      if (editingUser) {
        const body: { roles: string[]; isapproved: boolean; password?: string } = { roles: formRoles, isapproved: formActive };
        if (formPassword) body.password = formPassword;
        const res = await fetch(`/api/usuarios/${editingUser.userid}`, { method: "PUT", headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) });
        if (!res.ok) { setFormError((await res.json()).error || "Error al actualizar"); return; }
      } else {
        if (!formUsername || !formEmail || !formPassword) { setFormError("Todos los campos son requeridos"); return; }
        const res = await fetch("/api/usuarios", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ username: formUsername, email: formEmail, password: formPassword, roles: formRoles }) });
        if (!res.ok) { setFormError((await res.json()).error || "Error al crear usuario"); return; }
      }
      setModalOpen(false); await reloadUsuarios();
    } catch { setFormError("Error de conexión"); } finally { setSaving(false); }
  };

  const handleDeleteUser = async () => {
    if (!deleteModal) return; setSaving(true);
    try { const res = await fetch(`/api/usuarios/${deleteModal.userid}`, { method: "DELETE" }); if (res.ok) { setDeleteModal(null); await reloadUsuarios(); } }
    catch {} finally { setSaving(false); }
  };

  // --- Tipos de caso logic ---
  const reloadTipos = useCallback(async () => {
    const res = await fetch("/api/tipos-caso");
    if (res.ok) setTiposCaso(await res.json());
  }, []);

  const openCreateTipo = () => { setEditingTipo(null); setTipoNombre(""); setTipoClase(""); setTipoError(""); setTipoModal(true); };
  const openEditTipo = (t: TipoCaso) => { setEditingTipo(t); setTipoNombre(t.nombre ?? ""); setTipoClase(t.id_clasecaso ?? ""); setTipoError(""); setTipoModal(true); };

  const handleSaveTipo = async () => {
    setTipoError(""); setSaving(true);
    try {
      if (!tipoNombre.trim()) { setTipoError("El nombre es requerido"); return; }
      const body = { nombre: tipoNombre.trim(), id_clasecaso: tipoClase || null };
      const url = editingTipo ? `/api/tipos-caso/${editingTipo.id_tipocaso}` : "/api/tipos-caso";
      const res = await fetch(url, { method: editingTipo ? "PUT" : "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) });
      if (!res.ok) { setTipoError((await res.json()).error || "Error"); return; }
      setTipoModal(false); await reloadTipos();
    } catch { setTipoError("Error de conexión"); } finally { setSaving(false); }
  };

  const handleDeleteTipo = async () => {
    if (!deleteTipoModal) return; setSaving(true);
    try {
      const res = await fetch(`/api/tipos-caso/${deleteTipoModal.id_tipocaso}`, { method: "DELETE" });
      if (!res.ok) { const data = await res.json(); alert(data.error || "Error al eliminar"); } else { await reloadTipos(); }
      setDeleteTipoModal(null);
    } catch {} finally { setSaving(false); }
  };

  // --- Estados logic ---
  const reloadEstados = useCallback(async () => {
    const res = await fetch("/api/estados");
    if (res.ok) setEstados(await res.json());
  }, []);

  const openCreateEstado = () => { setEditingEstado(null); setEstadoNombre(""); setEstadoError(""); setEstadoModal(true); };
  const openEditEstado = (e: Estado) => { setEditingEstado(e); setEstadoNombre(e.nombre ?? ""); setEstadoError(""); setEstadoModal(true); };

  const handleSaveEstado = async () => {
    setEstadoError(""); setSaving(true);
    try {
      if (!estadoNombre.trim()) { setEstadoError("El nombre es requerido"); return; }
      const url = editingEstado ? `/api/estados/${editingEstado.id_estado}` : "/api/estados";
      const res = await fetch(url, { method: editingEstado ? "PUT" : "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ nombre: estadoNombre.trim() }) });
      if (!res.ok) { setEstadoError((await res.json()).error || "Error"); return; }
      setEstadoModal(false); await reloadEstados();
    } catch { setEstadoError("Error de conexión"); } finally { setSaving(false); }
  };

  const handleDeleteEstado = async () => {
    if (!deleteEstadoModal) return; setSaving(true);
    try {
      const res = await fetch(`/api/estados/${deleteEstadoModal.id_estado}`, { method: "DELETE" });
      if (!res.ok) { const data = await res.json(); alert(data.error || "Error al eliminar"); } else { await reloadEstados(); }
      setDeleteEstadoModal(null);
    } catch {} finally { setSaving(false); }
  };

  const activeCount = usuarios.filter((u) => u.membership?.isapproved).length;

  return (
    <div className="space-y-5">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Administración</h1>
        <p className="text-sm text-gray-500 mt-0.5">Gestión de usuarios, tipos de caso y estados</p>
      </div>

      {/* Stats cards */}
      <div className="grid grid-cols-3 gap-4">
        {[
          { label: "Usuarios", value: usuarios.length, sub: `${activeCount} activos`, icon: "👤" },
          { label: "Tipos de caso", value: tiposCaso.length, sub: `${allClases.length} clases`, icon: "📋" },
          { label: "Estados", value: estados.length, sub: "configurados", icon: "🏷️" },
        ].map((s) => (
          <div key={s.label} className="bg-white rounded-xl border border-gray-200 p-4">
            <div className="flex items-center gap-3">
              <span className="text-2xl">{s.icon}</span>
              <div>
                <p className="text-xl font-bold text-gray-900">{s.value}</p>
                <p className="text-xs text-gray-500">{s.label} · {s.sub}</p>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Tabs */}
      <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
        <div className="flex border-b border-gray-200">
          {([
            { key: "usuarios", label: "Usuarios" },
            { key: "tiposCaso", label: "Tipos de Caso" },
            { key: "estados", label: "Estados" },
          ] as { key: Tab; label: string }[]).map((t) => (
            <button key={t.key} onClick={() => setTab(t.key)}
              className={`px-5 py-3 text-sm font-medium transition-colors ${
                tab === t.key ? "text-brand border-b-2 border-brand" : "text-gray-500 hover:text-gray-700"
              }`}>
              {t.label}
            </button>
          ))}
        </div>

        <div className="p-5">
          {/* ============ TAB USUARIOS ============ */}
          {tab === "usuarios" && (
            <div>
              <div className="flex items-center justify-between gap-3 mb-4">
                <div className="flex items-center gap-3">
                  <select value={filterRole} onChange={(e) => setFilterRole(e.target.value)}
                    className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-brand/50">
                    <option value="">Todos los roles</option>
                    {allRoles.map((r) => <option key={r.roleid} value={r.rolename}>{r.rolename}</option>)}
                  </select>
                  <select value={filterStatus} onChange={(e) => setFilterStatus(e.target.value as "" | "activo" | "inactivo")}
                    className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-brand/50">
                    <option value="">Todos los estados</option>
                    <option value="activo">Activo</option>
                    <option value="inactivo">Inactivo</option>
                  </select>
                  {(filterRole || filterStatus) && (
                    <button onClick={() => { setFilterRole(""); setFilterStatus(""); }} className="text-xs text-gray-500 hover:text-gray-700">Limpiar filtros</button>
                  )}
                  <span className="text-xs text-gray-400">{filteredUsuarios.length} de {usuarios.length}</span>
                </div>
                <button onClick={openCreateModal} className="px-4 py-2 bg-brand text-white text-sm font-medium rounded-lg hover:bg-brand-dark transition-colors">+ Nuevo Usuario</button>
              </div>
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="bg-gray-50 border-b border-gray-200">
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Usuario</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Email</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Roles</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Estado</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Creado</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Acciones</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100">
                    {filteredUsuarios.map((u: Usuario) => (
                      <tr key={u.userid} className="hover:bg-gray-50">
                        <td className="px-3 py-2.5 font-medium text-gray-800">{u.username}</td>
                        <td className="px-3 py-2.5 text-gray-600">{u.membership?.email ?? "—"}</td>
                        <td className="px-3 py-2.5">
                          <div className="flex flex-wrap gap-1">
                            {u.usersinroles?.length ? u.usersinroles.map((ur) => (
                              <span key={ur.role?.rolename} className="inline-flex px-1.5 py-0.5 rounded text-xs font-medium bg-blue-100 text-blue-800">{ur.role?.rolename}</span>
                            )) : <span className="text-gray-400">—</span>}
                          </div>
                        </td>
                        <td className="px-3 py-2.5">
                          <span className={`inline-flex px-2 py-0.5 rounded-full text-xs font-medium ${u.membership?.isapproved ? "bg-green-100 text-green-800" : "bg-red-100 text-red-800"}`}>
                            {u.membership?.isapproved ? "Activo" : "Inactivo"}
                          </span>
                        </td>
                        <td className="px-3 py-2.5 text-gray-500 text-xs">{u.membership?.createdate ? new Date(u.membership.createdate).toLocaleDateString("es-CO") : "—"}</td>
                        <td className="px-3 py-2.5">
                          <div className="flex gap-2">
                            <button onClick={() => openEditModal(u)} className="text-blue-600 hover:text-blue-800 text-xs font-medium">Editar</button>
                            <button onClick={() => setDeleteModal(u)} className="text-red-600 hover:text-red-800 text-xs font-medium">Eliminar</button>
                          </div>
                        </td>
                      </tr>
                    ))}
                    {filteredUsuarios.length === 0 && (
                      <tr><td colSpan={6} className="px-3 py-8 text-center text-sm text-gray-400">No se encontraron usuarios</td></tr>
                    )}
                  </tbody>
                </table>
              </div>
            </div>
          )}

          {/* ============ TAB TIPOS DE CASO ============ */}
          {tab === "tiposCaso" && (
            <div>
              <div className="flex items-center justify-between mb-4">
                <span className="text-xs text-gray-400">{tiposCaso.length} tipos de caso</span>
                <button onClick={openCreateTipo} className="px-4 py-2 bg-brand text-white text-sm font-medium rounded-lg hover:bg-brand-dark transition-colors">+ Nuevo Tipo</button>
              </div>
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="bg-gray-50 border-b border-gray-200">
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">ID</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Nombre</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Clase de Caso</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Acciones</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100">
                    {tiposCaso.map((t: TipoCaso) => (
                      <tr key={t.id_tipocaso} className="hover:bg-gray-50">
                        <td className="px-3 py-2.5 text-gray-500 font-mono text-xs">{t.id_tipocaso}</td>
                        <td className="px-3 py-2.5 font-medium text-gray-800">{t.nombre ?? "—"}</td>
                        <td className="px-3 py-2.5 text-gray-600">
                          {t.clasedecaso?.nombre ? (
                            <span className="inline-flex px-1.5 py-0.5 rounded text-xs font-medium bg-purple-100 text-purple-800">{t.clasedecaso.nombre}</span>
                          ) : "—"}
                        </td>
                        <td className="px-3 py-2.5">
                          <div className="flex gap-2">
                            <button onClick={() => openEditTipo(t)} className="text-blue-600 hover:text-blue-800 text-xs font-medium">Editar</button>
                            <button onClick={() => setDeleteTipoModal(t)} className="text-red-600 hover:text-red-800 text-xs font-medium">Eliminar</button>
                          </div>
                        </td>
                      </tr>
                    ))}
                    {tiposCaso.length === 0 && (
                      <tr><td colSpan={4} className="px-3 py-8 text-center text-sm text-gray-400">No hay tipos de caso</td></tr>
                    )}
                  </tbody>
                </table>
              </div>
            </div>
          )}

          {/* ============ TAB ESTADOS ============ */}
          {tab === "estados" && (
            <div>
              <div className="flex items-center justify-between mb-4">
                <span className="text-xs text-gray-400">{estados.length} estados</span>
                <button onClick={openCreateEstado} className="px-4 py-2 bg-brand text-white text-sm font-medium rounded-lg hover:bg-brand-dark transition-colors">+ Nuevo Estado</button>
              </div>
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="bg-gray-50 border-b border-gray-200">
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">ID</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Nombre</th>
                      <th className="text-left px-3 py-2.5 font-semibold text-gray-600">Acciones</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100">
                    {estados.map((e: Estado) => (
                      <tr key={e.id_estado} className="hover:bg-gray-50">
                        <td className="px-3 py-2.5 text-gray-500 font-mono text-xs">{e.id_estado}</td>
                        <td className="px-3 py-2.5 font-medium text-gray-800">{e.nombre ?? "—"}</td>
                        <td className="px-3 py-2.5">
                          <div className="flex gap-2">
                            <button onClick={() => openEditEstado(e)} className="text-blue-600 hover:text-blue-800 text-xs font-medium">Editar</button>
                            <button onClick={() => setDeleteEstadoModal(e)} className="text-red-600 hover:text-red-800 text-xs font-medium">Eliminar</button>
                          </div>
                        </td>
                      </tr>
                    ))}
                    {estados.length === 0 && (
                      <tr><td colSpan={3} className="px-3 py-8 text-center text-sm text-gray-400">No hay estados</td></tr>
                    )}
                  </tbody>
                </table>
              </div>
            </div>
          )}
        </div>
      </div>

      {/* ====== MODAL CREAR/EDITAR USUARIO ====== */}
      {modalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-md mx-4 p-6">
            <h2 className="text-lg font-bold text-gray-900 mb-4">{editingUser ? "Editar Usuario" : "Nuevo Usuario"}</h2>
            {formError && <div className="mb-3 p-2 bg-red-50 border border-red-200 rounded text-sm text-red-700">{formError}</div>}
            <div className="space-y-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Usuario</label>
                <input type="text" value={formUsername} onChange={(e) => setFormUsername(e.target.value)} disabled={!!editingUser}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-brand/50 disabled:bg-gray-100" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
                <input type="email" value={formEmail} onChange={(e) => setFormEmail(e.target.value)} disabled={!!editingUser}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-brand/50 disabled:bg-gray-100" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">{editingUser ? "Nueva Contraseña (dejar vacío para no cambiar)" : "Contraseña"}</label>
                <input type="password" value={formPassword} onChange={(e) => setFormPassword(e.target.value)}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-brand/50" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Roles</label>
                <div className="flex flex-wrap gap-2">
                  {allRoles.map((r) => (
                    <label key={r.roleid} className="flex items-center gap-1.5 text-sm">
                      <input type="checkbox" checked={formRoles.includes(r.rolename)} onChange={() => toggleRole(r.rolename)}
                        className="rounded border-gray-300 text-brand focus:ring-brand" />
                      {r.rolename}
                    </label>
                  ))}
                </div>
              </div>
              {editingUser && (
                <div className="flex items-center gap-2">
                  <label className="text-sm font-medium text-gray-700">Estado:</label>
                  <button type="button" onClick={() => setFormActive(!formActive)}
                    className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${formActive ? "bg-green-500" : "bg-gray-300"}`}>
                    <span className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${formActive ? "translate-x-6" : "translate-x-1"}`} />
                  </button>
                  <span className="text-sm text-gray-600">{formActive ? "Activo" : "Inactivo"}</span>
                </div>
              )}
            </div>
            <div className="flex justify-end gap-2 mt-5">
              <button onClick={() => setModalOpen(false)} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">Cancelar</button>
              <button onClick={handleSaveUser} disabled={saving}
                className="px-4 py-2 bg-brand text-white text-sm font-medium rounded-lg hover:bg-brand-dark disabled:opacity-50 transition-colors">
                {saving ? "Guardando..." : editingUser ? "Guardar Cambios" : "Crear Usuario"}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ====== MODAL ELIMINAR USUARIO ====== */}
      {deleteModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-sm mx-4 p-6">
            <h2 className="text-lg font-bold text-gray-900 mb-2">Eliminar Usuario</h2>
            <p className="text-sm text-gray-600 mb-4">¿Eliminar al usuario <strong>{deleteModal.username}</strong>? Esta acción no se puede deshacer.</p>
            <div className="flex justify-end gap-2">
              <button onClick={() => setDeleteModal(null)} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">Cancelar</button>
              <button onClick={handleDeleteUser} disabled={saving}
                className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 disabled:opacity-50 transition-colors">
                {saving ? "Eliminando..." : "Eliminar"}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ====== MODAL CREAR/EDITAR TIPO DE CASO ====== */}
      {tipoModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-md mx-4 p-6">
            <h2 className="text-lg font-bold text-gray-900 mb-4">{editingTipo ? "Editar Tipo de Caso" : "Nuevo Tipo de Caso"}</h2>
            {tipoError && <div className="mb-3 p-2 bg-red-50 border border-red-200 rounded text-sm text-red-700">{tipoError}</div>}
            <div className="space-y-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nombre</label>
                <input type="text" value={tipoNombre} onChange={(e) => setTipoNombre(e.target.value)}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-brand/50" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Clase de Caso</label>
                <select value={tipoClase} onChange={(e) => setTipoClase(e.target.value ? parseInt(e.target.value) : "")}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-brand/50">
                  <option value="">Sin clase</option>
                  {allClases.map((c) => <option key={c.id_clasecaso} value={c.id_clasecaso}>{c.nombre}</option>)}
                </select>
              </div>
            </div>
            <div className="flex justify-end gap-2 mt-5">
              <button onClick={() => setTipoModal(false)} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">Cancelar</button>
              <button onClick={handleSaveTipo} disabled={saving}
                className="px-4 py-2 bg-brand text-white text-sm font-medium rounded-lg hover:bg-brand-dark disabled:opacity-50 transition-colors">
                {saving ? "Guardando..." : editingTipo ? "Guardar Cambios" : "Crear Tipo"}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ====== MODAL ELIMINAR TIPO DE CASO ====== */}
      {deleteTipoModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-sm mx-4 p-6">
            <h2 className="text-lg font-bold text-gray-900 mb-2">Eliminar Tipo de Caso</h2>
            <p className="text-sm text-gray-600 mb-4">¿Eliminar <strong>{deleteTipoModal.nombre}</strong>? Si tiene casos asociados no se podrá eliminar.</p>
            <div className="flex justify-end gap-2">
              <button onClick={() => setDeleteTipoModal(null)} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">Cancelar</button>
              <button onClick={handleDeleteTipo} disabled={saving}
                className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 disabled:opacity-50 transition-colors">
                {saving ? "Eliminando..." : "Eliminar"}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ====== MODAL CREAR/EDITAR ESTADO ====== */}
      {estadoModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-md mx-4 p-6">
            <h2 className="text-lg font-bold text-gray-900 mb-4">{editingEstado ? "Editar Estado" : "Nuevo Estado"}</h2>
            {estadoError && <div className="mb-3 p-2 bg-red-50 border border-red-200 rounded text-sm text-red-700">{estadoError}</div>}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Nombre</label>
              <input type="text" value={estadoNombre} onChange={(e) => setEstadoNombre(e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-brand/50" />
            </div>
            <div className="flex justify-end gap-2 mt-5">
              <button onClick={() => setEstadoModal(false)} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">Cancelar</button>
              <button onClick={handleSaveEstado} disabled={saving}
                className="px-4 py-2 bg-brand text-white text-sm font-medium rounded-lg hover:bg-brand-dark disabled:opacity-50 transition-colors">
                {saving ? "Guardando..." : editingEstado ? "Guardar Cambios" : "Crear Estado"}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ====== MODAL ELIMINAR ESTADO ====== */}
      {deleteEstadoModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-sm mx-4 p-6">
            <h2 className="text-lg font-bold text-gray-900 mb-2">Eliminar Estado</h2>
            <p className="text-sm text-gray-600 mb-4">¿Eliminar <strong>{deleteEstadoModal.nombre}</strong>? Si tiene casos asociados no se podrá eliminar.</p>
            <div className="flex justify-end gap-2">
              <button onClick={() => setDeleteEstadoModal(null)} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">Cancelar</button>
              <button onClick={handleDeleteEstado} disabled={saving}
                className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700 disabled:opacity-50 transition-colors">
                {saving ? "Eliminando..." : "Eliminar"}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
