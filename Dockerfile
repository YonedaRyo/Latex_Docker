FROM ubuntu:24.04

RUN set -xe && \
    apt-get -y update && \
    apt-get install -y \
        texlive \
        texlive-latex-extra \
        texlive-science \
        make \
        texlive-lang-cjk \
        xdvik-ja \
        texlive-fonts-recommended \
        texlive-fonts-extra && \
    apt autoremove -y && \
    apt-get clean

RUN mkdir /texsrc
WORKDIR /texsrc

VOLUME /texsrc
