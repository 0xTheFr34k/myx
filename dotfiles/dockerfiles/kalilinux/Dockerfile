FROM  kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

# RUN apt -yq install kali-linux-headless

RUN apt -yq install kali-linux-everything

ENV DEBIAN_FRONTEND=newt

RUN apt -y install zsh

ENTRYPOINT ["/bin/zsh"]
