cd /v2raybin
sed -i "s/PORT/$PORT/g" config.json
./v2ray &
cd /argobin
wget --no-check-certificate -O argo https://github.com/cloudflare/cloudflared/releases/download/latest/cloudflared-linux-amd64
chmod 755 argo
echo $JSON > argo.json
wget -O cert.pem $CERT
sed -i "s/PORT/$PORT/g" config.yml
sed -i "s/ID/$ID/g" config.yml
sed -i "s/DOM/$DOM/g" config.yml
./argo --origincert cert.pem  tunnel -config config.yml run $ID
