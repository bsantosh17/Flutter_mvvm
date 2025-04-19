# Keep all Flutter and plugin classes
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep Retrofit, Gson, OkHttp (if you use them)
-keep class retrofit2.** { *; }
-keep class com.google.gson.** { *; }
-keep class okhttp3.** { *; }
-keep class okio.** { *; }

-dontwarn retrofit2.**
-dontwarn com.google.gson.**
-dontwarn okhttp3.**
-dontwarn okio.**

# Keep JSON serialized models
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Keep annotations
-keepattributes *Annotation*

# Useful for third-party libraries
-keep class * extends java.util.ListResourceBundle {
    protected Object[][] getContents();
}
