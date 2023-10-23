FROM node:14-alpine as builder
WORKDIR /frontend
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.21-alpine
WORKDIR /app
COPY --from=builder /frontend/dist .
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]