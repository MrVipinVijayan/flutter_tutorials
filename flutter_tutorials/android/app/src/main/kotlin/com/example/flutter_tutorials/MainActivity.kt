package com.example.flutter_tutorials

import android.content.Context
import com.ryanheise.audioservice.AudioServicePlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }

    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        return AudioServicePlugin.getFlutterEngine(context)
    }

    override fun getCachedEngineId(): String {
        AudioServicePlugin.getFlutterEngine(this);
        return AudioServicePlugin.getFlutterEngineId();
    }

    override fun shouldDestroyEngineWithHost(): Boolean {
        return false;
    }
}
