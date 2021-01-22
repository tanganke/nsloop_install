#!/bin/sh
if [[ ! ${INSTALL_DIR}]]
then
    INSTALL_DIR=/root/.nsloop
fi

if [ $# -eq 0 ] 
then
    echo 'no token given.'
    echo 'usage: ' $0 token
    echo 'for example: ' $0 xxxx-xxxx-xxxx-xxxx
    exit 1
elif [ $# -gt 1]
    echo 'ERROR: too much args!'
    echo 'usage: ' $0 token
    echo 'for example: ' $0 xxxx-xxxx-xxxx-xxxx 
    exit 1
fi

if [ -d /root/.nsloop ]
then
    rm -rf /root/.nsloop
fi

if [ -f /root/.nsloop ]
then
    rm -f /root/.nsloop
fi

git clone https://github.com/tanganke/nsloop_install ${INSTALL_DIR}

SERVICE_FILE=${INSTALL_DIR}/nsloop.service
sed s+INSTALL_DIR+${INSTALL_DIR}+ ${SERVICE_FILE} > /etc/systemed/system/nsloop.sevice

START_FILE=${INSTALL_DIR}/start.sh
sed s+INSTALL_DIR+${INSTALL_DIR}+ ${START_FILE} > ${START_FILE}

EXE_FILE=${INSTALL_DIR}/nattunnel

chmod og+x ${EXE_FILE}
chmod og+x ${START_FILE}

echo $1 > ${INSTALL_DIR}/token
systemctl enable --now nsloop
