# docker-compose-prometheus
通过docker compose部署prometheus、alertmanager、grafana、node-exporter、cadvisor服务端。
通过通过docker compose部署node-exporter、cadvisor客户端
***
使用Grafana+Prometheus+alertmanager+cadvisor+node_exporter组合，对服务器上Docker、宿主机状态等进行监控与报警。

使用前请修改Grafana配置文件中密码，当前`admin`密码为`qwe123!@#`

使用外部配置文件挂载到容器内部

文件结构：
```shell
docker-compose-prometheus/service/
├── alertmanager
│   └── config.yml
├── docker-compose.yml
├── grafana
│   ├── config.monitoring
│   └── provisioning
└── prometheus
    ├── alert.yml
    └── prometheus.yml
```

安装docker-compose：
```
1、docker-compose文件下载下来
2、chmod +x /usr/local/bin/docker-compose
3、ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
4、验证：
	docker -version # 返回版本号能正常使用
5、删除docker-compose 直接执行：
	rm /usr/local/bin/docker-compose
```
添加镜像加速：
```
tee /etc/docker/daemon.json <<-'EOF'
{
    "registry-mirrors": [
        "https://dockerproxy.com",
        "https://docker.mirrors.ustc.edu.cn",
        "https://docker.nju.edu.cn"
    ],
    "insecure-registries": [
        "192.168.188.251:8081"  # 私有harbor地址
    ]
}
EOF
```
重新加载并重启docker服务：
	systemctl daemon-reload && systemctl restart docker 

 grafana仪表盘模板ID:
 ```
    13868windows_exporter for Prometheus Dashboard EN
    12633Linux主机详情
    7362MySQL Overview
```
# 文中的镜像加速地址已经失效，请自行网上寻找能用的地址

