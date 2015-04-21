export WHEN=`date +%s`
curl "http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=sf-muni&r=27&s=3813" > r27-p-3813-${WHEN}.xml
curl "http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=sf-muni&r=27&s=3612" > r27-p-3612-${WHEN}.xml
curl "http://webservices.nextbus.com/service/publicXMLFeed?command=vehicleLocations&a=sf-muni&r=27&t=0" > r27-l-${WHEN}.xml

aws s3 cp r27-p-3813-${WHEN}.xml s3://route-27-history/r27-p-3813-${WHEN}.xml
aws s3 cp r27-p-3612-${WHEN}.xml s3://route-27-history/r27-p-3612-${WHEN}.xml
aws s3 cp r27-l-${WHEN}.xml s3://route-27-history/r27-l-${WHEN}.xml

rm *.xml
