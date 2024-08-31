# 自定义View布局

## 1 布局流程的完全解析

 整体流程：

- 测量流程：从根View递归调用每一级子View的measure()，对它们进行测量
- 布局流程：从根View递归调用每一级子View的layout()方法，把测量过程得出的子View的位置和尺寸传给子View，子View保存