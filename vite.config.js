import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
    plugins: [react()],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, './src'),
            '@admin': path.resolve(__dirname, './src/apps/admin'),
            '@components': path.resolve(__dirname, './src/components'),
            '@context': path.resolve(__dirname, './src/context'),
            '@services': path.resolve(__dirname, './src/services'),
        }
    },
    server: {
        port: 5173,
        open: true
    }
})
