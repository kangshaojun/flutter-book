package com.demo.flutter_plugin_demo;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterPluginDemoPlugin */
public class FlutterPluginDemoPlugin implements MethodCallHandler {
  /**插件注册*/
  public static void registerWith(Registrar registrar) {
    //定义与上层代码通信的通道 注意标识符要与上层代码保持一致
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_plugin_demo");
    channel.setMethodCallHandler(new FlutterPluginDemoPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    //判断上层调用的方法
    if (call.method.equals("getPlatformVersion")) {
      //调用成功后返回系统版本
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }
}
