// Top-level build file where you can add configuration options common to all sub-projects/modules.

buildscript {
    repositories {
        google()        // Required for Google plugins
        mavenCentral()  // For general dependencies
    }
    dependencies {
        // Android Gradle Plugin (AGP) version
        classpath("com.android.tools.build:gradle:8.11.1")
        // Google Services Plugin for Firebase, Analytics, etc.
        classpath("com.google.gms:google-services:4.4.3")
        // NOTE: Do not place your application dependencies here; they belong
        // in the module-level build.gradle.kts (e.g., app/build.gradle.kts)
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
        // jcenter() is deprecated, avoid using
    }
}

// ----------------------------
// Custom build directories
// ----------------------------
val newBuildDir: Directory = rootProject.layout.buildDirectory
    .dir("../../build") // moves build output two levels up
    .get()
rootProject.layout.buildDirectory.value(newBuildDir)

// Apply same custom build dir for subprojects
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Ensure that subprojects are evaluated after the app module
subprojects {
    project.evaluationDependsOn(":app")
}

// ----------------------------
// Clean task
// ----------------------------
tasks.register<Delete>("clean") {
    group = "build"
    description = "Cleans the build directories"
    delete(rootProject.layout.buildDirectory)
}

// ----------------------------
// Notes / Recommendations
// ----------------------------
// 1. This is top-level build.gradle.kts, module-specific configurations (like namespace, minSdk, compileSdk)
//    should be added in the module's build.gradle.kts (e.g., app/build.gradle.kts or plugin module build.gradle).
// 2. For AGP 8.x, any library module (like flutter_inappwebview) MUST have a namespace set in its build.gradle.
// 3. Keep plugin versions updated in dependencies section for latest compatibility.

//// Top-level build file where you can add configuration options common to all sub-projects/modules.
//buildscript {
//    repositories {
//        google()        // Required for Google plugins
//        mavenCentral()
//    }
//    dependencies {
//        classpath("com.android.tools.build:gradle:8.1.1")  // Your Gradle version
//        classpath("com.google.gms:google-services:4.4.3")  // Google Services plugin
//    }
//}
//
//allprojects {
//    repositories {
//        google()
//        mavenCentral()
//    }
//}
//
//// Custom build directories
//val newBuildDir: Directory =
//    rootProject.layout.buildDirectory
//        .dir("../../build")
//        .get()
//rootProject.layout.buildDirectory.value(newBuildDir)
//
//subprojects {
//    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
//    project.layout.buildDirectory.value(newSubprojectBuildDir)
//}
//
//subprojects {
//    project.evaluationDependsOn(":app")
//}
//
//// Clean task
//tasks.register<Delete>("clean") {
//    delete(rootProject.layout.buildDirectory)
//}
