cd /v2raybin
sed -i "s/PORT/$PORT/g" config.json
./v2ray &
cd /argobin
echo $JSON > argo.json
wget -O cert.pem $CERT
sed -i "s/PORT/$PORT/g" config.yml
sed -i "s/ID/$ID/g" config.yml
./argo --origincert cert.pem  tunnel -config config.yml run $ID
