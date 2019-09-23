#import "FlutterWeb.h"

//FlutterWebFactory实现
@implementation FlutterWebFactory{
    //定义消息通讯工具对象
    NSObject<FlutterBinaryMessenger>* _messenger;
}

//初始化消息通讯工具messenger方法实现
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger{
    self = [super init];
    if(self){
        _messenger = messenger;
    }
    return self;
}

//创建方法编解码器
-(NSObject<FlutterMethodCodec>*)createArgsCodec{
    return [FlutterStandardMethodCodec sharedInstance];
}

//创建并返回FlutterWebController 即返回FlutterPlatformView实例
-(NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    FlutterWebController* webviewController =
    [[FlutterWebController alloc] initWithWithFrame:frame
                                     viewIdentifier:viewId
                                          arguments:args
                                    binaryMessenger:_messenger];
    return webviewController;
}
@end

//FlutterWebController实现
@implementation FlutterWebController{
    //原生WKWebView组件
    WKWebView* _webView;
    //视图id
    int64_t _viewId;
    //方法通道
    FlutterMethodChannel* _channel;
}

//创建WebView对象 创建方法通道 设置方法调用处理器
-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId arguments:(id)args
                 binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger {
    if([super init]){
        //视图id
        _viewId = viewId;
        //初始化WKWebView对象
        _webView = [[WKWebView alloc] initWithFrame:frame];
        //channelName的名字需和上层保持一致
        NSString* channelName = [NSString stringWithFormat:@"nativeweb_%lld",viewId];
        //实例化方法通道
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        //设置方法调用处理器
        [_channel setMethodCallHandler:^(FlutterMethodCall*call, FlutterResult result){
            [weakSelf onMethodCall:call result:result];
        }];
    }
    return self;
}

//获取原生视图
- (UIView*)view{
    return _webView;
}

/**
 * 方法调用处理器
 * 此方法用于上层调用底层方法处理
 */
-(void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    //判断参数并调用加载网页方法
    if([[call method] isEqualToString:@"loadUrl"]){
        [self onLoadUrl:call result:result];
    }else{
        result(FlutterMethodNotImplemented);
    }
}

-(void)onLoadUrl:(FlutterMethodCall*)call result:(FlutterResult)result{
    NSString* url = [call arguments];
    if(![self loadUrl:url]){
        result([FlutterError errorWithCode:@"error code" message:@"error message" details:@"error details"]);
    }else{
        result(nil);
    }
}

//WebView加载页面
-(bool)loadUrl:(NSString*)url{
    NSURL* nsUrl = [NSURL URLWithString:url];
    if(!nsUrl){
        return false;
    }
    NSURLRequest* req = [NSURLRequest requestWithURL:nsUrl];
    [_webView loadRequest:req];
    return true;
}

@end

