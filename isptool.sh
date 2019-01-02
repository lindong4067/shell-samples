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
}

function print_notify()
{
    echo -e "Notify:"
    echo -e "    isptool command only allow executed for user 'mpcadmin'"
}

function exchange_token()
{
    #echo -e "${1}    ${2}    ${3}    ${4}    ${5}    ${6}"
    #token=`curl -i -m 30 -s -k -H Content-Type:application/json -X POST -d "{\"auth\":{\"method\":\"password\",\"password\":{\"user_id\":\"SysAdmin\",\"password\":\"${1}\"}}}" -D- https://${2}:${3}/v1/data/${4}_${5}_${6}/${5}/tokens | grep X-Auth-Token | awk -F':' '{ print $2 }' | tr -d '[ \t]' | head -1`
    
    #echo `curl -m 30 -s -k -H Content-Type:application/json -X POST -d '{"auth":{"method":"password","password":{"user_id":"SysAdmin","password":"$%Paper370"}}}' -D- https://linux-tot-49:20443/v1/data/18_gmpc_cluster/gmpc/tokens | grep -E "HTTP|X-Auth-Token"`
    
    echo `curl -m 30 -s -k -H Content-Type:application/json -X POST -d "{\"auth\":{\"method\":\"password\",\"password\":{\"user_id\":\"SysAdmin\",\"password\":\"${1}\"}}}" -D- https://${2}:${3}/v1/data/${4}_${5}_${6}/${5}/tokens | grep -E "HTTP|X-Auth-Token"`
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
	if [[ ! -z $n1 ]]; then
            echo "Param $2 is not a num, please input timestamp."
            exit 1
        fi
    fi
fi

if [[ ! -f /var/opt/setup/site.export ]]; then
    exit 0
fi
. /var/opt/setup/site.export

OAMCENTER_IP=$OAM_Center_IP
if [[ "${OAMCENTER_IP}X" == "X" ]]; then
    OAMCENTER_IP=$OAM_Center_Local_IP
fi
OAMCENTER_PORT=$OAM_Center_PORT

header=`exchange_token $pwd $OAMCENTER_IP $OAMCENTER_PORT $VERSION $NODE_NAME $CLUSTER_NAME`
echo "here 0"
echo ${header}
if [ ! -n "${header}" ]; then  
    echo "Logon OAMCenter failed, OAMCenter not running"  
else
    token=`echo ${header} | grep "X-Auth-Token"`
    echo "token=${token}"
    if [[ ! -n "${token}" ]]; then
        echo "here 1"
        echo ${token}
        exit 0
    else
        pwderr=`echo ${header} | grep "403"`
        echo "pwderr=${pwderr}"
        if [ ! -n ${pwderr} ]; then
            echo "here 2"
            echo "Logon OAMCenter failed, maybe password error or unable to access database"
            exit 1
        fi
        connec=`echo ${header} | grep "500"`
        echo "connec=${connec}" 
        if [ ! -n "${connec}" ]; then
            echo "here 3"
            echo "Server connection error"
            exit 1
        fi

    fi
fi    


echo "finish"
