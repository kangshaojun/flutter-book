import 'dart:async';
import 'package:flutter/services.dart';

//定义电池三种状态 充满电 充电 未充电
enum BatteryState { full, charging, discharging }

class Battery {

  //静态实例
  static Battery _instance;

  //私有构造方法
  Battery.private(this._methodChannel, this._eventChannel);

  //使用工厂模式只创建一个实例
  factory Battery() {
    if (_instance == null) {
      //创建方法通道 名称必需及原生层保持一致
      final MethodChannel methodChannel = const MethodChannel('method_battery_level');
      //创建事件通道 名称必需及原生层保持一致
      final EventChannel eventChannel = const EventChannel('event_battery_charging');
      _instance = Battery.private(methodChannel, eventChannel);
    }
    return _instance;
  }

  //定义方法通道
  final MethodChannel _methodChannel;
  //定义事件通道
  final EventChannel _eventChannel;
  Stream<BatteryState> _onBatteryStateChanged;

  /**
   * 返回当前电池电量的百分比
   * 调用底层方法getBatteryLevel
   * 调用成功后通过then方法获取值result
   */
  Future<int> get batteryLevel => _methodChannel
      .invokeMethod<int>('getBatteryLevel')
      .then<int>((dynamic result) => result);

  /**
   * 获取当前电池状态
   * 通过事件通道EventChannel的receiveBroadcastStream方法接收广播事件流
   * 事件里带的数据即为电池状态BatteryState
   */
  Stream<BatteryState> get onBatteryStateChanged {
    if (_onBatteryStateChanged == null) {
      _onBatteryStateChanged = _eventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => _parseBatteryState(event));
    }
    return _onBatteryStateChanged;
  }
}

//处理不同的电池状态值
BatteryState _parseBatteryState(String state) {
  switch (state) {
    case 'full':
      return BatteryState.full;
    case 'charging':
      return BatteryState.charging;
    case 'discharging':
      return BatteryState.discharging;
    default:
      throw ArgumentError('没有此状态:$state');
  }
}
