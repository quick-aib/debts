#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -f functionname -s startdate -e enddate "
   echo -e "\t-f functionname should be functionCurl1 functionCurl2"
   echo -e "\t-s startdate"
   echo -e "\t-e enddate"
   exit 1 # Exit script after printing help
}
functionCurl1()
{
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

}
while getopts "q:s:e" opt
do
   case "$opt" in
      a ) functionname="$OPTARG" ;;
      b ) start="$OPTARG" ;;
      c ) end="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$functionname" ] || [ -z "$start" ] || [ -z "$end" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "$functionname"
echo "$start"
echo "$end"
$functionname
