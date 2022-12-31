package com.example.methodchannel

import android.os.Handler;
import android.os.Looper;

import androidx.annotation.NonNull;

import java.util.Timer;
import java.util.TimerTask;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * MethodchanneltestPlugin
 */
public class MethodchanneltestPlugin implements FlutterPlugin, MethodCallHandler {

    static MethodChannel channel;
    Handler handler = new Handler(Looper.getMainLooper());
    Timer eventTimer = new Timer();
    int count = 0;

    // 메소드 채널 생성 및 핸들러 등록(AndroidX)
    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "methodchanneltest");
        channel.setMethodCallHandler(new MethodchanneltestPlugin());
    }

    // 메소드 채널 생성 및 핸들러 등록(non AndroidX)
    public static void registerWith(Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), "methodchanneltest");
        channel.setMethodCallHandler(new MethodchanneltestPlugin());
    }

    // 플러터발 메소드 호출을 수신하는 핸들러
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        // getCount를 수신한 경우 fireEvent 메소드를 호출
        if (call.method.equals("getCount")) {
            getCount();
        } else {
            result.notImplemented();
        }
    }


    // pushCount 함수를 요청하면서 count 값을 전달
    void getCount() {

        // 현재 구현 처럼 onMethodCall에서 직접 getCount()를 호출하는 경우 아래와 같이 직접 pushCount를 호출 가능
        // channel.invokeMethod("pushCount", ++count);

        // onAttachedToEngine()나 registerWith()에서 getCount()를 호출하는 경우는
        // 아래와 같이 별도의 스레드로 분리해서 pushCount를 호출 가능
        handler.post(new Runnable() {
            @Override
            public void run() {
                channel.invokeMethod("pushCount", ++count);
            }
        });
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }
}