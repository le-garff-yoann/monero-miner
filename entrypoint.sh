#!/bin/sh

exec /home/monero/xmrig \
    -o pool.supportxmr.com:443 -u 85ovqiZLJvaEMgdMsxbau69CyGWoqY6KiBjGAjd7WnAGgV5PhEvsWJofMS2PYRUmwaZHJgfPaXEGkFM5uCuLa9uaLN7XHk4  -k --coin=monero --tls \
    -o xmrpool.eu:9999 -u 85ovqiZLJvaEMgdMsxbau69CyGWoqY6KiBjGAjd7WnAGgV5PhEvsWJofMS2PYRUmwaZHJgfPaXEGkFM5uCuLa9uaLN7XHk4 -k --coin=monero --tls \
    $@
