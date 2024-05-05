## 安装app到手机

- 下载adb ： https://developer.android.com/tools/releases/platform-tools?hl=zh-cn
- adb root 
- adb install <apk路径>

## 查询电池循环次数

```
adb shell
cat /sys/class/power_supply/battery/uevent
```

 POWER_SUPPLY_CYCLE_COUNT就是



## pixel手机自动校准时间

```
adb shell settings put global ntp_server time.apple.com
```



## pixel 刷系统

**准备**

- 下载系统映像： https://developers.google.com/android/images?hl=zh-cn

- 下载Win USB驱动：https://developer.android.com/studio/run/win-usb

**步骤**

1. 手机进入fastboot模式：重启手机，然后按住 电源键+电量减键
2. 用线连接手机和电脑，更新上面的win usb驱动
3. 双击flash-all.bat （如果想备份文件就编辑flash-all.bat文件，将文件中的-w删去即可）

**其他**

- [Pixel手机官方包线刷教程（可修复分区异常）](https://zhuanlan.zhihu.com/p/638915928)
- [Google Pixel 4XL线刷固件、刷入Magisk面具进行root、解锁雷达和电信 Volte全记录](https://www.kejiwanjia.net/jiaocheng/102516.html)





