/// <reference types="vitest" />
import { getViteConfig } from "astro/config";

export default getViteConfig(
  {
    test: {
      css: true,
      coverage: {
        include: ["src"],
        exclude: ["src/**/types"],
        reporter: ["html", "clover", "text", "json-summary", "json"],
      },
      environment: "happy-dom",
      globals: true,
      include: ["**/*.test.?(c|m)[jt]s?(x)"],
      setupFiles: ["./src/tests/setup/index.ts"],
    },
  },
  {
    // 開発時のツールバー機能を無効化
    devToolbar: { enabled: false },
  },
);
