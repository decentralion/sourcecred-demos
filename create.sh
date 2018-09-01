#!/bin/sh

set -eu

SOURCECRED_DIR=~/git/sourcecred
BUILD_STATIC_SITE="$SOURCECRED_DIR"/scripts/build_static_site.sh
DEMO_DIR=~/git/sourcecred-demos/


gitcoin() (
  cd "$DEMO_DIR"
  rm -rf gitcoin
  "$BUILD_STATIC_SITE" --target gitcoin --feedback-url https://discuss.sourcecred.io/t/gitcoin-cred-feedback/19
  cd "$SOURCECRED_DIR"
  node bin/sourcecred.js load gitcoinco/web -d "$DEMO_DIR/gitcoin/api/v1/data/"
)

ipfs() (
  cd "$DEMO_DIR"
  rm -rf ipfs
  "$BUILD_STATIC_SITE" --target ipfs --feedback-url https://discuss.sourcecred.io/t/ipfs-cred-feedback/17
  cd "$SOURCECRED_DIR"
  node bin/sourcecred.js load ipfs/js-ipfs -d "$DEMO_DIR/ipfs/api/v1/data/"
  node bin/sourcecred.js load ipfs/go-ipfs -d "$DEMO_DIR/ipfs/api/v1/data/"
  node bin/sourcecred.js load --output ipfs/top30 -d "$DEMO_DIR/ipfs/api/v1/data/" \
    ipfs/go-ipfs \
    ipfs/js-ipfs \
    ipfs/js-ipfs-api \
    ipfs/pm \
    ipfs/ipfs-cluster \
    ipfs/interface-ipfs-core \
    ipfs/infrastructure \
    ipfs/js-ipfsd-ctl \
    ipfs/website \
    ipfs/js-ipfs-unixfs-engine \
    ipfs/community \
    ipfs/aegir \
    ipfs/js-libp2p-ipfs-browser \
    ipfs/ipfs \
    ipfs/awesome-ipfs \
    ipfs/js-ipfs-repo \
    ipfs/js-ipfs-bitswap \
    ipfs/distributions \
    ipfs/specs \
    ipfs/blog \
    ipfs/js-libp2p-ipfs-nodejs \
    ipfs/http-api-spec \
    ipfs/go-ipfs-api \
    ipfs/py-ipfs-api \
    ipfs/go-datastore \
    ipfs/notes \
    ipfs/project-repos \
    ipfs/js-ipfs-block-service \
    ipfs/faq \
    ipfs/go-ipfs-cmds \
   ;
)

libp2p() (
  cd "$DEMO_DIR"
  rm -rf libp2p
  "$BUILD_STATIC_SITE" --target libp2p --feedback-url https://discuss.sourcecred.io/t/libp2p-cred-feedback/21
  cd "$SOURCECRED_DIR"
  node bin/sourcecred.js load --output libp2p/all -d "$DEMO_DIR/libp2p/api/v1/data/" \
    libp2p/go-sockaddr \
    libp2p/go-reuseport \
    libp2p/go-mplex \
    libp2p/js-peer-id \
    libp2p/js-peer-info \
    libp2p/js-libp2p-switch \
    libp2p/interface-stream-muxer \
    libp2p/js-spdy-stream-muxer \
    libp2p/go-stream-muxer \
    libp2p/js-libp2p-ping \
    libp2p/js-iprs-record \
    libp2p/js-libp2p-distributed-record-store \
    libp2p/js-libp2p \
    libp2p/js-libp2p-mdns \
    libp2p/js-libp2p-bootstrap \
    libp2p/js-libp2p-kad-routing \
    libp2p/interface-record-store \
    libp2p/js-libp2p-kad-record-store \
    libp2p/website \
    libp2p/interface-connection \
    libp2p/interface-transport \
    libp2p/js-libp2p-tcp \
    libp2p/js-libp2p-udp \
    libp2p/js-libp2p-udt \
    libp2p/js-libp2p-spdy \
    libp2p/js-libp2p-utp \
    libp2p/interface-peer-routing \
    libp2p/go-libp2p \
    libp2p/js-libp2p-websockets \
    libp2p/js-libp2p-mplex \
    libp2p/go-libp2p-transport \
    libp2p/go-libp2p-loggables \
    libp2p/go-libp2p-crypto \
    libp2p/go-libp2p-secio \
    libp2p/go-libp2p-peer \
    libp2p/js-peer-book \
    libp2p/go-ws-transport \
    libp2p/interface-libp2p \
    libp2p/js-libp2p-crypto \
    libp2p/js-libp2p-webrtc-star \
    libp2p/js-libp2p-secio \
    libp2p/go-libp2p-peerstore \
    libp2p/js-libp2p-identify \
    libp2p/libp2p \
    libp2p/xtp \
    libp2p/research-pubsub \
    libp2p/go-libp2p-kad-dht \
    libp2p/go-libp2p-routing \
    libp2p/go-libp2p-kbucket \
    libp2p/go-libp2p-record \
    libp2p/go-testutil \
    libp2p/js-libp2p-floodsub \
    libp2p/pubsub-notes \
    libp2p/go-floodsub \
    libp2p/specs \
    libp2p/go-utp-transport \
    libp2p/go-tcp-transport \
    libp2p/community \
    libp2p/go-xtp \
    libp2p/go-libp2p-protocol \
    libp2p/go-maddr-filter \
    libp2p/go-addr-util \
    libp2p/go-libp2p-conn \
    libp2p/go-libp2p-net \
    libp2p/go-libp2p-metrics \
    libp2p/go-libp2p-interface-conn \
    libp2p/go-libp2p-host \
    libp2p/go-libp2p-swarm \
    libp2p/go-udp-transport \
    libp2p/go-libp2p-nat \
    libp2p/go-libp2p-interface-pnet \
    libp2p/go-libp2p-pnet \
    libp2p/go-peerstream \
    libp2p/go-libp2p-dummy-conn \
    libp2p/go-libp2p-consensus \
    libp2p/go-libp2p-raft \
    libp2p/go-libp2p-netutil \
    libp2p/go-libp2p-blankhost \
    libp2p/cs-libp2p-crypto \
    libp2p/interface-peer-discovery \
    libp2p/cs-libp2p-peer \
    libp2p/cs-libp2p-protocol \
    libp2p/cs-libp2p-record \
    libp2p/cs-libp2p-io \
    libp2p/cs-libp2p-utils \
    libp2p/js-libp2p-kad-dht \
    libp2p/js-libp2p-record \
    libp2p/js-libp2p-webrtc-direct \
    libp2p/go-libp2p-circuit \
    libp2p/js-libp2p-crypto-secp256k1 \
    libp2p/js-libp2p-circuit \
    libp2p/go-libp2p-quic-transport \
    libp2p/go-libp2p-identify \
    libp2p/go-libp2p-ping \
    libp2p/js-p2pcat \
    libp2p/go-p2pcat \
    libp2p/rust-libp2p \
    libp2p/haskell-p2pcat \
    libp2p/go-wireguard \
    libp2p/go-libp2p-connmgr \
    libp2p/go-libp2p-circuit-progs \
    libp2p/js-libp2p-websocket-star \
    libp2p/js-libp2p-websocket-star-rendezvous \
    libp2p/go-libp2p-interface-connmgr \
    libp2p/interop \
    libp2p/go-msgio \
    libp2p/go-libp2p-pubsub \
    libp2p/js-libp2p-keychain \
    libp2p/go-flow-metrics \
    libp2p/docs \
    libp2p/research \
    libp2p/go-buffer-pool \
    libp2p/go-conn-security \
    libp2p/go-conn-security-multistream \
    libp2p/go-reuseport-transport \
    libp2p/go-libp2p-transport-upgrader \
    libp2p/js-libp2p-connection-manager \
    libp2p/mplex \
    libp2p/js-libp2p-delegated-peer-routing \
    libp2p/js-libp2p-delegated-content-routing \
    libp2p/interface-content-routing \
    libp2p/go-libp2p-websocket-star-rendezvous \
    libp2p/pull-mplex \
    libp2p/js-libp2p-rendezvous \
    libp2p/go-libp2p-rendezvous \
    libp2p/pm \
    libp2p/go-libp2p-routing-helpers \
    libp2p/go-libp2p-pubsub-router \
    libp2p/go-libp2p-autonat \
    libp2p/js-libp2p-nat-mngr \
    libp2p/developer-meetings \
    libp2p/js-libp2p-pnet \
    libp2p/dht-utils \
    libp2p/projects \
    libp2p/notes \
    libp2p/go-libp2p-examples \
    libp2p/go-libp2p-coral-dht \
    libp2p/research-dht \
    ;
)

tensorflow() (
  cd "$DEMO_DIR"
  rm -rf tensorflow
  "$BUILD_STATIC_SITE" --target tensorflow --repo tensorflow/tensorflow
)

zcash() (
  cd "$DEMO_DIR"
  rm -rf zcash
  "$BUILD_STATIC_SITE" --target zcash --repo zcash/zcash
)

# libp2p || true
# ipfs || true
# gitcoin || true
# ropensci || true
# tensorflow || true
zcash || true
