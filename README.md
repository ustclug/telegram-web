# Telegram Web

Telegram Web is a self-hosted Telegram Web Client.

The original project [webogram](https://github.com/zhukov/webogram) is written by zhukov.

## Deploy

First of all, you need to apply an application on [my.telegram.org](https://my.telegram.org), and get your own `API_ID` and `API_HASH`.

Because the project is build via docker, you should [install docker](https://docs.docker.com/engine/installation/) before running the following command:

```shell
docker run -itd --restart=always \
	-e API_ID={{your own API_ID}} \
	-e API_HASH={{your own API_HASH}} \
	-e HOSTNAME={{your own hostname, like telegram.example.com}} \
	-e NGINX_RESOLVER={{DNS server, default 8.8.8.8 if not set}} \
	-p 80:80 \
	ustclug/telegram-web
```

***

[Maintaining documentation](https://docs.ustclug.org/services/telegram-web/telegram-web.html)
