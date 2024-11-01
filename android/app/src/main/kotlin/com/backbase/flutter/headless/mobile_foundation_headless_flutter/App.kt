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
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.auth.CompositeSessionListener
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.di.app.appModule
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.di.identityAuthModule
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.di.securityModule
import io.flutter.app.FlutterApplication
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.GlobalContext
import org.koin.core.context.loadKoinModules

@Suppress("DEPRECATION")
class App : FlutterApplication() {

    private val sessionEmitter = CompositeSessionListener()
    private val authClient: BBIdentityAuthClient by lazy {
        BBIdentityAuthClient(this, "").apply {
            startSessionObserver(sessionEmitter)
            addAuthenticator(BBDeviceAuthenticator())
        }
    }
    override fun onCreate() {
        super.onCreate()
        configureBackbaseDependencies()
    }

    private fun configureBackbaseDependencies() {
        initializeBackbase()
        setupAuthClient()
        setupDependencies()
        initAuthenticationJourney()
    }

    private fun setupDependencies() = GlobalContext.startKoin {
        val context=this@App.applicationContext
        androidContext(context)
        loadKoinModules(
            listOf(
                securityModule(context),
                appModule(context),
                identityAuthModule(sessionEmitter),
            )
        )
    }

    private fun initializeBackbase(backbaseConfigAssetPath: String = "backbase/config.json",encrypted: Boolean = false) {
        Backbase.initialize(this, backbaseConfigAssetPath, encrypted)
        with(Backbase.requireInstance()) {
            // We need to keep a local model in our code so that Authenticators can be injected there at runtime.
            getModel(
                object : ModelListener<Model> {
                    override fun onModelReady(p0: Model) {}
                    override fun onError(response: Response) = throw IllegalArgumentException()
                },
                ModelSource.LOCAL
            )
        }
    }
    private fun setupAuthClient() {
        val backbase = checkNotNull(Backbase.getInstance())
        backbase.registerAuthClient(authClient)
    }
}
