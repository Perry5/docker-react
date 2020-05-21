# this is the phase where we build the apps
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- this is where all the build files will be

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html