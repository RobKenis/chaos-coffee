FROM ghcr.io/graalvm/graalvm-ce:22 as build
RUN gu install native-image
WORKDIR /project
VOLUME ["/project"]
ENTRYPOINT ["native-image"]