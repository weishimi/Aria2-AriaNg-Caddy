# Aria2-AriaNg-Caddy

Aria2 AriaNg Caddy(FileManager)
---
- Docker
- Aiar2
- AriaNg
- Caddy (browse, 目录列表显示，方便获取下载链接，断点续传)
- Caddy (filemanager, 方便文件管理)

### 链接：

- [aria2/aria2][1]
- [mholt/caddy][2]
- [XUJINKAI/aria2-with-webui][3]
- [wahyd4/aria2-ariang-docker][4]

### 使用：

Docker：`curl -sSL https://get.docker.com/ | sh`

    docker run -d \
        --name aria2 \
        -p 6800:6800 \
        -p 10086:10086 \
    registry-intl.ap-southeast-1.aliyuncs.com/weishimi/aria2

- 目录显示：`http://ip:10086`，用户名：`admin`，密码：`pwd123`；
- AriaNg地址：`http://ip:10086/aria2/`，用户名：`admin`，密码：`pwd123`；
- Caddy FileManager：`http://ip:10086/mgr/`，用户名：`admin`，密码：`admin`，登陆后修改。

**目录挂载或数据卷：**

    -v /DOWNLOAD_DIR:/data
    -v /CONFIG_DIR:/conf
    # Aria2配置文件，可选，名称要求是/CONFIG_DIR/aria2.conf

**变量：**

    ENV SECRET=Hello
    ENV BASICAUTH_USER=admin
    ENV BASICAUTH_PWD=pwd123

注意设置`SECRET`之后启动容器，需要在打开AriaNg页面后首先设置`Aria2 RPC 密钥`，不然连接不上。

**示例：**

    docker run -d \
        --name aria2 \
        --restart=always \
        -e SECRET=Hello \
        -e BASICAUTH_USER=admin \
        -e BASICAUTH_PWD=pwd123 \
        -v /root/data:/data \
        -p 6800:6800 \
        -p 1080:10086 \
    registry-intl.ap-southeast-1.aliyuncs.com/weishimi/aria2

### 构建：

    docker build -t aria2 .

  [1]: https://github.com/aria2/aria2
  [2]: https://github.com/mholt/caddy
  [3]: https://github.com/XUJINKAI/aria2-with-webui
  [4]: https://github.com/wahyd4/aria2-ariang-docker
