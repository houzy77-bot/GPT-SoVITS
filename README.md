### 添加了适用于migpt的接口
使用方法：
配置api_V2.py中第150行的SPEAKERS字典，
```json
SPEAKERS=[
    {
        "name":"曼波",
        "gender":"女",
        "speaker":"BV1",

        "ref_audio_path":"voice/曼波参考音频.wav",
        "prompt_text":"点击文本选项，再点击对应的文本素材，选择文本朗读找到曼波音色即可",
        "prompt_lang":"zh",
        "text_lang":"zh"
    }
```
例如
然后访问
'http://URL/api/tts.mp3?speaker=BV1&text=这是一个文本'
其中speaker与字典中配置的speaker一致
'http://URL/api/speakers'
如果返回speaker字典和音频流即可

### 配置开机自启：

新建 systemd 单元文件：`/etc/systemd/system/gptsovitsApi.service`

```ini
[Unit]
Description=GPTsovits Server Service
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=root/自己的用户名

ExecStartPre=/bin/sleep 20
ExecStart=//home/yourname/GPT-SoVITS/start.sh
# 崩了自动拉起
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
```

启用并启动：

```bash
sudo systemctl daemon-reload
sudo systemctl enable gptsovitsApi.service
sudo systemctl start gptsovitsApi.service
sudo systemctl status gptsovitsApi.service
```

如果失败，用日志排查：

```bash
journalctl -u gptsovitsApi.service -f
```
