FROM node:24-alpine AS build
WORKDIR /repo
COPY package.json package-lock.json ./
COPY apps/api/package.json apps/api/
COPY apps/web/package.json apps/web/
COPY packages/contratos/package.json packages/contratos/
RUN npm ci
COPY . .
RUN npm run build --workspace apps/web

FROM nginxinc/nginx-unprivileged:1.30-alpine
COPY --from=build /repo/apps/web/dist /usr/share/nginx/html
EXPOSE 8080
HEALTHCHECK CMD wget -qO- http://127.0.0.1:8080/ || exit 1
