package com.nativeweb;
import android.content.Context;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import static io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * PlatformView工厂类
 * 创建并返回PlatformView的实例
 */
public class WebFactory extends PlatformViewFactory {

    //定义注册器
    private final Registrar mPluginRegistrar;

    /**
     * 构造方法 传入注册器
     * @param registrar
     */
    public WebFactory(Registrar registrar){
        //使用标准消息编解码器
        super(StandardMessageCodec.INSTANCE);
        mPluginRegistrar = registrar;
    }

    /**
     * 重写create方法
     * 创建并返回PlatformView的实例
     * FlutterWeb是实现PlatformView接口的类
     */
    @Override
    public PlatformView create(Context context, int i, Object o){
        return new FlutterWeb(context,mPluginRegistrar,i);
    }

}
