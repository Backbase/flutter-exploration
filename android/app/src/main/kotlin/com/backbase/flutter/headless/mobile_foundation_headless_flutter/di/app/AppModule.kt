package com.backbase.flutter.headless.mobile_foundation_headless_flutter.di.app

import android.content.Context
import com.backbase.android.dbs.dataproviders.NetworkDBSDataProvider
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.auth.AppRouting
import com.backbase.flutter.headless.mobile_foundation_headless_flutter.auth.impl.AppRouter
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import org.koin.dsl.module

/**
 * Dependency setup on app level.
 *
 * Created by Backbase R&D B.V on 17/08/2023.
 */
internal fun appModule(context: Context) = module {
    factory { CoroutineScope(SupervisorJob() + Dispatchers.Main.immediate) }
    single { NetworkDBSDataProvider(context) }
    // Navigation dependencies
    single<AppRouting> { AppRouter() }
}
