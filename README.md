# RCacheTool
# 闭着眼都能清除缓存😂😂😂
# 使用
## OC工程可以直接将.h和.m拖入工程,如果为swift,则配置桥接文件
## 普通弹窗清除缓存
### OC -- [CacheTool alertToClean];
### Swift -- CacheTool.AlertToClean()
## 获取缓存大小,超过1024K按M显示,否则为K
### OC -- [Cache cacheSize];
### Swift -- CacheTool.cacheSize()
## 清除缓存方法
### OC -- [Cache cleanCaches];
### Swift -- CacheTool.cleanCaches()
