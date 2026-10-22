# 来源与第三方组件

本项目为 TS3AudioBot 0.12.0 的Windows部署脚本与扩展集合，不是TeamSpeak官方客户端或服务器。

- TS3AudioBot／TSLib：[Splamy/TS3AudioBot 0.12.0](https://github.com/Splamy/TS3AudioBot/tree/0.12.0)，采用Open Software License 3.0；上游原文保存在 `licenses/TS3AudioBot-OSL-3.0.txt`。
- FFmpeg：首次安装从 [Gyan FFmpeg builds](https://www.gyan.dev/ffmpeg/builds/) 下载并校验其公布的SHA256；当前采用其essentials构建。保留的GPLv3原文见 `licenses/FFmpeg-GPL-3.0.txt`，具体二进制以下载构建附带的许可说明为准。
- yt-dlp：首次安装从 [yt-dlp官方Release](https://github.com/yt-dlp/yt-dlp/releases) 下载Windows可执行文件并对照同一Release的SHA256清单。
- DeepSeek：可选的外部API，使用者自行配置账号和Key。QQ音乐和网易云为外部音源平台，播放仍遵循其接口与账号权限。
- `assets/提示音.wav` 是生成的半秒测试提示音；未随整理版分发第三方音乐、游戏语音或梗音效。

上游可执行程序、原始依赖源码、第三方音乐素材和个人运行数据未直接纳入此仓库。独立编写的扩展尚未单独指定新的开源许可证；维护者可以后续选择适用的项目许可证，并继续保留上游声明。
