

package io.flutter.plugins.battery;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/**
 * 电池电量插件需要实现MethodCallHandler及StreamHandler接口
 */
public class BatteryPlugin implements MethodCallHandler, StreamHandler {

  /*插件注册*/
  public static void registerWith(PluginRegistry.Registrar registrar) {
    //实例化方法通道 channel的名字需和上层保持一致
    final MethodChannel methodChannel =
        new MethodChannel(registrar.messenger(), "method_battery_level");
    //实例化事件通道 channel的名字需和上层保持一致
    final EventChannel eventChannel =
        new EventChannel(registrar.messenger(), "event_battery_charging");
    //实例化电池电量插件并传入PluginRegistry.Registrar对象
    final BatteryPlugin instance = new BatteryPlugin(registrar);
    //绑定方法通道的Handler对象
    eventChannel.setStreamHandler(instance);
    //绑定事件通道的Handler对象
    methodChannel.setMethodCallHandler(instance);
  }

  //构建方法 传入的参数即为MainActivity
  BatteryPlugin(PluginRegistry.Registrar registrar) {
    this.registrar = registrar;
  }

  //定义插件注册对象
  private final PluginRegistry.Registrar registrar;
  //定义广播接收对象
  private BroadcastReceiver chargingStateChangeReceiver;

  /**
   * 重写MethodCallHandler的onMethodCall方法
   * 此方法用于上层调用底层方法处理
   */
  @Override
  public void onMethodCall(MethodCall call, Result result) {
    //判断方法名
    if (call.method.equals("getBatteryLevel")) {
      //获取手机电量值
      int batteryLevel = getBatteryLevel();

      if (batteryLevel != -1) {
        //获取电量值成功后将值返回给上层使用
        result.success(batteryLevel);
      } else {
        //获取电量值失败返回错误信息
        result.error("UNAVAILABLE", "电池电量无法获取", null);
      }
    } else {
      result.notImplemented();
    }
  }

  /**
   * 重写StreamHandler的onListen方法
   * 此方法表示EventSink准备完成可以向上层发送数据了
   */
  @Override
  public void onListen(Object arguments, EventSink events) {
    //注册原生层接收者对象 用于接收电池状态变化值
    chargingStateChangeReceiver = createChargingStateChangeReceiver(events);
    registrar
        .context()
        .registerReceiver(
            chargingStateChangeReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
  }

  /**
   * 重写StreamHandler的onCancel方法
   * 此方法主要用于取消原生层接收电池状态变化值
   */
  @Override
  public void onCancel(Object arguments) {
    registrar.context().unregisterReceiver(chargingStateChangeReceiver);
    chargingStateChangeReceiver = null;
  }

  //调用原生层API获取系统电池电量
  private int getBatteryLevel() {
    int batteryLevel = -1;
    Context context = registrar.context();
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager =
          (BatteryManager) context.getSystemService(context.BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent =
          new ContextWrapper(context)
              .registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel =
          (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100)
              / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }

    return batteryLevel;
  }

  /**
   * 返回原生层广播消息接收者对象
   */
  private BroadcastReceiver createChargingStateChangeReceiver(final EventSink events) {
    return new BroadcastReceiver() {
      @Override
      public void onReceive(Context context, Intent intent) {
        //电池状态
        int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);

        switch (status) {
          //充电状态
          case BatteryManager.BATTERY_STATUS_CHARGING:
            //使用EventSink返回充电状态
            events.success("charging");
            break;
            //已充满状态
          case BatteryManager.BATTERY_STATUS_FULL:
            //使用EventSink返回已充满状态
            events.success("full");
            break;
            //未充电状态
          case BatteryManager.BATTERY_STATUS_DISCHARGING:
            //使用EventSink返回未充电状态
            events.success("discharging");
            break;
          default:
            //当未能读到充电状态值时返回错误信息
            events.error("UNAVAILABLE", "不能读取到充电状态值", null);
            break;
        }
      }
    };
  }
}
