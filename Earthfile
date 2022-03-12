image:
  FROM ubuntu:16.04
  COPY . /root/cawnfig
  RUN cd /root/cawnfig && ./install
  SAVE IMAGE cawnfig:latest

github:
  FROM +image
  SAVE IMAGE --push ghcr.io/cfoust/cawnfig:latest
