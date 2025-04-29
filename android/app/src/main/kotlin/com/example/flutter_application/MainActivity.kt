package com.example.flutter_application

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import com.facebook.FacebookSdk
import com.facebook.appevents.AppEventsLogger

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Imposta il client token di Facebook
        FacebookSdk.setClientToken("3979324252320575")

        // Inizializza il Facebook SDK
        FacebookSdk.sdkInitialize(applicationContext)
        AppEventsLogger.activateApp(application)
    }
}
