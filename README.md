## Chinese (简体中文）
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
* 已经基本可以使用
* 部署在heroku 用cloudflare argo tunnel 传输v2ray流量 延迟较低 使用了alpinelinux 占用比ubuntu等小很多
* 怎么用自己看entrypoint.sh
## 注意：
* 1.因为cf argo的二进制文件需要glibc 所以alpine安装了glibc
* 2.需要用自动Ping维持xxx.herokuapp.com的地址 不然会自动休眠须访问对应herokuapp地址启动
* 3.请保管好你的cert.pem



## English
It is not useable
