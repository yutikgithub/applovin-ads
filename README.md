# applovin_ads_demo Flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [ ]  Stap 1 :    flutter_applovin_max: ^2.1.1  not working
- [x] Stap 2:    applovin_max: ^2.3.0   working 

		

- [x] Stap 2  =>  AndroidManifest.xml : 

	{meta-data android:name="applovin.sdk.key"
            android:value=“YOUR_SDK_KEY"  }


- [x] Stap 3 => build.gradle/app level

*  apply plugin: 'applovin-quality-service'


*        applovin {
            		apiKey "YOUR_AD_REVIEW_KEY_HERE "  
    	     }


* dependencies {

  		implementation 'com.applovin:applovin-sdk:11.3.3'
		
 	        implementation 'com.google.android.gms:play-services-location:19.0.1',

		implementation 'com.google.android.gms:play-services-ads-identifier:18.0.1’    new
	}



- [x] Stap 4  =>   build.gradle/project level

* 		buildscript {
  			
   			 repositories {
      				google()
        			mavenCentral()
                - [ ]     	maven { url 'https://artifacts.applovin.com/android' }
   		 }

    			dependencies {
      
       			 classpath "com.applovin.quality:AppLovinQualityServiceGradlePlugin:+"
   		 }
}	

youtube video link : https://youtu.be/MDp6YUavn58

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
