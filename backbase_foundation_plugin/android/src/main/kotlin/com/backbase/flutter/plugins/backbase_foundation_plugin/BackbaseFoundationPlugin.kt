package com.backbase.flutter.plugins.backbase_foundation_plugin

import android.content.Context
import com.backbase.android.Backbase
import com.backbase.android.clients.auth.PasswordAuthListener
import com.backbase.android.core.utils.BBLogger
import com.backbase.android.identity.client.BBIdentityAuthClient
import com.backbase.android.identity.common.routers.BBIdentityRouterContext
import com.backbase.android.identity.common.routers.BBIdentityRouterContract
import com.backbase.android.identity.common.routers.BBIdentityRouterError
import com.backbase.android.identity.fido.FidoUafFacetUtils
import com.backbase.android.identity.fido.passcode.BBPasscodeRouter
import com.backbase.android.identity.fido.passcode.BBPasscodeRouterContract
import com.backbase.android.identity.fido.passcode.BBPasscodeRouterData
import com.backbase.android.listeners.ModelListener
import com.backbase.android.model.Model
import com.backbase.android.model.ModelSource
import com.backbase.android.utils.net.response.Response
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** BackbaseFoundationPlugin */

const val TAG = "BackbaseFoundationPlugin"

class BackbaseFoundationPlugin : FlutterPlugin, MethodCallHandler {

    companion object {
    }

    lateinit var sdk: Backbase
    lateinit var authClient: BBIdentityAuthClient
    val passcodeRouter: BBPasscodeRouterImpl = BBPasscodeRouterImpl()
    val passwordAuthListener: PasswordAuthListenerImpl = PasswordAuthListenerImpl()

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "backbase_foundation_plugin")
        channel.setMethodCallHandler(this)
        sdk = initializeBackbase(flutterPluginBinding.applicationContext)
        authClient = initializeBBIdentityAuthClient(flutterPluginBinding.applicationContext, sdk)
    }

    private fun initializeBBIdentityAuthClient(
        context: Context,
        sdk: Backbase
    ): BBIdentityAuthClient {
        val authClient = BBIdentityAuthClient(context, "")
        authClient.addRouter(passcodeRouter)
        sdk.registerAuthClient(authClient)
        return authClient
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        println("method >>>>>>>>>>>${call.method}")
        println("argument>>>>>>>>>>>${call.arguments<Any>()}")
        println("result>>>>>>>>>>>>$result")
        passwordAuthListener.result=result
        passcodeRouter.result=result
        when (call.method) {
            "authenticate" -> {
                authClient.reset()
                val username = call.argument<String>("username").toString()
                val password = call.argument<String>("password").toString()
                authClient.authenticate(
                    username.toCharArray(),
                    password.toCharArray(),
                    null,
                    null,
                    passwordAuthListener,
                    "token"
                )
            }
            "enterPasscode" -> {
                val passcode = call.argument<String>("passcode").toString()
                passcodeRouter.enterPasscode(passcode)

            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun initializeBackbase(context: Context): Backbase {
        if (Backbase.getInstance() == null) {
            if (BuildConfig.DEBUG) {
                BBLogger.setLogLevel(BBLogger.LogLevel.DEBUG)
                BBLogger.debug(TAG, "Facet ID: <${FidoUafFacetUtils.getFacetID(context)}>")
            }
            Backbase.initialize(context, "backbase/config.json", false)
            Backbase.requireInstance().getModel(
                object : ModelListener<Model> {
                    override fun onModelReady(model: Model) =
                        BBLogger.debug(TAG, "Model loaded")

                    override fun onError(response: Response) = throw IllegalArgumentException(
                        "backbaseConfigAssetPath must point to a valid model. Instead, ${response.errorMessage}"
                    )
                },
                ModelSource.LOCAL
            )

        }
        return Backbase.requireInstance()
    }

    class BBPasscodeRouterImpl : BBPasscodeRouter {
        lateinit var result: Result
        private lateinit var contract: BBPasscodeRouterContract
        private lateinit var routerContext: BBIdentityRouterContext
        override fun onError(
            error: BBIdentityRouterError,
            routerContext: BBIdentityRouterContext,
            contract: BBIdentityRouterContract
        ) {
            BBLogger.debug(TAG, "BBPasscodeRouter | onError: routerContext = $routerContext")
            BBLogger.debug(TAG, "BBPasscodeRouter | onError: contract = $contract")
            BBLogger.debug(TAG, "BBPasscodeRouter | onError: error = $error")
            result.error("${error.response.responseCode}", error.response.errorMessage, null)
        }

        override fun onSuccess(
            routerContext: BBIdentityRouterContext,
            contract: BBIdentityRouterContract
        ) {
            BBLogger.debug(TAG, "BBPasscodeRouter | onSuccess: routerContext = $routerContext")
            BBLogger.debug(TAG, "BBPasscodeRouter | onSuccess: contract = $contract")
            contract.finish(routerContext)
            //result.success("true")
        }

        override fun promptForPasscode(
            routerContext: BBIdentityRouterContext,
            contract: BBPasscodeRouterContract,
            data: BBPasscodeRouterData
        ) {
            BBLogger.debug(
                TAG,
                "BBPasscodeRouter | promptForPasscode: routerContext = $routerContext"
            )
            BBLogger.debug(TAG, "BBPasscodeRouter | promptForPasscode: contract = $contract")
            BBLogger.debug(TAG, "BBPasscodeRouter | promptForPasscode: data = $data")
            this.contract = contract
            this.routerContext = routerContext
            this.result.success("true")
        }

        fun enterPasscode(passcode: String) {
            contract.entered(passcode.toByteArray(), routerContext)
        }

    }

    class PasswordAuthListenerImpl: PasswordAuthListener {
        lateinit var result: Result
        override fun onAuthSuccess(p0: MutableMap<String, MutableList<String>>?) {
            BBLogger.debug(TAG, "PasswordAuthListener | onAuthSuccess:${p0}")
            val token = Backbase.requireInstance().authClient.authTokens?.get("Authorization")
            result.success(token)
        }

        override fun onAuthError(p0: Response) {
            BBLogger.debug(TAG, "PasswordAuthListener | onAuthError:${p0.causeTrace}")
            result.error("${p0.responseCode}", p0.errorMessage, null)
        }

    }

}
