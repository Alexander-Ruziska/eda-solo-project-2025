import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import dotenv from "dotenv";
dotenv.config({ path: process.env.NODE_ENV === "test" ? ".env.test" : ".env" });

export default defineConfig(() => {
  return {
    build: {
      outDir: 'build',
    },
    server: {
      proxy: {
        "/api":'http://localhost:5001',
      }
    },
    plugins: [react()],
    test: {
      globals: true,
      environment: 'jsdom',
    },
    };
    
  });

