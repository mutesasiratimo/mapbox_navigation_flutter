package com.mutesasira.mapboxnavigationflutter.activity

import android.app.Activity
import android.content.Intent
import com.mutesasira.mapboxnavigationflutter.models.Waypoint

object NavigationLauncher {
    const val KEY_ADD_WAYPOINTS = "com.my.mapbox.broadcast.ADD_WAYPOINTS"
    const val KEY_STOP_NAVIGATION = "com.my.mapbox.broadcast.STOP_NAVIGATION"
    
    fun startNavigation(activity: Activity, wayPoints: List<Waypoint>) {
        val navigationIntent = Intent(activity, NavigationActivity::class.java).apply {
            putExtra("waypoints", wayPoints as java.io.Serializable)
        }
        activity.startActivity(navigationIntent)
    }

    fun addWayPoints(activity: Activity, wayPoints: List<Waypoint>) {
        val navigationIntent = Intent(activity, NavigationActivity::class.java).apply {
            action = KEY_ADD_WAYPOINTS
            putExtra("isAddingWayPoints", true)
            putExtra("waypoints", wayPoints as java.io.Serializable)
        }
        activity.sendBroadcast(navigationIntent)
    }

    fun stopNavigation(activity: Activity) {
        val stopIntent = Intent().apply {
            action = KEY_STOP_NAVIGATION
        }
        activity.sendBroadcast(stopIntent)
    }
}
