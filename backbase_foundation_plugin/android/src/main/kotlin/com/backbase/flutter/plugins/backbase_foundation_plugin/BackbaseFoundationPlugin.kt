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

class BackbaseFoundationPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "backbase_foundation_plugin")
        channel.setMethodCallHandler(this)
    }
    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getToken" -> {
                val token = Backbase.requireInstance().authClient.authTokens?.get("Authorization")
                result.success(token)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
