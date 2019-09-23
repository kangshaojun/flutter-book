package com.nativeweb;

import android.annotation.SuppressLint;
import android.content.Context;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import static io.flutter.plugin.common.MethodChannel.MethodCallHandler;

/**
 * 实现PlatformView及MethodCallHandler接口
 * PlatformView接品主要定义了返回视图getView及销毁视图dispose两个方法
 * MethodCallHandler接口主要定义了onMethodCall方法
 */
public class FlutterWeb implements PlatformView,MethodCallHandler {

    //上下文
    Context context;
    //注册器
    Registrar registrar;
    //原生WebView组件
    WebView webView;
    //方法通道
    MethodChannel channel;

    //设置JavaScript支持
    @SuppressLint("SetJavaScriptEnabled")
    FlutterWeb(Context context,Registrar registrar, int id){
        this.context = context;
        this.registrar = registrar;
        //获取原生WebView组件实例
        webView = getWebView(registrar);
        //实例化方法通道 channel的名字需和上层保持一致
        channel = new MethodChannel(registrar.messenger(),"nativeweb_"+ id);
        //设置方法调用处理器
        channel.setMethodCallHandler(this);
    }

    //返回原生视图即WebView组件实例
    @Override
    public View getView(){ return  webView; }

    //销毁视图
    @Override
    public void dispose(){
    }

    //创建原生WebView对象
    private WebView getWebView(Registrar registrar){
        WebView webView = new WebView(registrar.context());
        webView.setWebViewClient(new WebViewClient());
        //设置JavaScript支持
        webView.getSettings().setJavaScriptEnabled(true);
        return webView;
    }

    /**
     * 重写MethodCallHandler的onMethodCall方法
     * 此方法用于上层调用底层方法处理
     */
    @Override
    public void onMethodCall(MethodCall call,MethodChannel.Result result){
        switch (call.method){
            //调用WebView的loadUrl方法加载网页 传入参数为网址
            case "loadUrl":
                String url = call.arguments.toString();
                webView.loadUrl(url);
                break;
            default:
                result.notImplemented();
        }
    }
}
