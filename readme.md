## What is TorGhost ?
TorGhost is an anonymization script. TorGhost redirects all internet traffic through SOCKS5 tor proxy. DNS requests are also redirected via tor, thus preventing DNSLeak. The scripts also disables unsafe packets exiting the system. Some packets like ping request can compromise your identity.

##This code is optimized for manjaro

## Build and install from source
`git clone https://github.com/Alireza-Mani/torghost.git`

`cd torghost`

`git checkout manjaro`

`chmod +x build.sh`

`./build.sh`

## Usage
Torghost v3.0 usage:

  `-s      --start      Start Torghost`

  `-r      --switch      Request new tor exit node`

`  -x      --stop      Stop Torghost`

`  -h      --help      Print this help and exit`





