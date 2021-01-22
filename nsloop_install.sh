#!/bin/sh
if [[ ! ${INSTALL_DIR} ]]
then
    INSTALL_DIR=/root/.nsloop
fi

if [ $# -eq 0 ] 
then
    echo 'no token given.'
    echo 'usage: ' $0 token
    echo 'for example: ' $0 xxxx-xxxx-xxxx-xxxx
    exit 1
elif [ $# -gt 1 ]
then
    echo 'ERROR: too much args!'
    echo 'usage: ' $0 token
    echo 'for example: ' $0 xxxx-xxxx-xxxx-xxxx 
    exit 1
fi

if [ -d ${INSTALL_DIR} ]
then
    rm -rf ${INSTALL_DIR}
fi

if [ -f ${INSTALL_DIR} ]
then
    rm -f ${INSTALL_DIR}
fi

git clone https://github.com/tanganke/nsloop_install ${INSTALL_DIR}

SERVICE_FILE=${INSTALL_DIR}/nsloop.service
START_FILE=${INSTALL_DIR}/start.sh
EXE_FILE=${INSTALL_DIR}/nattunnel

sed s+INSTALL_DIR+${INSTALL_DIR}+ ${SERVICE_FILE}.template > /etc/systemd/system/nsloop.service &&
sed s+INSTALL_DIR+${INSTALL_DIR}+ ${START_FILE}.template > ${START_FILE}
chmod ug+x ${EXE_FILE}
chmod ug+x ${START_FILE}

echo $1 > ${INSTALL_DIR}/token
systemctl enable --now nsloop
