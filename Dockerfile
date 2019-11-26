FROM python:3.7-alpine AS slim
ADD . /app
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
RUN ldd `which python`

#FROM gcr.io/distroless/python3
FROM scratch
MAINTAINER SKi S "docker@sankhe.com"
LABEL "com.sankhe"="Sankhe LLC"
LABEL version="1.0"
LABEL description="Slim docker image for Flask Apps."
COPY --from=slim /app /app
COPY --from=slim /usr/local/lib /usr/local/lib
COPY --from=slim /usr/local/bin /usr/local/bin
COPY --from=slim /lib /lib
#COPY --from=slim /lib64 /lib64
WORKDIR /app
ENTRYPOINT ["python","app.py"]
EXPOSE 80
