# Kamailio Docker (Rocky Linux 8)

Minimal Docker setup for Kamailio SIP server on Rocky Linux 8.

## Quick Start

```bash
# 1. Build (compiles inside Docker)
./prepare.sh

# For Mac M1/M2, explicitly set platform:
./prepare.sh local linux/amd64

# 2. Run
./run.sh

# 3. Stop
./stop.sh
```

## What It Does

**prepare.sh** - Builds Docker image, compiles Kamailio inside container, extracts binaries to `./compiled/`

**run.sh** - Creates default config (if needed), starts Kamailio via docker-compose

**stop.sh** - Stops Kamailio

## Edit Configuration

Configuration is mounted as volume:

```bash
vim ./config/kamailio.cfg
docker-compose restart kamailio
```

## Modules Included

`db_mysql`, `xmlrpc`, `jsonrpcc`, `jsonrpcs`, `http_client`, `http_async_client`, `sipcapture`, `pv`, `textops`, `textopsx`, `rtimer`, `xlog`, `sqlops`, `htable`, `sl`, `siputils`, `jansson`, `xhttp`, `tls`, `sdpops`, `uac`, `dispatcher`

## Ports

- `5060/UDP` - SIP
- `5060/TCP` - SIP
- `5061/TCP` - SIP TLS

## Logs

```bash
docker-compose logs -f kamailio
```

## Platform Support

Built for `linux/amd64` by default. On Mac with Apple Silicon:

```bash
./prepare.sh local linux/amd64
```

Docker will use QEMU for cross-platform build.

## Rebuild

```bash
./stop.sh
rm -rf ./compiled
./prepare.sh
./run.sh
```
