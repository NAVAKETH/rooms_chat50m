FROM golang:1.18 AS build
COPY ./ /app/
WORKDIR /app/
RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/listChat

FROM alpine:3.12
COPY --from=build /bin/listChat /
COPY ./config.yaml /config.yaml
# COPY image_pdf_file /app/image_pdf_file
ENV TZ=Asia/Bangkok
EXPOSE 4000
CMD ["/listChat"]