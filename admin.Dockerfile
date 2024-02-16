FROM node:14-alpine AS builder

ENV NODE_ENV production

WORKDIR /app

COPY src/admin/package.json .
COPY src/admin/package-lock.json .

RUN npm install --production

COPY src/admin/. .

RUN npm run build

FROM nginx:1.21.0-alpine AS prod

ENV NODE_ENV production

COPY --from=builder /app/build /usr/share/nginx/html

COPY configuration/nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]