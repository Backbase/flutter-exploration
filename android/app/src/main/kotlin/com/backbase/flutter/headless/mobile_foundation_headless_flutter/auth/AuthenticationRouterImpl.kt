package com.backbase.flutter.headless.mobile_foundation_headless_flutter.auth

import android.content.Context
import android.content.Intent
import com.backbase.android.identity.journey.authentication.AuthenticationRouter
import io.flutter.embedding.android.FlutterActivity

/**
 * Authentication router implementation
 *
 * Created by Backbase R&D B.V on 17/08/2023.
 */
internal class AuthenticationRouterImpl(
    private val appNavigator: AppRouting,
) : AuthenticationRouter {

    override fun onAuthenticated() {
        appNavigator.getActivity()?.let {
            val intent = Intent(appNavigator.getActivity(), FlutterActivity::class.java)
            it.startActivity(intent)
            it.finish()
        }
    }
}
