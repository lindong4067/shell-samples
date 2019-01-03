#!/bin/sh

function print_usage()
{
    echo -e "Usage: isptool <option> [<time>]"
    echo -e "-planned [<time>]"
    echo -e "   Param 'time' is a timetamp(millisecond)"
    echo -e "   If 'time' is not specified, set the cause of the last ISP downtime to 'planned'"
    echo -e "   If 'time' is specified, set the cause to 'planned' on the ISP downtime record which overlaps with the input 'time'"
    echo -e "-export"
    echo -e "   Export all ISP information to tar file, which include system availability report and all downtime records with cause"
    echo -e "   The tar file is stored under '/export/home/mpcadmin/' and filename like 'ISPFile_XXX.zip'"
    echo -e "   Cleanup ISP data in DB"
    echo -e "-h"
    echo -e "   Help"
}

function print_notify()
{
    echo -e "Notify:"
    echo -e "    isptool command only allow executed for user 'mpcadmin'"
}

function exchange_token()
{
    echo `curl -m 30 -s -k -H Content-Type:application/json -X POST -d "{\"auth\":{\"method\":\"password\",\"password\":{\"user_id\":\"SysAdmin\",\"password\":\"${1}\"}}}" -D- https://${2}:${3}/v1/data/${4}_${5}_${6}/${5}/tokens | grep -E "HTTP|X-Auth-Token"`
}

function request_url()
{
    echo `curl -m 30 -s -k -H Content-Type:application/json -X GET -H X-Auth-Token:${1} -D- https://${2}:${3}/v1/data/${4}_${5}_${6}/${5}/isp/${7} | grep "HTTP"`
}

function request_url_withparam()
{
    echo `curl -m 30 -s -k -H Content-Type:application/json -X GET -H X-Auth-Token:${1} -D- https://${2}:${3}/v1/data/${4}_${5}_${6}/${5}/isp/${7}?time=${8} | grep "HTTP"`
}

user=`whoami`

if [[ "${user}X" != "mpcadminX" ]]; then
    print_notify
    exit 1 
fi

if [[ $# -lt 1 || $# -gt 2 ]]; then
    print_usage
    exit 1
elif [[ "${1}X" != "-plannedX" && "${1}X" != "-exportX" ]]; then
    print_usage
    exit 1
elif [[ "${1}X" == "-exportX" && $# -gt 1 ]]; then
    print_usage
    exit 1
fi

echo "Please input your password:"
read -s pwd

if [[ "${1}X" == "-plannedX" ]]; then
    if [[ $# -eq 2 ]]; then
        n1=`echo $2 | sed 's/[0-9]//g'`
	if [[ ! -z ${n1} ]]; then
            echo "Param $2 is not a num, please input timestamp."
            exit 1
        fi
    fi
fi

if [[ ! -f /var/opt/setup/site.export ]]; then
    exit 0
fi
. /var/opt/setup/site.export

OAMCENTER_IP=${OAM_Center_IP}
if [[ "${OAMCENTER_IP}X" == "X" ]]; then
    OAMCENTER_IP=${OAM_Center_Local_IP}
fi
OAMCENTER_PORT=${OAM_Center_PORT}

header=`exchange_token $pwd $OAMCENTER_IP $OAMCENTER_PORT $VERSION $NODE_NAME $CLUSTER_NAME`

if [[ ! -n "${header}" ]]; then
    echo "Logon OAMCenter failed, OAMCenter not running"
    exit 1
elif [[ ${header} =~ 'HTTP/1.1 403' ]]; then
    echo "Logon OAMCenter failed, maybe password error or unable to access database"
    exit 1
elif [[ ${header} =~ 'HTTP/1.1 500' ]]; then
    echo "Server connection error"
    exit 1
elif [[ ${header} =~ 'X-Auth-Token' ]]; then
    code=`echo ${header} | grep X-Auth-Token | awk -F':' '{ print $2 }' | tr -d '[ \t]' | head -1`
    cli=${1}
    if [[ $# -gt 1 ]]; then
        res1=`request_url_withparam $code $OAMCENTER_IP $OAMCENTER_PORT $VERSION $NODE_NAME $CLUSTER_NAME ${cli:1} $2`
        if [[ ${res1} =~ 'HTTP/1.1 200' ]]; then
            echo "Command executed successfully"
        else
            echo "Command execution failed"
        fi
    else
        res2=`request_url $code $OAMCENTER_IP $OAMCENTER_PORT $VERSION $NODE_NAME $CLUSTER_NAME ${cli:1}`
        if [[ ${res2} =~ 'HTTP/1.1 200' ]]; then
            echo "Command executed successfully"
        else
            echo "Command execution failed"
        fi
    fi
fi

