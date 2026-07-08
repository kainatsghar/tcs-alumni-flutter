plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.viion.tcsalumniapp"

    compileSdk = 36

    defaultConfig {
        applicationId = "com.viion.tcsalumniapp"
        minSdk = 24
        targetSdk = 36
        versionCode = 41
        versionName = "1.0.29"
        multiDexEnabled = true
    }

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    signingConfigs {
        create("release") {
            storeFile = file("D:/jks/tcs/upload-keystore.jks")
            storePassword = "viper@1000"
            keyAlias = "upload"
            keyPassword = "viper@1000"
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    configurations.all {
        resolutionStrategy {
            // Force latest compatible versions
            force("com.google.android.gms:play-services-measurement:21.5.0")
            force("com.google.android.gms:play-services-measurement-api:21.5.0")
            force("com.google.android.gms:play-services-measurement-impl:21.5.0")
            force("com.google.android.gms:play-services-measurement-base:21.5.0")
            force("com.google.android.gms:play-services-measurement-sdk:21.5.0")
            force("com.google.android.gms:play-services-measurement-sdk-api:21.5.0")

            force("androidx.appcompat:appcompat:1.4.2")
            force("androidx.appcompat:appcompat-resources:1.4.2")
        }
    }
}

flutter {
    source = "../.."
}

//dependencies {
//    // Desugaring for Java 8+ features
//    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
//
//    // Firebase & Google Play Services
//    implementation(platform("com.google.firebase:firebase-bom:31.5.0"))
//    implementation("com.google.firebase:firebase-analytics")
//    implementation("com.google.android.gms:play-services-location:20.0.0")
//    implementation("com.google.android.gms:play-services-auth:20.7.0")
//
//    // AndroidX & Kotlin
//    implementation("androidx.appcompat:appcompat:1.4.2")
//    implementation("androidx.appcompat:appcompat-resources:1.4.2")
//    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7")
//}

dependencies {
    // Desugaring for Java 8+ features
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")

    // Firebase & Google Play Services
    implementation(platform("com.google.firebase:firebase-bom:31.5.0"))
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.android.gms:play-services-location:20.0.0")
    implementation("com.google.android.gms:play-services-auth:20.7.0")

    // Add this line for smart_auth plugin
    implementation("com.google.android.gms:play-services-auth-api-phone:18.0.1")

    // AndroidX & Kotlin
    implementation("androidx.appcompat:appcompat:1.4.2")
    implementation("androidx.appcompat:appcompat-resources:1.4.2")
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7")
}

apply(plugin = "com.google.gms.google-services")

//plugins {
//    id("com.android.application")
//    id("kotlin-android")
//    id("com.google.gms.google-services")
//    id("dev.flutter.flutter-gradle-plugin")
//}
//
//android {
//    namespace = "com.viion.tcsalumniapp"
//
//    compileSdk = 36
//
//    defaultConfig {
//        applicationId = "com.viion.tcsalumniapp"
//        minSdk = 24
//        targetSdk = 36
//        versionCode = 1
//        versionName = "1.0"
//        multiDexEnabled = true
//    }
//
//    compileOptions {
//        // Correct syntax for Kotlin DSL
//        isCoreLibraryDesugaringEnabled = true
//        sourceCompatibility = JavaVersion.VERSION_1_8
//        targetCompatibility = JavaVersion.VERSION_1_8
//    }
//
//    kotlinOptions {
//        jvmTarget = "1.8"
//    }
//
//    signingConfigs {
//        create("release") {
//            storeFile = file("D:/jks/tcs/upload-keystore.jks")
//            storePassword = "viper@1000"
//            keyAlias = "upload"
//            keyPassword = "viper@1000"
//        }
//    }
//
//
////    buildTypes {
////        getByName("release") {
////            signingConfig = signingConfigs.getByName("release")
////        }
////    }
//    buildTypes {
//        getByName("release") {
//            signingConfig = signingConfigs.getByName("release")
//            isMinifyEnabled = true
//            proguardFiles(
//                getDefaultProguardFile("proguard-android-optimize.txt"),
//                "proguard-rules.pro"
//            )
//        }
//    }
//
//    configurations.all {
//        resolutionStrategy {
//            force("com.google.android.gms:play-services-measurement:21.5.0")
//            force("com.google.android.gms:play-services-measurement-api:21.5.0")
//            force("com.google.android.gms:play-services-measurement-impl:21.5.0")
//            force("com.google.android.gms:play-services-measurement-base:21.5.0")
//            force("com.google.android.gms:play-services-measurement-sdk:21.5.0")
//            force("com.google.android.gms:play-services-measurement-sdk-api:21.5.0")
//
//
//            force("androidx.appcompat:appcompat:1.4.2")
//            force("androidx.appcompat:appcompat-resources:1.4.2")
//        }
//    }
//}
//
//flutter {
//    source = "../.."
//}
//
////dependencies {
////    // Update this line - change from 1.2.2 to 2.1.4
////    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
////
////    implementation(platform("com.google.firebase:firebase-bom:31.5.0"))
////    implementation("com.google.firebase:firebase-analytics")
////    implementation("com.google.android.gms:play-services-location:20.0.0")
////    implementation("com.google.android.gms:play-services-auth:20.7.0")
////    implementation("androidx.appcompat:appcompat:1.4.2")
////    implementation("androidx.appcompat:appcompat-resources:1.4.2")
////    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7")
////    implementation("com.google.android.gms:play-services-credentials:18.0.1")
////
////}
//
//dependencies {
//    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
//
//    implementation(platform("com.google.firebase:firebase-bom:31.5.0"))
//    implementation("com.google.firebase:firebase-analytics")
//    implementation("com.google.android.gms:play-services-location:20.0.0")
//    implementation("com.google.android.gms:play-services-auth:20.7.0")
//
//    implementation("androidx.appcompat:appcompat:1.4.2")
//    implementation("androidx.appcompat:appcompat-resources:1.4.2")
//    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7")
//}
//
//apply(plugin = "com.google.gms.google-services")