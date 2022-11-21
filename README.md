<p align="center">
    <h1 align="center">项目管理系统</h1>
</p>
<p align="center">
  <a aria-label="website" href="https://yaoapps.com" target="_blank">
    Website
  </a>
  ·
  <a aria-label="producthunt" href="https://www.producthunt.com/posts/yao-app-engine" target="_blank">
    Producthunt
  </a>
  ·
  <a aria-label="twitter" href="https://twitter.com/YaoApp" target="_blank">
    Twitter
  </a>
  ·
  <a aria-label="discord" href="https://discord.gg/nsKmCXwvxU" target="_blank">
    Discord
  </a>
</p>

项目管理系统后台 Demo。

![演示](https://release-bj-1252011659.cos.ap-beijing.myqcloud.com/docs/demo-plm/819e9d8b-5b0c-4112-988b-71f78b48755b.gif)

[线上体验地址](https://plm.iqka.com/admin/login/admin)
默认用户名: `xiang@iqka.com` , 默认密码: `A123456p+`

Yao deom-plm 采用 <a href="https://github.com/YaoApp/yao">Yao 应用引擎开发</a>，适用于快速搭建应用管理后台和 API 接口，快速制作应用 API 接口等场景。

### 安装

#### 使用 Yao

[安装 YAO](https://yaoapps.com/doc/%E4%BB%8B%E7%BB%8D/%E5%AE%89%E8%A3%85%E8%B0%83%E8%AF%95)

```bash
mkdir -p /data/app
yao get yaoapp/demo-plm
yao start
```

登录管理后台

管理后台地址: `http://<IP>:<PORT>/admin/`

示例:`http://127.0.0.1:5099/admin`

默认用户名: `xiang@iqka.com`

默认密码: `A123456p+`

#### 使用 Docker

[安装 Docker](https://docs.docker.com/get-docker/)

```
docker pull yaoapp/demo-plm:0.10.2-amd64
```

```bash
docker run -d --restart unless-stopped --name demo-plm -p 5099:5099  yaoapp/demo-plm:0.10.2-amd64
```

登录管理后台

管理后台地址: `http://<IP>:<PORT>/admin/`

默认用户名: `xiang@iqka.com`

默认密码: `A123456p+`
