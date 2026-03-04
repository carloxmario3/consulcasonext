"use client";

import Link from "next/link";
import Image from "next/image";
import { usePathname } from "next/navigation";

const navItems = [
  {
    href: "/home/casos",
    label: "Gestion de Casos",
    icon: (
      <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5}
          d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
      </svg>
    ),
    roles: ["Analista", "JefeAnalista", "Investigador", "AreaOperativa"],
  },
  {
    href: "/home/administracion",
    label: "Administracion",
    icon: (
      <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5}
          d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
      </svg>
    ),
    roles: ["JefeAnalista"],
  },
];

export function Sidebar({ roles }: { roles: string[] }) {
  const pathname = usePathname();

  const visibleItems = navItems.filter((item) =>
    item.roles.some((r) => roles.includes(r))
  );

  return (
    <aside className="w-64 bg-navy text-white flex flex-col flex-shrink-0">
      {/* Logo */}
      <div className="p-5 border-b border-navy-border">
        <div className="flex items-center justify-center">
          <div className="bg-white rounded-xl p-3">
            <Image
              src="/logo.png"
              alt="Consultando S.A.S"
              width={170}
              height={60}
              className="h-auto"
            />
          </div>
        </div>
      </div>

      {/* Navigation label */}
      <div className="px-5 pt-5 pb-2">
        <p className="text-[10px] font-bold uppercase tracking-widest text-gray-500">Menu</p>
      </div>

      {/* Nav */}
      <nav className="flex-1 px-3 space-y-1">
        {visibleItems.map((item) => {
          const active = pathname.startsWith(item.href);
          return (
            <Link
              key={item.href}
              href={item.href}
              className={`flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all duration-200 ${
                active
                  ? "bg-brand/15 text-brand border-l-2 border-brand"
                  : "text-gray-300 hover:bg-navy-lighter hover:text-white"
              }`}
            >
              <span className={active ? "text-brand" : ""}>{item.icon}</span>
              {item.label}
            </Link>
          );
        })}
      </nav>

      {/* Footer */}
      <div className="p-4 border-t border-navy-border">
        <p className="text-[10px] text-gray-600 text-center tracking-wide">
          Consultando S.A.S &copy; {new Date().getFullYear()}
        </p>
      </div>
    </aside>
  );
}
