# this is the phase where we build the apps
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- this is where all the build files will be

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html