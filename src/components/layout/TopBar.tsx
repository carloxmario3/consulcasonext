"use client";

import { signOut } from "next-auth/react";

interface TopBarProps {
  user: {
    name?: string | null;
    email?: string | null;
    roles: string[];
  };
}

export function TopBar({ user }: TopBarProps) {
  return (
    <header className="bg-white border-b border-gray-200 px-6 py-3 flex items-center justify-between flex-shrink-0">
      <div />
      <div className="flex items-center gap-4">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 rounded-full bg-navy flex items-center justify-center text-white text-xs font-bold">
            {user.name?.charAt(0)?.toUpperCase() ?? "U"}
          </div>
          <div className="text-right">
            <p className="text-sm font-semibold text-gray-800">{user.name}</p>
            <p className="text-[11px] text-gray-400">{user.roles.join(", ")}</p>
          </div>
        </div>
        <div className="w-px h-6 bg-gray-200" />
        <button
          onClick={() => signOut({ callbackUrl: "/login" })}
          className="flex items-center gap-1.5 text-sm text-gray-500 hover:text-red-600 transition-colors px-2.5 py-1.5 rounded-lg hover:bg-red-50"
        >
          <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2}
              d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
          </svg>
          Salir
        </button>
      </div>
    </header>
  );
}
