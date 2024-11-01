package com.backbase.flutter.headless.mobile_foundation_headless_flutter.auth.impl

import android.app.Activity
import androidx.navigation.NavController
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.auth.AppRouting

/**
 * App routing implementation
 *
 * Created by Backbase R&D B.V on 17/08/2023.
 */
class AppRouter() : AppRouting {

    private var activity: Activity? = null

    override fun bind(activity: Activity) {
        this.activity = activity
    }

    override fun unbind() {
        activity = null
    }

    override fun getActivity(): Activity? = activity
}
