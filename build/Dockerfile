FROM haskell
USER root

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286 \
  && echo 'deb     http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' >> /etc/apt/sources.list.d/haskell.list \
  && echo 'deb-src http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' >> /etc/apt/sources.list.d/haskell.list

RUN apt-get update && apt-get install -y git autoconf automake libtool make libgmp-dev ncurses-dev g++ llvm  python bzip2 ca-certificates \
  xz-utils

RUN cabal update

RUN git clone git://github.com/haskell/cabal \
    && cd ./cabal \
    && cabal install Cabal/ cabal-install/ 
 

RUN git config --global url."https://github.com/ghc/packages-".insteadOf   https://github.com/ghc/packages/
RUN git clone  --depth 1 --recursive https://github.com/ghc/ghc.git /ghc


ADD build-ghc.sh /
RUN chmod +x /build-ghc.sh

COPY build.mk /ghc/mk/

RUN ./build-ghc.sh
