package com.backbase.flutter.headless.mobile_foundation_headless_flutter.auth

import android.app.Activity
import androidx.navigation.NavController

/**
 * Router for the apps
 *
 * Created by Backbase R&D B.V on 17/08/2023.
 */
interface AppRouting {
    /** Method to bind the root [NavController] of the app
     */
    fun bind(activity: Activity)

    /** Method to unbind the root [NavController] of the app
     *  Simple implementation is to set null
     */
    fun unbind()
    fun getActivity(): Activity?
}
