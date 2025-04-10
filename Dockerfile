# Stage 1: Build
FROM node:20-alpine AS build

WORKDIR /app
COPY . .

# Install all deps (including dev) and build
RUN npm ci && npm run build

# Stage 2: Serve with NGINX
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
