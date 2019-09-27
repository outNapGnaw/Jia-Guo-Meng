#!/bin/bash
# 分辨率 1280*720 不匹配的自行修改
# 320 770, 560 630, 830 490
# 307 970, 560 840, 820 720
# 320 1200, 560 1100, 820 920
# 670 1640, 840 1590, 950 1500

Line1arr=("320 770" "560 630" "830 490") # 第一行建筑坐标
Line2arr=("307 970" "560 840" "820 720") # 第二行建筑坐标
Line3arr=("320 1200" "560 1100" "820 920") # 第三行建筑坐标
Train=("670 1640" "840 1590" "950 1500") # 火车三个货物坐标
AllBuilding=("${Line1arr[@]}"  "${Line2arr[@]}" "${Line3arr[@]}")
COUNTER1=0
while [ $COUNTER1 -lt 1000000 ]
do
  echo "火车上货 开始"
  for tra in "${Train[@]}"
  do
    # 处理异常弹框 点击一下关闭弹框先
    adb shell input tap $tra 
    for building in "${AllBuilding[@]}"
    do
      for count in 1 2 3
      do 
        adb shell input swipe $tra  $building 100
        # echo $tra  $building
        sleep 0.1
      done
    done
  done
  echo "火车上货 结束"
  sleep 0.1
done
