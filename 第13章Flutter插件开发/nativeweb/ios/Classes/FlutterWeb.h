#import <Flutter/Flutter.h>
#import <WebKit/WebKit.h>

/**
 *定义FlutterWebController接口
 *实现FlutterPlatformView协议
 *协议里定义了返回原生视图方法
 */
@interface FlutterWebController : NSObject <FlutterPlatformView>

//定义初始化Frame方法 传入视图id及消息通讯工具messenger
-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId
                       arguments:(id _Nullable)args
                 binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

/**
 * FlutterPlatformViewFactory工厂类
 * 初始化消息通讯工具方法initWithMessenger
 * 创建并返回PlatformView的实例createWithFrame 在其实现类里提供此方法
 */
@interface FlutterWebFactory : NSObject <FlutterPlatformViewFactory>

//定义初始化消息通讯工具messenger方法
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end
