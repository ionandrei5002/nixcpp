FROM ubuntu:18.04

RUN apt update && \
    apt install -y curl

RUN useradd -m andrei

USER root
ENV USER andrei
RUN curl -o /tmp/install-nix-2.1.3 https://nixos.org/nix/install
RUN chmod +x /tmp/install-nix-2.1.3
RUN mkdir -m 0755 /nix && \
    chown andrei /nix

USER andrei
RUN /tmp/install-nix-2.1.3
ENV NIXPKGS_ALLOW_UNFREE 1 
WORKDIR /home/andrei/
RUN . /home/andrei/.nix-profile/etc/profile.d/nix.sh && \
    nix-channel --update && \
    nix-env -f '<nixpkgs>' -i git-2.19.1 vscode-1.28.2 && \
    nix-env -f '<nixpkgs>' -i gcc-wrapper-8.2.0 cmake-3.12.1 gnumake-4.2.1

USER root
RUN rm /tmp/install-nix-2.1.3

USER root
RUN apt update \
    && apt install -y libnotify4 \
    libnss3 \
    libxkbfile1 \
    libgconf-2-4 \
    libsecret-1-0 \
    libgtk2.0-0 \
    libxss1 \
    libasound2 \
    libcanberra-gtk-module \
    gtk2-engines-murrine \
    gtk2-engines-pixbuf \
    ubuntu-mate-icon-themes \
    ubuntu-mate-themes
    
RUN echo 'include "/usr/share/themes/Ambiant-MATE/gtk-2.0/gtkrc"' > /home/andrei/.gtkrc-2.0

USER andrei
ENV CPATH ~/.nix-profile/include
ENV LIBRARY_PATH ~/.nix-profile/lib

CMD ["/bin/bash", "--login"]
