# Smart Auth Plugin - Keep Credentials API classes
-keep class com.google.android.gms.auth.api.credentials.** { *; }
-dontwarn com.google.android.gms.auth.api.credentials.**

# Keep all classes used by smart_auth
-keep class fman.ge.smart_auth.** { *; }

# General Google Play Services rules
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**