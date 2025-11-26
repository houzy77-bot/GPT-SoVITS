#!/bin/bash
source /home/xiaohouzi/anaconda3/etc/profile.d/conda.sh
conda activate gptsovits

# 进入TTS项目目录
cd /home/xiaohouzi/GPT-SoVITS/

# 启动你的 TTS 服务端
python api_v2.py -a 127.0.0.1 -p 9880 -c GPT_SoVITS/configs/tts_infer.yaml