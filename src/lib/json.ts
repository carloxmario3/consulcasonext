/**
 * Serializa objetos que contienen BigInt a JSON.
 * Prisma devuelve BigInt para campos de 64 bits (cedula, celular, etc.)
 * JSON.stringify nativo no soporta BigInt.
 */
export function serializeData<T>(data: T): T {
  return JSON.parse(
    JSON.stringify(data, (_key, value) =>
      typeof value === "bigint" ? value.toString() : value
    )
  );
}
