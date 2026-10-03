ARG NODE_VERSION=18-alpine
FROM node:${NODE_VERSION} AS builder

WORKDIR /app

COPY package.json .

RUN npm install

# COPY . .

# RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html