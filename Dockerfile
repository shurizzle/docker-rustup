FROM alpine:latest

ARG RUSTUP_VERSION

ENV RUSTUP_VERSION="$RUSTUP_VERSION"
ENV RUSTUP_HOME=/opt/rust
ENV CARGO_HOME=/opt/rust
ENV PATH="$PATH:$CARGO_HOME/bin"

RUN set -eux; \
    wget -O- https://sh.rustup.rs | sed 's/^\s*local _url=.*$/local _url="${RUSTUP_UPDATE_ROOT}\/archive\/${RUSTUP_VERSION}\/${_arch}\/rustup-init${_ext}"/' > rustup-init; \
    chmod +x rustup-init; \
    ./rustup-init --default-toolchain=none -y --no-modify-path; \
    rm -f rustup-init; \
    rustup -V
