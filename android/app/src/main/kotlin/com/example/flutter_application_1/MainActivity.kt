package com.example.flutter_application_1

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugin.common.PluginRegistry;

import androidx.annotation.NonNull
import android.app.ActivityManager
import android.app.TaskInfo
import android.os.Environment

import java.io.File
import java.lang.reflect.Method
import java.util.*
import kotlin.collections.ArrayList
import be.tramckrijte.workmanager.WorkmanagerPlugin;

import java.util.Timer
import kotlin.concurrent.schedule

class MainActivity: FlutterActivity(){
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "android_app_retain").apply {
            setMethodCallHandler { method, result ->
                if (method.method == "sendToBackground") {
                    Timer("SettingUp", false).schedule(1000) { 
                        moveTaskToBack(true);
                    }
                    result.success(taskId);
                }
            }
            
        }
    }
}
