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

