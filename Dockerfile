# ── Stage 1: Base image ──────────────────────────────────────
# Use official Node.js 18 on lightweight Alpine Linux (only 5MB)
FROM node:18-alpine

# ── Stage 2: Set working directory ───────────────────────────
# All commands from here run inside /app inside the container
WORKDIR /app

# ── Stage 3: Install dependencies ────────────────────────────
# Copy package files FIRST (before copying source code)
# This is a Docker caching trick — if package.json hasn't changed,
# Docker skips this layer and uses the cached node_modules
COPY package*.json ./
RUN npm ci --only=production

# ── Stage 4: Copy source code ────────────────────────────────
COPY src/ ./src/

# ── Stage 5: Expose port ──────────────────────────────────────
# Documents that the app listens on port 3000
# (doesn't actually open the port — that happens at runtime)
EXPOSE 3000

# ── Stage 6: Health check ─────────────────────────────────────
# Docker will ping this every 30s to know if the container is healthy
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000 || exit 1

# ── Stage 7: Start the app ────────────────────────────────────
# CMD is what runs when the container starts
CMD ["node", "src/app.js"]