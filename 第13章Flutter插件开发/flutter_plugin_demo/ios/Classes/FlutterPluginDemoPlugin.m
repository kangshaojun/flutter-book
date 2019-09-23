#import "FlutterPluginDemoPlugin.h"

@implementation FlutterPluginDemoPlugin
/**插件注册*/
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    //定义与上层代码通信的通道 注意标识符要与上层代码保持一致
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_plugin_demo"
                                     binaryMessenger:[registrar messenger]];
    FlutterPluginDemoPlugin* instance = [[FlutterPluginDemoPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    //判断上层调用的方法
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        //调用成功后返回系统版本
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
