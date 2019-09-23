#import "BatteryPlugin.h"

//电池电量插件实现FlutterStreamHandler协议
@interface FLTBatteryPlugin () <FlutterStreamHandler>
@end

@implementation FLTBatteryPlugin {
  //此对象用于通知上层事件并返回原生层数据
  FlutterEventSink _eventSink;
}

/*插件注册*/
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FLTBatteryPlugin* instance = [[FLTBatteryPlugin alloc] init];

  //实例化方法通道 channel的名字需和上层保持一致
  FlutterMethodChannel* channel =
      [FlutterMethodChannel methodChannelWithName:@"method_battery_level"
                                  binaryMessenger:[registrar messenger]];

  [registrar addMethodCallDelegate:instance channel:channel];
   
  //实例化事件通道 channel的名字需和上层保持一致
  FlutterEventChannel* chargingChannel =
      [FlutterEventChannel eventChannelWithName:@"event_battery_charging"
                                binaryMessenger:[registrar messenger]];
  [chargingChannel setStreamHandler:instance];
}

//此方法用于上层调用底层方法处理
- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  //判断方法名
  if ([@"getBatteryLevel" isEqualToString:call.method]) {
    //获取手机电量值
    int batteryLevel = [self getBatteryLevel];
    if (batteryLevel == -1) {
      //获取电量值失败返回错误信息
      result([FlutterError errorWithCode:@"UNAVAILABLE"
                                 message:@"电池电量无法获取"
                                 details:nil]);
    } else {
      //获取电量值成功后将值返回给上层使用
      result(@(batteryLevel));
    }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

//消息中心观察者回调方法 用于接收电池充电状态消息
- (void)onBatteryStateDidChange:(NSNotification*)notification {
  [self sendBatteryStateEvent];
}

//发送电池充电状态值给上层使用
- (void)sendBatteryStateEvent {
  if (!_eventSink) return;
  //获取当前电池充电状态
  UIDeviceBatteryState state = [[UIDevice currentDevice] batteryState];
  switch (state) {
    //已充满状态
    case UIDeviceBatteryStateFull:
      //使用FlutterEventSink返回已充满状态
      _eventSink(@"full");
      break;
     //充电状态
    case UIDeviceBatteryStateCharging:
      //使用FlutterEventSink返回充电状态
      _eventSink(@"charging");
      break;
    //未充电状态
    case UIDeviceBatteryStateUnplugged:
      //使用FlutterEventSink返回未充电状态
      _eventSink(@"discharging");
      break;
    default:
      //当未能读到充电状态值时返回错误信息
      _eventSink([FlutterError errorWithCode:@"UNAVAILABLE"
                                     message:@"不能读取到充电状态"
                                     details:nil]);
      break;
  }
}

//调用原生层API获取系统电池电量
- (int)getBatteryLevel {
  UIDevice* device = UIDevice.currentDevice;
  device.batteryMonitoringEnabled = YES;
  if (device.batteryState == UIDeviceBatteryStateUnknown) {
    return -1;
  } else {
    return ((int)(device.batteryLevel * 100));
  }
}

#pragma mark FlutterStreamHandler impl

/**
 * 实现FlutterStreamHandler的onListenWithArguments方法
 * 此方法表示FlutterEventSink准备完成可以向上层发送数据了
 */
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
  _eventSink = eventSink;
  //启动本地电池充电状态监听
  [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
  [self sendBatteryStateEvent];
  //添加消息中心观察者为当前对象self 并设置回调方法onBatteryStateDidChange
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(onBatteryStateDidChange:)
                                               name:UIDeviceBatteryStateDidChangeNotification
                                             object:nil];
  return nil;
}

/**
 * 重写FlutterStreamHandler的onCancelWithArguments方法
 * 此方法主要用于取消原生层接收电池状态变化值
 */
- (FlutterError*)onCancelWithArguments:(id)arguments {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  _eventSink = nil;
  return nil;
}

@end
