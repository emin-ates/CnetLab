FROM ubuntu:22.04
RUN apt update && apt install -y gcc make gdb
WORKDIR /app
COPY . .
CMD ["make"]