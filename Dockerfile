FROM node:alpine as construcao
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=construcao /app/build /usr/share/nginx/html