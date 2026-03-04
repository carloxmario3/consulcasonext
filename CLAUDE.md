# ConsulCaso Next — Contexto del Proyecto

## Descripcion
Sistema de gestion de casos para **Consultando S.A.S** (Consultores e Investigadores de Siniestros).
Migracion de una aplicacion legacy ASP.NET a Next.js + Prisma + PostgreSQL.

## Stack Tecnico
- **Framework**: Next.js 16.1.6 (App Router, Turbopack)
- **UI**: Tailwind CSS v4 (via `@import "tailwindcss"` + `@theme` en globals.css)
- **ORM**: Prisma 5.22 con PostgreSQL
- **Auth**: NextAuth v4 con CredentialsProvider (verifica passwords ASP.NET Membership SHA1)
- **Deploy**: Docker (standalone output) via Dokploy en GCP VM `35.229.105.139`
- **Puerto**: 3001 (dev y prod)

## Estructura del Proyecto
```
src/
  app/
    layout.tsx              # Root layout (Inter font, Providers)
    page.tsx                # Redirect: auth → /home/casos, no auth → /login
    providers.tsx           # SessionProvider de NextAuth
    globals.css             # Tailwind @theme con colores brand
    login/page.tsx          # Login con logo de la empresa
    home/
      layout.tsx            # Sidebar + TopBar (requiere session)
      page.tsx              # Redirect → /home/casos
      casos/
        page.tsx            # SSR: carga estados y tiposCaso
        CasosClient.tsx     # Tabla paginada, filtros, modal NuevoCaso
        [id]/
          page.tsx          # SSR: carga caso completo con includes
          CasoDetailClient.tsx  # Tabs: Info, Afiliados, Reclamantes, Archivos
          CaratulaModal.tsx # Impresion de caratula
      administracion/       # Admin (solo JefeAnalista)
      contabilidad/         # Gastos y facturas
      informes/             # Reportes
      seguimientos/         # Seguimientos de casos
    api/
      auth/[...nextauth]/   # NextAuth endpoint
      analistas/            # GET analistas
      investigadores/       # GET investigadores
      casos/                # GET (paginado+filtros), POST
        [id]/               # GET, PUT caso individual
          reclamantes/      # GET, POST reclamantes del caso
          archivos/         # GET, POST archivos Google Drive del caso
      reclamantes/[id]/     # PUT, DELETE reclamante individual
      contabilidad/         # GET gastos
      informes/             # GET informes
  components/layout/
    Sidebar.tsx             # Nav lateral con logo, colores brand
    TopBar.tsx              # Barra superior con usuario y logout
  lib/
    auth.ts                 # authOptions (ASP.NET Membership password verify)
    prisma.ts               # Singleton PrismaClient
    json.ts                 # serializeData() — convierte BigInt a string para JSON
  types/
    next-auth.d.ts          # Tipos extendidos para session.user.roles
prisma/
  schema.prisma             # Todos los modelos (mapean tablas existentes)
legacy/                     # (gitignored) Referencia local
  aspnet-original/          # Codigo fuente ASP.NET completo del sistema anterior
  backup_consulbase73.sql   # Backup de la base de datos original
```

## Colores de Marca (globals.css @theme)
- `brand`: `#c9a227` (dorado — botones, tabs activos, focus)
- `brand-dark`: `#b8931f` (hover)
- `brand-light`: `#f9f3dc` / `brand-50`: `#fdf8e8`
- `navy`: `#0f1923` (sidebar, fondo login)
- `navy-light`: `#1a2a3a` / `navy-lighter`: `#243447` / `navy-border`: `#2d3f52`

## Base de Datos
- PostgreSQL en `35.229.105.139:5432`, database `consulcaso`
- Las tablas vienen del sistema ASP.NET legacy — NO usar `prisma migrate`, solo `prisma generate`
- Prisma mapea tablas existentes con `@@map("nombre_tabla")`
- BigInt se serializa a string via `serializeData()` antes de enviar como JSON

### Modelos principales
- `TablaCasos` → `tbl_casos` (id_numero_caso Int PK)
- `TablaAfiliados` → `tbl_afiliados`
- `TablaReclamantes` → `tbl_reclamantes`
- `TblEnlace` → `tbl_enlace` (archivos Google Drive por caso)
- `TablaEstado`, `TablaTipodecaso`, `TablaClasedecaso`
- `TablaAnalista`, `TablaInvestigador`
- `AspnetUsers`, `AspnetMembership`, `AspnetRoles` (auth legacy)

### Tabla tbl_enlace (archivos)
- `nid_enlace` BigInt PK — se creo secuencia `tbl_enlace_nid_enlace_seq` manualmente (no existia autoincrement)
- `t_numero_caso` VARCHAR — referencia al caso como string (no FK porque tipos distintos)
- `t_enlace` contiene el ID de Google Drive. Links se construyen:
  - Ver: `https://drive.google.com/file/d/{id}/view?usp=sharing`
  - Descargar: `https://drive.google.com/uc?export=download&id={id}`
- Si `t_enlace` es `"GenerandoEnlace"` o vacio, no se muestran links

## Patrones del Proyecto

### API Routes
- Todas usan `getServerSession(authOptions)` para autenticacion
- `params` es `Promise<{ id: string }>` (Next.js 16 App Router)
- Siempre envolver en try/catch que retorne JSON con error
- Usar `serializeData()` antes de retornar datos con BigInt

### Componentes de pagina
- SSR en `page.tsx` para cargar datos iniciales (estados, tipos, caso)
- Client component (`*Client.tsx`) para interactividad
- Modales inline (no libreria), patron similar a ReclamanteModal / ArchivoModal
- Fetch client-side para datos secundarios (reclamantes, archivos)

### Auth y Roles
- Roles disponibles: `Analista`, `JefeAnalista`, `Investigador`, `AreaOperativa`
- Sidebar filtra items por rol
- JefeAnalista tiene acceso a Administracion

## Comandos
```bash
npm run dev          # Dev server en puerto 3001
npm run build        # Build de produccion (standalone)
npx prisma generate  # Regenerar cliente Prisma (NO usar migrate)
npx prisma studio    # UI para inspeccionar datos
```

## Codigo Legacy de Referencia
La carpeta `legacy/` (gitignored, solo local) contiene:
- **`aspnet-original/`** — Codigo fuente completo del sistema ASP.NET anterior
  - Paginas `.aspx` + code-behind `.aspx.cs` (WebForms)
  - Carpetas clave: `ConsulCaso9/` (modulo principal de casos), `ContaCaso/` (contabilidad), `Administracion/`, `Busquedas.aspx`
  - `App_Code/` — clases compartidas, conexion a DB, helpers
  - `Web.config` — connection strings y configuracion IIS
  - `Bin/` — DLLs compiladas (Telerik, etc.)
- **`backup_consulbase73.sql`** — Dump SQL de la base de datos original (PostgreSQL)
  - Contiene la estructura completa de todas las tablas y datos
  - Util para consultar tablas que aun no se han migrado a Prisma

### Como usar el legacy como referencia
Al migrar funcionalidad, buscar la pagina `.aspx.cs` correspondiente para entender:
- Que queries SQL ejecutaba
- Que campos mostraba en el UI
- Que validaciones aplicaba
- Que tablas y relaciones usaba

Ejemplo: para migrar la pantalla de seguimientos, revisar `ConsulCaso9/Seguimientos.aspx.cs`.

## Notas Importantes
- NUNCA usar `prisma migrate` — la DB es legacy y se rompen constraints
- Al agregar modelos a schema.prisma, usar `@@map()` con el nombre real de la tabla
- Verificar que columnas PK tengan secuencia en la DB antes de usar `@default(autoincrement())`
- El deploy es automatico via Dokploy al pushear a `main`
