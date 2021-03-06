#!/bin/sh

source /koolshare/scripts/base.sh

detect_skipd(){
        i=120
        until [ -n "$skipd" ]
        do
            i=$(($i-1))
                skipd=`pidof skipd`
            if [ "$i" -lt 1 ];then
                logger "[软件中心]: 错误：skipd进程未能成功启动！"
                exit
            fi
            sleep 1
            #echo $i
        done
        logger "[软件中心]: skipd进程准备就绪！"
}

detect_httpdb(){
        i=120
        until [ -n "$httpdb" ]
        do
            i=$(($i-1))
                httpdb=`pidof httpdb`
            if [ "$i" -lt 1 ];then
                logger "[软件中心]: 错误：httpdb进程未能成功启动！"
                exit
            fi
            sleep 1
            #echo $i
        done
        logger "[软件中心]: httpdb进程准备就绪！"
}

start(){
    detect_skipd
    detect_httpdb
}

start
