FROM asciidoctor/docker-asciidoctor as build
WORKDIR /docs
COPY ./ ./
RUN asciidoctor -r asciidoctor-diagram -D build index.adoc

FROM nginx
COPY --from=build /docs/build/ /usr/share/nginx/html
