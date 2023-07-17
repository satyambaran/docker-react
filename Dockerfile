FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 
# nginx to serve static html

# docker run -p 8080:80 cont_id
# nginx uses port 80 by default