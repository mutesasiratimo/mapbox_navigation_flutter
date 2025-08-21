package com.mutesasira.fluttermapboxnavigation.utilities

import android.app.Activity
import android.view.ViewGroup
import com.mutesasira.fluttermapboxnavigation.activity.NavigationLauncher
import com.mutesasira.fluttermapboxnavigation.models.MapBoxEvents
import com.mapbox.navigation.core.MapboxNavigation
import com.mapbox.navigation.core.lifecycle.MapboxNavigationObserver
import com.mapbox.navigation.dropin.R
import com.mapbox.navigation.dropin.internal.extensions.updateMargins
import com.mapbox.navigation.ui.base.lifecycle.UIBinder
import com.mapbox.navigation.ui.base.lifecycle.UIComponent
import com.mapbox.navigation.ui.base.view.MapboxExtendableButton

// package com.mutesasira.fluttermapboxnavigation.utilities

// import android.app.Activity
// import android.view.ViewGroup
// import com.mutesasira.fluttermapboxnavigation.models.MapBoxEvents
// import com.mapbox.navigation.core.MapboxNavigation
// import com.mapbox.navigation.core.lifecycle.MapboxNavigationObserver
// import com.mapbox.navigation.ui.base.lifecycle.UIBinder
// import com.mapbox.navigation.ui.base.lifecycle.UIComponent

class CustomInfoPanelEndNavButtonBinder(
    val activity: Activity
) : UIBinder {
    override fun bind(viewGroup: ViewGroup): MapboxNavigationObserver {
        // Remove any existing views to ensure nothing is displayed
        viewGroup.removeAllViews()

        // You can return an empty UIComponent to do nothing
        return object : UIComponent() {
            override fun onAttached(mapboxNavigation: MapboxNavigation) {
                super.onAttached(mapboxNavigation)
                // No action required since the button is not added
            }
        }
    }
}


// class CustomInfoPanelEndNavButtonBinder(
//     val activity: Activity
// ) : UIBinder {
//     override fun bind(viewGroup: ViewGroup): MapboxNavigationObserver {
//         val button = MapboxExtendableButton(
//             viewGroup.context,
//             null,
//             R.style.DropInStyleExitButton
//         )
//         button.iconImage.setImageResource(R.drawable.mapbox_ic_stop_navigation)
//         viewGroup.removeAllViews()
//         viewGroup.addView(button)
//         button.updateMargins(
//             right = button.resources.getDimensionPixelSize(R.dimen.mapbox_infoPanel_paddingEnd)
//         )

//         return object : UIComponent() {
//             override fun onAttached(mapboxNavigation: MapboxNavigation) {
//                 super.onAttached(mapboxNavigation)
//                 button.setOnClickListener {
//                     mapboxNavigation.stopTripSession()
//                     PluginUtilities.sendEvent(MapBoxEvents.NAVIGATION_CANCELLED)
//                     //activity.finish()
//                 }
//             }
//         }
//     }
// }
