#!/bin/bash
echo "time now is:"
#获取当前时间，格式是时分，例如当前是上午8：50，hh=850
hh=`date '+%H%M'`
if [ $hh -le 1200 ]
then
echo "good morning"
curl 'https://oapi.dingtalk.com/robot/send?access_token=3da81d20415a2ac6e3d59fa6c03441c53b3aee49a396f31c5a785e60e557cfd2' \
 -H 'Content-Type: application/json' \
 -d '{"msgtype": "text","text": {"content":"该起床了，今天小宝文又好看了，小尚又帅了，今天是美好的一天呢。"}}'
else
echo "good night"
curl 'https://oapi.dingtalk.com/robot/send?access_token=3da81d20415a2ac6e3d59fa6c03441c53b3aee49a396f31c5a785e60e557cfd2' \
 -H 'Content-Type: application/json' \
 -d '{"msgtype": "text","text": {"content":"该下班了，小宝文美美哒，小尚工作水平更进一层楼，今天收获满满呢。"}}'
fi
