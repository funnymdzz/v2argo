cd /v2raybin
sed -i "s/PORT/$PORT/g" config.json
./v2ray &
cd /argobin
echo $JSON > argo.json
echo $CERT > cert.pem
sed -i "s/PORT/$PORT/g" config.yml
sed -i "s/ID/$ID/g" config.yml
./argo --cred-file cert.pem  tunnel -config new.yml run cm
