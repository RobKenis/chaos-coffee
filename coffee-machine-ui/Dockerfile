FROM node:18 AS build
WORKDIR /build
COPY ./ ./
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=build /build/build/ /usr/share/nginx/html