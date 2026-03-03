"use client";

interface CaratulaModalProps {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  caso: any;
  onClose: () => void;
}

export function CaratulaModal({ caso, onClose }: CaratulaModalProps) {
  const afiliado = caso.afiliados?.[0];
  const nombreAfiliado = afiliado
    ? `${afiliado.nombre ?? ""} ${afiliado.apellido ?? ""}`.trim()
    : "—";
  const investigador = caso.investigador
    ? `${caso.investigador.nombres ?? ""} ${caso.investigador.apellidos ?? ""}`.trim()
    : "—";

  const handlePrint = () => {
    const origin = window.location.origin;
    const win = window.open("", "_blank", "width=800,height=950");
    if (!win) return;

    win.document.write(`<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Carátula - Caso #${caso.id_numero_caso}</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      font-family: Arial, sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      padding: 40px 20px;
      background: #fff;
    }
    .caratula {
      text-align: center;
      width: 100%;
      max-width: 620px;
    }
    .logo { max-height: 90px; margin-bottom: 24px; }
    .field { margin: 14px 0; }
    .xxl { font-size: 2rem; font-weight: bold; }
    .xl  { font-size: 1.6rem; }
    .underline { text-decoration: underline; font-weight: bold; }
    .casos-img { width: 100%; max-width: 620px; height: auto; margin: 24px 0; }
    .investigador { font-size: 1rem; color: #333; }
    @media print { body { padding: 20px; } }
  </style>
</head>
<body>
  <div class="caratula">
    <img src="${origin}/logo.png" class="logo" onerror="this.style.display='none'" />
    <div class="field xxl">CONSULTANDO LTDA</div>
    <div class="field xxl">${caso.id_numero_caso}</div>
    <div class="field xl">${nombreAfiliado}</div>
    <div class="field xl">CC. ${afiliado?.cedula ?? "—"}</div>
    <div class="field xl">
      <span class="underline">Fecha De Entrega:</span>
      ${caso.fecha_posibleentrega ?? "—"}
    </div>
    <div class="field xl">${caso.tipodecaso?.nombre ?? "—"}</div>
    <img src="${origin}/CASOS.png" class="casos-img" onerror="this.style.display='none'" />
    <div class="field investigador">${investigador}</div>
    <div class="field xl">
      <span class="underline">Fecha De Asignación:</span>
      ${caso.fecha_asignacion ?? "—"}
    </div>
  </div>
  <script>window.onload = function () { window.print(); };<\/script>
</body>
</html>`);
    win.document.close();
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl w-full max-w-md shadow-xl overflow-hidden">
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b border-gray-200">
          <h2 className="text-lg font-bold text-gray-900">
            Carátula — Caso #{caso.id_numero_caso}
          </h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        {/* Preview */}
        <div className="px-6 py-5 text-center space-y-2 border-b border-gray-100 bg-gray-50">
          <p className="text-xs font-semibold text-gray-400 uppercase tracking-widest mb-3">Vista previa</p>
          <p className="text-lg font-bold text-gray-900">CONSULTANDO LTDA</p>
          <p className="text-2xl font-bold text-blue-700">#{caso.id_numero_caso}</p>
          <p className="text-base text-gray-800">{nombreAfiliado}</p>
          <p className="text-base text-gray-700">CC. {afiliado?.cedula ?? "—"}</p>
          <p className="text-sm text-gray-700">
            <span className="font-semibold underline">Fecha de Entrega:</span>{" "}
            {caso.fecha_posibleentrega ?? "—"}
          </p>
          <p className="text-base font-medium text-gray-800">{caso.tipodecaso?.nombre ?? "—"}</p>
          <p className="text-sm text-gray-500">{investigador}</p>
          <p className="text-sm text-gray-700">
            <span className="font-semibold">Fecha de Asignación:</span>{" "}
            {caso.fecha_asignacion ?? "—"}
          </p>
        </div>

        {/* Actions */}
        <div className="px-6 py-4 flex justify-end gap-3">
          <button
            onClick={onClose}
            className="px-4 py-2 text-sm text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50"
          >
            Cerrar
          </button>
          <button
            onClick={handlePrint}
            className="flex items-center gap-2 px-4 py-2 text-sm bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium"
          >
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2}
                d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
            </svg>
            Imprimir
          </button>
        </div>
      </div>
    </div>
  );
}
