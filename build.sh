#!/bin/bash
set -e

OUTPUT_DIR=/kamailio
KAMAILIO_VERSION="5.8"

echo "Building Kamailio ${KAMAILIO_VERSION}..."

# Clone Kamailio
git clone --depth 1 --branch ${KAMAILIO_VERSION} https://github.com/kamailio/kamailio.git
cd kamailio

# Configure
#make PREFIX="${OUTPUT_DIR}" \
#    include_modules="db_mysql xmlrpc jsonrpcc jsonrpcs http_client http_async_client sipcapture pv textops textopsx rtimer xlog sqlops htable sl siputils jansson xhttp tls sdpops uac dispatcher" \
#    cfg

make PREFIX="${OUTPUT_DIR}" \
    include_modules="xmlrpc jsonrpcc jsonrpcs http_client http_async_client sipcapture pv textops textopsx rtimer xlog sqlops htable sl siputils jansson xhttp tls sdpops uac dispatcher" \
    cfg

# Build and install
make all
make install

echo "Build completed!"
