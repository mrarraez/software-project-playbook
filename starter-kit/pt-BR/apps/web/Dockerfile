FROM node:22-alpine AS build
WORKDIR /repo
COPY . .
RUN npm ci && npm run build --workspace apps/web

FROM nginxinc/nginx-unprivileged:1.30-alpine
COPY --from=build /repo/apps/web/dist /usr/share/nginx/html
EXPOSE 8080
HEALTHCHECK CMD wget -qO- http://127.0.0.1:8080/ || exit 1
