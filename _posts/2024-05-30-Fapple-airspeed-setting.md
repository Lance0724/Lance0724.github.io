---
title: Fapple空速计设置(For ardupilot)
layout: post
post-image: "/assets/images/QQ20240530235834.jpg"
description: 简单的介绍了Fapple空速计在Ardupilot固件上面的设置和使用
tags:
- Fapple
- Airspeed
- setting
---

在安装和设置空速计之前请先调试好飞机和飞控，待首飞完成以后再考虑安装空速计。

---

**空速计安装位置参考:**<br>
![Image1](/assets/images/c50017dd9e21457ddeb9f5648ff9eeaf.jpg)
![Image2](/assets/images/5fb531f0ef091a104c0427119ea1ad7f.jpg)
![Image3](/assets/images/Image_20240531001308.jpg)
![Image4](/assets/images/Image_20240531001255.jpg)

# 安装好空速计的首飞设置
1. ARSPD_TYPE = 1
 （修改保存并重连后其他参数才可见）
2. ARSPD_OPTIONS = 15
   (勾选DisableVoltageCorrection)
3. ARSPD_AUTOCAL = 1
4. ARSPD_SKIP_CAL = 1
上述参数一次性都改完后, 请立刻保存并给飞控重新上电, 重新上电之后再检查参数ARSPD_OFFSET是否等于0, 如果不是需要立刻设置为0之后保存并重新上电。

每一只Fapple空速计发货前都会精调校准漂移，所以可以把ARSPD_SKIP_CAL设置为1，这样飞控上电时也不用刻意的罩住空速计，也不怕地面上电时被风吹到。

# 首飞自动校准
起飞后用RTL模式或者Loiter模式上天绕圈至少5分钟，让飞控进行自动校准(每2分钟自动保存一次校准值，校准值会保存到参数ARSPD_RATIO)， 在自动校准过程中OSD会有提示。

# 空速计自动校准完场降落之后
降落后关闭空速计自动校准(正常飞行中一定要关闭自动校准)
ARSPD_AUTOCAL = 0
并检查参数ARSPD_RATIO。
如果调整了空速计安装角度，或者更换了空速计，请重置参数ARSPD_RATIO=2.0, 并重新自动校准。

# 使用空速计的正常飞行
空速计完成自动校准之后才能打开空速计控制
ARSPD_USE=1 或者 2
如果ARSPD_USE设置为2时，只有油门为0的时候飞控才读取空速值，这种模式专门针对部分滑翔机（空速计在机头螺旋桨后面的情况）
打开ARSPD_USE之后，空速计才会在自动油门模式(AUTO,CRUISE,FBWB,RTL)下参与飞机油门控制。

**请根据自己飞机在安全的情况下谨慎设置以下参数:**<br>
以下参数都以直接修改参数的形式说明, 如果通过图形界面修改请自行换算单位.

+ AIRSPEED_CRUISE: 自动油门模式下的目标空速(单位 : 米/秒 M/s ) (Ardupilot4.5以前的参数名TRIM_ARSPD_CM,注意这个旧参数单位厘米/s)
+ AIRSPEED_MIN: 自动油门(用于爬升和降高)下的最小空速，需设置大于失速空速20%的空速。(单位: 米/秒 M/s)(Ardupilot4.5以前的参数名ARSPD_FWB_MIN)
+ AIRSPEED_MAX: 自动油门(用于爬升和降高)下的最大空速，需高于ARSPD_FWB_MIN 至少50%的值，才能在自动爬升时获得足够油门。 (单位: 米/秒 M/s)(Ardupilot4.5以前的参数名ARSPD_FWB_MAX)
