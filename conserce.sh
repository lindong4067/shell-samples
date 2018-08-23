#!/bin/bash
# Author: lijianyong@rayootech.com
# version 1.0.3
#

if [ "Z$LOCAL_CONSUL_IP" = "Z" ]; then
    [ -r /var/opt/setup/site.export ] && . /var/opt/setup/site.export
    if [ "Z$LOCAL_CONSUL_IP" = "Z" ]; then
        export LOCAL_CONSUL_IP=127.0.0.1
    fi
    if [ "Z$CONSUL_HTTPS_PORT" = "Z" ]; then
        export CONSUL_HTTPS_PORT=8088
    fi
fi

if [ "Z$CONSUL_HTTPS_PORT" != "Z" ]; then
    REQURL="https://$LOCAL_CONSUL_IP:$CONSUL_HTTPS_PORT"
    REQOPT="-k"
else
    REQURL="http://$LOCAL_CONSUL_IP:8500"
    REQOPT=""
fi

silient_mode=
function jsoni() {
    python -m json.tool
}
function httpreq() {
    [ "Z" = "Z$silent_mode" ] && echo "reqcmd: curl $REQOPT $@" 1>&2
    curl -s $REQOPT $@
}
function svcs() {
    httpreq "$REQURL/v1/agent/services" | jsoni
}
function chks() {
    httpreq "$REQURL/v1/agent/checks" | jsoni
}
function svc() {
    httpreq "$REQURL/v1/catalog/service/$1" | jsoni
}
function chk() {
    httpreq "$REQURL/v1/health/checks/$1" | jsoni
}
function chksvc() {
    httpreq "$REQURL/v1/health/service/$1" | jsoni
}
function stt() {
    httpreq "$REQURL/v1/health/state/$1" | jsoni
}
function unreg() {
    httpreq -X PUT "$REQURL/v1/agent/service/deregister/$1" | jsoni
}
function svcs2() {
    httpreq "$REQURL/v1/catalog/services" | jsoni
}

function svclist() {
    #svcs | grep '"Service":' | awk -F '\"' '{print $4}' | sort -u
    svcs2 | egrep '".+\":' | awk -F '\"' '{print $2}' | sort -u
}
function chklist() {
    #chks | grep '"ServiceName":' | awk -F '\"' '{print $4}' | sort -u
    svcs2 | egrep '".+\":' | awk -F '\"' '{print $2}' | sort -u
}

function run() {
    [ "Z" = "Z$silent_mode" ] && echo $1; $1 
}
function svcfind() {
    for name in `svclist | grep $1`; do run "svc $name"; done
}
function chkfind() {
    for name in `chklist | grep $1`; do run "chk $name"; done
}
function allfind() {
    for name in `svclist | grep $1`; do run "chksvc $name"; done
}

function find() {
    for name in `echo "$2"`; do 
        if [ "$name" = "$1" ]; then echo "$1"; fi
    done
}

function help() {
    echo "conservice [-s] [command] [service-name]"
    echo "  -s                  silenet mode"
    echo "  svcs                show all services"
    echo "  chks                show all health check"
    echo "  svclist             list all services name"
    echo "  chklist             list all health checks name"
    echo "  ----"   
    echo "  svc    [service]    show the given service"
    echo "  chk    [service]    show the given health check"
    echo "  chksvc [service]    show the given service and health"
    echo "  stt    [state]      show health state on passing, "
    echo "                           warning or critical"
    echo "  unreg  [service]    de-register the given service"
    echo "  ----"
    echo "  svcfind [name]      find services by name"
    echo "  chkfind [name]      find health checks by name"
    echo "  allfind [name]      find state and health checks by name"
    exit 1 
}

if [ "-s" = "$1" ]; then silent_mode=1; shift; fi
if [ "Z$1" != "Z" ]; then
    arg_command="svc chk chksvc stt unreg svcfind chkfind allfind"
    noarg_command="chks svcs svclist chklist"
    cmd=`find $1 "$arg_command"`
    if [ "Z$cmd" != "Z" ]; then 
        if [ "Z$2" != "Z" ]; then
           $cmd $2; 
        else
           echo %%command reqire args: $1 [name]
           help
        fi
    else
        cmd=`find $1 "$noarg_command"`
        if [ "Z$cmd" != "Z" ]; then
            $cmd; 
        else
           echo %%bad command: $1
           help
        fi
    fi
else
    help
fi

