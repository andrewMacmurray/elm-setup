import elmPlugin from 'vite-plugin-elm';

export default {
  root: 'src',
  plugins: [elmPlugin()],
  server: {
    port: 1234,
    host: '0.0.0.0'
  },
  build: {
    outDir: "../dist"
  }
};