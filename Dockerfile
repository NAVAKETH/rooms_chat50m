FROM golang:1.15.6 AS build
COPY ./ /app/
WORKDIR /app/
RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/service

FROM alpine:3.12
COPY --from=build /bin/service /
COPY ./config.yaml /config.yaml
# COPY image_pdf_file /app/image_pdf_file
ENV TZ=Asia/Bangkok
EXPOSE 3000
CMD ["/service"]