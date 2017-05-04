

#import <UIKit/UIKit.h>
#import "CacheTool.h"
//缓存文件目录
#ifndef CachePath
#define CachePath
#define DocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject
#define LibraryPath NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject
#define TempPath NSTemporaryDirectory()
#endif
@implementation CacheTool

//计算全部缓存文件大小
+ (CGFloat)cacheSize{
    return [self folderSizeAtPath:DocumentPath] + [self folderSizeAtPath:LibraryPath] + [self folderSizeAtPath:TempPath];
}
//删除全部缓存
+ (void)cleanCaches{
    [self cleanCache:DocumentPath];
    [self cleanCache:LibraryPath];
    [self cleanCache:TempPath];
}

// 计算单个目录缓存文件大小
+ (CGFloat)folderSizeAtPath:(NSString *)path{
    // 利用NSFileManager实现对文件的管理  
    NSFileManager *manager = [NSFileManager defaultManager];  
    CGFloat size = 0;  
    if ([manager fileExistsAtPath:path]) {  
        // 获取该目录下的文件，计算其大小  
        NSArray *childrenFile = [manager subpathsAtPath:path];  
        for (NSString *fileName in childrenFile) {  
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];  
            size += [manager attributesOfItemAtPath:absolutePath error:nil].fileSize;  
        }  
        // 将大小转化为M  
        return size / 1024.0 / 1024.0;  
    }  
    return 0;  
}  
// 根据路径删除文件  
+ (void)cleanCache:(NSString *)path{
    // 利用NSFileManager实现对文件的管理  
    NSFileManager *fileManager = [NSFileManager defaultManager];  
    if ([fileManager fileExistsAtPath:path]) {  
        // 获取该路径下面的文件名  
        NSArray *childrenFiles = [fileManager subpathsAtPath:path];  
        for (NSString *fileName in childrenFiles) {  
            // 拼接路径  
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];  
            // 将文件删除  
            [fileManager removeItemAtPath:absolutePath error:nil];  
        }  
    }
}
@end
