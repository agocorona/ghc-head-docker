FROM gregweber/ghc-haskell-dev

USER root
RUN apt-get install -y git

RUN git config --global url."https://github.com/ghc/packages-".insteadOf   https://github.com/ghc/packages/
RUN git clone  --depth 1 --recursive https://github.com/ghc/ghc.git /ghc

RUN ln -s /opt/ghc/7.8.3 /opt7.8.3

WORKDIR /ghc
RUN pwd
ADD build.mk /ghc/mk/build.mk
RUN ./boot
RUN ./configure
RUN make "-j$(nproc)"
RUN make install