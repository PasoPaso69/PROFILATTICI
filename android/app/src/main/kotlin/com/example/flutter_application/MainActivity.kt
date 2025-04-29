package com.example.flutter_application

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import com.facebook.FacebookSdk
import com.facebook.appevents.AppEventsLogger

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Imposta il client token di Facebook
        FacebookSdk.setClientToken("0adc23dff93f0d7dc596f54035f15bff")

        // Inizializza il Facebook SDK
        FacebookSdk.sdkInitialize(applicationContext)
        AppEventsLogger.activateApp(application)
    }
}
