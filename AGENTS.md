# Guia para Agentes — ConsulCaso Next

## Contexto Rapido
Este proyecto es la migracion de un sistema ASP.NET legacy a Next.js 16 (App Router).
La base de datos PostgreSQL ya existe con datos reales — **no se debe modificar su estructura con migrations**.

## Reglas Criticas

### Base de Datos
- **NUNCA** ejecutar `prisma migrate` ni `prisma db push`. Solo `prisma generate`.
- Al agregar un modelo en `schema.prisma`, usar `@@map("nombre_tabla_real")` para mapear a la tabla existente.
- Verificar que columnas PK auto-increment tengan una secuencia en PostgreSQL. Si no existe, crearla:
  ```sql
  CREATE SEQUENCE tabla_columna_seq AS bigint;
  SELECT setval('tabla_columna_seq', (SELECT COALESCE(MAX(columna), 0) FROM tabla));
  ALTER TABLE tabla ALTER COLUMN columna SET DEFAULT nextval('tabla_columna_seq');
  ```
- BigInt de Prisma no se puede serializar con `JSON.stringify`. Siempre usar `serializeData()` de `src/lib/json.ts`.

### API Routes
- Siempre verificar sesion con `getServerSession(authOptions)`.
- `params` en Next.js 16 es `Promise<{ id: string }>` — requiere `await`.
- Envolver todo en try/catch y retornar JSON con error en el catch:
  ```ts
  try {
    // logica
  } catch (err) {
    console.error("[RUTA]", err);
    return NextResponse.json({ error: "Internal server error", detail: String(err) }, { status: 500 });
  }
  ```

### Componentes UI
- Patron de pagina: `page.tsx` (SSR, carga datos) → `*Client.tsx` (interactividad).
- Modales son componentes inline dentro del mismo archivo, no libreria externa.
- Datos secundarios (reclamantes, archivos) se cargan client-side con fetch, no en SSR.
- Colores de marca definidos en `globals.css` con `@theme`. Usar clases: `bg-brand`, `text-brand`, `bg-navy`, etc.
- **No usar** clases `blue-600/700` para acciones primarias — usar `brand` / `brand-dark`.

### Estilo y Convenciones
- Tailwind CSS v4 con `@import "tailwindcss"` y `@theme` (no `tailwind.config`).
- Focus rings: `focus:ring-brand` (no `focus:ring-blue-500`).
- Inputs: clase compartida `ic` en modales para consistencia.
- Labels: `text-sm font-medium text-gray-700 mb-1`.

### Auth
- Sistema auth legacy ASP.NET Membership. Passwords hasheados con SHA1 + salt (Base64).
- Roles: `Analista`, `JefeAnalista`, `Investigador`, `AreaOperativa`.
- Session tiene `user.roles: string[]` extendido via `next-auth.d.ts`.

### Deploy
- Build: `npm run build` genera output `standalone`.
- Docker multi-stage (ver `Dockerfile`).
- Deploy automatico via Dokploy al pushear a `main`.
- VM GCP: `35.229.105.139`, puerto 3001.

## Codigo Legacy de Referencia
La carpeta `legacy/` (gitignored, solo existe localmente) contiene el sistema ASP.NET original:
- **`legacy/aspnet-original/`** — Codigo fuente completo (WebForms .aspx + .aspx.cs)
- **`legacy/backup_consulbase73.sql`** — Dump SQL completo de la DB original

### Carpetas clave del legacy
| Carpeta/Archivo | Funcionalidad |
|-----------------|---------------|
| `ConsulCaso9/` | Modulo principal: gestion de casos, detalle, archivos |
| `ContaCaso/` | Contabilidad, facturas, gastos |
| `Administracion/` | Administracion de usuarios y configuracion |
| `Busquedas.aspx.cs` | Busqueda avanzada de casos |
| `App_Code/` | Clases compartidas, DAL, helpers |
| `Web.config` | Connection strings, auth config IIS |

### Como usar el legacy al migrar
1. Identificar la pagina `.aspx.cs` que implementa la funcionalidad a migrar
2. Revisar los queries SQL que ejecuta (buscar `SqlCommand`, `SqlDataReader`, etc.)
3. Notar que campos muestra el UI y que validaciones aplica
4. Verificar que tablas y columnas usa — mapearlas en `schema.prisma` con `@@map()`
5. Consultar `backup_consulbase73.sql` para ver estructura de tablas no migradas aun

## Archivos Clave para Referencia
| Archivo | Para que |
|---------|----------|
| `prisma/schema.prisma` | Todos los modelos y relaciones |
| `src/lib/auth.ts` | Configuracion de autenticacion |
| `src/lib/json.ts` | `serializeData()` para BigInt |
| `src/lib/prisma.ts` | Singleton de PrismaClient |
| `src/app/globals.css` | Colores de marca (@theme) |
| `src/app/home/layout.tsx` | Layout protegido con Sidebar + TopBar |
| `src/app/home/casos/CasosClient.tsx` | Ejemplo completo de listado con paginacion |
| `src/app/home/casos/[id]/CasoDetailClient.tsx` | Ejemplo de detalle con tabs y modales |
| `src/app/api/casos/[id]/archivos/route.ts` | Ejemplo de API route con try/catch |
| `legacy/aspnet-original/` | Codigo fuente ASP.NET original (referencia para migracion) |
| `legacy/backup_consulbase73.sql` | Backup DB original (estructura de tablas no migradas) |
