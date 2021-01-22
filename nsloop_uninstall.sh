#!/bin/sh
if [[ ! ${INSTALL_DIR} ]]
then
    INSTALL_DIR=/root/.nsloop
fi

if [ -d ${INSTALL_DIR} ]
then
    rm -rf ${INSTALL_DIR}
fi

if [ -f ${INSTALL_DIR} ]
then
    rm -f ${INSTALL_DIR}
fi

systemctl disable nsloop
rm /etc/systemd/system/nsloop.service