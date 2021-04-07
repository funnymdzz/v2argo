[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
部署在heroku 用cloudflare argo tunnel 传输v2ray流量 延迟较低
注意：
1.因为cf argo的二进制文件需要glibc所以不能用alpine 占用可能比直接走heroku高
2.需要用自动Ping维持xxx.herokuapp.com的地址 不然会自动休眠须访问对应herokuapp地址启动
3.请保管好你的cart.pem
