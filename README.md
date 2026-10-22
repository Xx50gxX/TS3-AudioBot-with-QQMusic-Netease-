# TeamSpeak 3 中文音乐机器人扩展

基于 [TS3AudioBot 0.12.0](https://github.com/Splamy/TS3AudioBot)，面向 Windows x64 的音乐、歌单、自然语言助手和入场音效工具。当前整理版本：2026.10.21。

## 支持的功能

- QQ 音乐和网易云的单曲搜索、分享链接、歌单；多个歌单收藏可按名称调用。
- DeepSeek 自然语言点歌、歌手批量播放、完整专辑、队尾添加和下一首插播；私聊可免前缀，频道支持 `!ai` 和 `！ai`。
- 机器人昵称显示歌曲，`!now` 和 `!upnext` 查看当前及后续歌曲。
- 音乐响度均衡和持续缓冲；默认 QQ 开播缓冲5秒、网易云3秒。
- 本地短音效最长10秒，音效音量独立于音乐；入场音效v3支持多人依次排队，前一段结束后间隔至少0.5秒。音乐暂停时手动与入场音效仍可播放，歌曲保持暂停和原进度。
- 中文帮助、管理员权限和本地账号导入工具。

歌曲可播放范围由平台返回和账号权限决定；没有可用音源时会报告失败。平台接口可能变化。DeepSeek 是可选功能，需要自行配置 API Key；本地音乐和明确指令不依赖它。

## 首次使用

1. 在一份独立的新文件夹里解压本项目，安装 [Microsoft Visual C++ v14 x64 运行库](https://aka.ms/vc14/vc_redist.x64.exe)。
2. 双击 **安装机器人.cmd**，填写服务器地址、频道、机器人昵称和自己的 TS 唯一 ID。工具会从官方来源下载 TS3AudioBot、FFmpeg、yt-dlp，并生成本机配置。
3. 双击 **start-musicbot.cmd**。在机器人所在频道发送 `!help`。
4. 本地音乐放入 `runtime/music/`。QQ／网易云登录按需使用 `connect-qqmusic.cmd`／`connect-netease.cmd`。
5. 需要自然语言助手时运行 **设置DeepSeek密钥.cmd**，再使用 `!ai preview 播放晴天` 验证；管理员用 `!ai mode live` 启用实际操作。

初始只有填写的管理员可使用 AI、管理歌单和入场绑定；其他人可使用基础点歌和只读状态。AI 默认预览模式，私聊开启，额度6次/分钟、100次/UTC日，可在自己的 `runtime/bots/musicbot/ai-settings.json` 中调整到支持的范围。已存在机器人身份时首次安装会停止，避免覆盖原配置。

## 常用指令

```text
!qqs 歌名 歌手
!qqp 0
!wy 歌名 歌手
!pl save 收藏A 歌单分享链接
!pl play 收藏A
!ai 播放周杰伦的歌
!ai 下一首播放晴天
!now
!upnext 5
!sfx play 提示音
!sfx volume 20
!welcome set me 提示音
!welcome status
```

完整说明：[使用说明](docs/USAGE.md) · [指令速查](docs/COMMANDS.txt) · [源码编译与升级](docs/DEVELOPMENT.md) · [上传 GitHub](docs/GITHUB_UPLOAD.md)。

## 文件结构

| 路径 | 内容 |
| --- | --- |
| `src/` | 最新插件和缓冲入口的 C# 源码 |
| `bin/` | 本项目的小型预编译插件与缓冲入口 |
| `tools/` | 安装、账号导入、构建和校验工具 |
| `examples/` | 没有真实账号的配置模板 |
| `assets/` | 生成的半秒提示音 |
| `docs/` | 使用、开发和 GitHub 上传说明 |
| `licenses/` | 上游许可证原文 |

`runtime/` 和 `downloads/` 由首次安装生成，并已被 `.gitignore` 排除。此源码包不含机器人私钥、账号 Cookie、DeepSeek Key、个人歌单、入场绑定、音乐素材、日志或历史备份；上游大程序由安装工具下载。

## 验证范围与来源

代码沿用已验证的 AI test13、音效独立音量v4和10秒上限；入场音效v3加入暂停可播v1，已检查真实音频时钟下的PCM、暂停进度、多人排队和暂停／恢复交接。整理版还核对发布文件哈希、配置模板、全新安装流程和源码编译。实际连服及各平台账号播放需在部署环境中验证。

TS3AudioBot／TSLib 及 FFmpeg 的来源与许可证见 [第三方说明](THIRD_PARTY_NOTICES.md)。仓库未代替维护者为独立编写的扩展代码指定新的开源许可证。
