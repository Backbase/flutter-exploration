package com.backbase.flutter.headless.mobile_foundation_headless_flutter

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.findNavController
import com.backbase.android.Backbase
import com.backbase.android.core.utils.BBLogger
import com.backbase.android.identity.client.BBIdentityAuthClient
import com.backbase.android.identity.device.BBDeviceAuthenticator
import com.backbase.android.identity.journey.authentication.initAuthenticationJourney
import com.backbase.android.listeners.ModelListener
import com.backbase.android.model.Model
import com.backbase.android.model.ModelSource
import com.backbase.android.utils.net.response.Response
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.auth.AppRouting
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.auth.CompositeSessionListener
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.databinding.ActivityBackbaseBinding
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.di.app.appModule
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.di.identityAuthModule
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.di.securityModule
import com.google.android.material.color.MaterialColors
import com.google.android.material.textfield.TextInputEditText
import io.flutter.embedding.android.FlutterActivity
import org.koin.android.ext.android.inject
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.GlobalContext
import org.koin.core.context.loadKoinModules

@Suppress("DEPRECATION")
class BackbaseActivity : AppCompatActivity() {

    private val navigator: AppRouting by inject()
    private lateinit var binding: ActivityBackbaseBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityBackbaseBinding.inflate(layoutInflater)
        setContentView(binding.root)
        navigator.bind(this@BackbaseActivity)
    }

    override fun onDestroy() {
        super.onDestroy()
        navigator.unbind()
    }
}
