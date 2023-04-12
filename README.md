## [TUIC](https://github.com/EAimTY/tuic) 安装指南

1. 下载程序

:. **linux-amd64**

```
sudo rm -f /usr/local/bin/tuic && curl -Lo /usr/local/bin/tuic https://github.com/EAimTY/tuic/releases/download/0.8.5/tuic-server-0.8.5-x86_64-linux-musl && chmod +x /usr/local/bin/tuic
```

:. **linux-arm64**

```
sudo rm -f /usr/local/bin/tuic && curl -Lo /usr/local/bin/tuic https://github.com/EAimTY/tuic/releases/download/tuic-server-0.8.5-aarch64-linux-musl && chmod +x /usr/local/bin/tuic
```

2. 下载配置

```
sudo mkdir -p /etc/tuic && curl -Lo /etc/tuic/config.json https://raw.githubusercontent.com/fy-deng/tuic-install/diy/config_server.json
```

3. 下载systemctl配置

```
curl -Lo /etc/systemd/system/tuic.service https://raw.githubusercontent.com/fy-deng/tuic-install/diy/tuic.service && systemctl daemon-reload
```

4. 上传证书和私钥

- 将证书文件改名为 **cert.crt**，将私钥文件改名为 **private.key**，将它们上传到 **/etc/ssl/private/** 目录。

5. 启动程序

```
 systemctl enable --now tuic && sleep 0.2 && systemctl status tuic
```

| 项目 | |
| :--- | :--- |
| 程序 | **/usr/local/bin/tuic** |
| 配置 | **/etc/tuic/config.json** |
| 检查 | `/usr/local/bin/tuic -c /etc/tuic/config.json` |
| 查看日志 | `journalctl -u tuic --output cat -e` |
| 实时日志 | `journalctl -u tuic --output cat -f` |

## v2rayN - V6.X 配置示例

<details><summary>点击查看</summary>

1. 下载Windows客户端程序[tuic-client-0.8.5-x86_64-windows-msvc.exe](https://github.com/EAimTY/tuic/releases/download/0.8.5/tuic-client-0.8.5-x86_64-windows-msvc.exe)，重命名为tuic.exe，复制到v2rayN\bin\tuic文件夹。

2. 下载客户端配置[config_client.json](https://raw.githubusercontent.com/fy-deng/tuic-install/diy/config_client.json)，修改chika.example.com为证书中包含的域名，修改10.0.0.1为VPS的IP。

3. 服务器 ——> 添加自定义配置服务器 ——> 浏览 ——> 选择客户端配置 ——> Core类型 tuic ——> Socks端口 50001

![1](https://user-images.githubusercontent.com/88967758/227561846-0f93ca76-0dce-41d3-9232-bd25a29276cf.png)

小技巧：只要证书在有效期内，证书中包含的域名不用解析到VPS的IP。一份证书，在多个VPS上使用。

</details>

## Shadowrocket 配置示例

<details><summary>点击查看</summary><br>

| 选项 | 值 |
| :--- | :--- |
| 类型 | TUIC |
| 地址 | VPS的IP |
| 端口 | 16386 |
| 密码 | chika |
| 模式 | bbr |
| 允许不安全 | 不选 |
| UDP转发 | 选上 |
| SNI | 证书中包含的域名 |
| ALPN | h3 |

</details>
