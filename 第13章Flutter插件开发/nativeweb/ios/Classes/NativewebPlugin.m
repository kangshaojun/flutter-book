#import "NativewebPlugin.h"
#import "FlutterWeb.h"
@implementation NativewebPlugin
//插件注册
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterWebFactory* webviewFactory =
    [[FlutterWebFactory alloc] initWithMessenger:registrar.messenger];
    //这里的nativeweb要与上层viewType值保持一致
    [registrar registerViewFactory:webviewFactory withId:@"nativeweb"];
}
@end
