package com.adn.flutter.adn_flutter_offerwall.adn_flutter_offerwall

import androidx.annotation.NonNull
import com.buzzvil.buzzad.sdk.BuzzAd
import com.buzzvil.buzzad.sdk.UserProfile
import io.flutter.embedding.android.FlutterActivity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AdnFlutterOfferwallPlugin */
class AdnFlutterOfferwallPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var activity: FlutterActivity? = null
  private var userProfile: UserProfile? = null
  private var userId: String? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "adn_flutter_offerwall")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when(call.method) {
      "init" -> init(call,result)
      "setGender" -> setGender(call, result)
      "setBirthYear" -> setBirthYear(call, result)
      "setUserId" -> setUserId(call, result)
      "showOfferWall" -> showOfferWall(call, result)
      else -> result.notImplemented()
    }
  }

  private fun init(@NonNull call: MethodCall, @NonNull result: Result) {
    if (activity == null) {
      return result.error("ERROR", "Activity is null", null)
    }
    val appKey = call.argument("appKey") as String?
      ?: return result.error("ERROR", "appKey is null", null)
    BuzzAd.init(appKey, activity)
    return result.success(null)
  }

  private fun setUserId(@NonNull call: MethodCall, @NonNull result: Result) {
    userId = call.argument("userId") as String?
      ?: return result.error("ERROR", "userId is null", null)
    return result.success(null)
  }

  private fun setGender(@NonNull call: MethodCall, @NonNull result: Result) {
    val gender = call.argument("gender") as String?
      ?: return result.error("ERROR", "gender is null", null)
    if(userProfile == null) userProfile = BuzzAd.getUserProfile()
    userProfile?.setGender(gender)
    return result.success(null)
  }

  private fun setBirthYear(@NonNull call: MethodCall, @NonNull result: Result) {
    val birthYear = call.argument("birthYear") as Int?
      ?: return result.error("ERROR", "birthYear is null", null)
    if(userProfile == null) userProfile = BuzzAd.getUserProfile()
    userProfile?.setBirthYear(birthYear)
    return result.success(null)
  }

  private fun showOfferWall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (activity == null) {
      return result.error("ERROR", "Activity is null", null)
    }
    val title = call.argument("title") as String?
      ?: return result.error("ERROR", "title is null", null)
    BuzzAd.showOfferWall(activity, title, userId)
    return result.success(null)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity as FlutterActivity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity as FlutterActivity
  }

  override fun onDetachedFromActivity() {
    activity = null
  }
}
