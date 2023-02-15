#!/usr/bin/bash
start=$1
end=$2

read -r -d '' USES << EOM
Incorrect arguments passed
    Uses:
    query.sh 
    query.sh 2022-11-14T16:06:20.549Z 2022-11-14T16:06:20.549Z
EOM

case $# in
      1)
        date  "+%Y-%m-%dT%H:%M:%SZ" -d "$start" > /dev/null 2>&1
        if [ $? != 0 ]
        then
            echo Start date $start is NOT a valid YYYY-MM-DDThh:mm:ssZ date
            exit 1
        else 
           if [ -z "$end" ]
              then
                echo "$USES"
                exit 1
            fi
        fi
    ;;
    2)
        date  "+%Y-%m-%dT%H:%M:%SZ" -d "$end" > /dev/null 2>&1
        if [ $? != 0 ]
        then
            echo End date $end is NOT a valid YYYY-MM-DDThh:mm:ssZ date
            exit 1
        fi
    ;;
    *)
        echo "$USES"
    exit 1;;
esac

start=$(date -d $start +'%Y-%m-%dT%H:%M:%SZ')
end=$(date -d $end +'%Y-%m-%dT%H:%M:%SZ')
echo $start $end
>abc.csv
curl -i -k --location --request POST 'https://netsim-influx.cisco.com:8086/api/v2/query?org=Netsim&bucket=cml_diagnostics&percision=s' --header 'Authorization: Token U-zD__YRR-QaJDcI4oOp9cpLvbnzswDdNdvUOXmYn-8U2et6V1WU3tjqgmUAWvZIplj0ItkL07kwbjWYE8kIsg==' --header 'Accept: application/csv' --header 'Content-Type: application/vnd.flux' --data '
from(bucket: "cml_diagnostics")
  |> range(start: '"$start"', stop: '"$end"')
  |> filter(fn: (r) => r["_measurement"] == "domstats")
  |> filter(fn: (r) => r["_field"] == "total_vms")
  |> filter(fn: (r) => r["host"] == "netsim-api")
  |> filter(fn: (r) => r["instance"] == "cxl-bgl-cml-015.cisco.com")
  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)
  |> yield(name: "mean")' > abc.csv