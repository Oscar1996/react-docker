FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# for each FROM is like a separate block

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

# default port on nginx is 80 
# docker run -it -p 8080:80 image