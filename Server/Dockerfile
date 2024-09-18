FROM python:3.8-alpine

WORKDIR /src

COPY Server.py .

EXPOSE 50/udp

ENTRYPOINT [ "python", "./Server.py", "0.0.0.0", "50" ]
