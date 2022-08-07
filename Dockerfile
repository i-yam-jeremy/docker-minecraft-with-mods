FROM itzg/minecraft-server:latest

RUN curl https://sh.rustup.rs -sSf > install-rust.sh && \
    sh install-rust.sh -y && \
    rm install-rust.sh
RUN apt-get update && apt-get --fix-missing install -y build-essential pkg-config libgtk2.0-dev
RUN apt-get install -y librust-gdk-sys-dev
RUN $HOME/.cargo/bin/cargo install ferium

EXPOSE 25565 25575

VOLUME ["/data"]
WORKDIR /data

STOPSIGNAL SIGTERM

COPY scripts/install-mods-and-start.sh /install-mods-and-start.sh

RUN chmod +x /install-mods-and-start.sh

ENTRYPOINT [ "/install-mods-and-start.sh" ]
HEALTHCHECK --start-period=1m --interval=5s --retries=24 CMD mc-health