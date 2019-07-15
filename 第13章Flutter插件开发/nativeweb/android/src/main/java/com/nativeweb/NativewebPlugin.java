package com.nativeweb;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** NativewebPlugin */
public class NativewebPlugin{
  /**
   * 插件注册
   * @param registrar
   */
  public static void registerWith(Registrar registrar) {

    //这里的nativeweb要与上层viewType值保持一致
    registrar
            .platformViewRegistry()
            .registerViewFactory("nativeweb",new WebFactory(registrar));

  }

}
