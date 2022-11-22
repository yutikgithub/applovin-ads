import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'dart:math' as m;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  var _interstitialRetryAttempt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                initializeInterstitialAds();
              },
              child: Text('int load'),
            ),
            ElevatedButton(
              onPressed: () async {
                bool isReady = (await AppLovinMAX.isInterstitialReady(
                    "748119b36ab68e98"))!;
                if (isReady) {
                  AppLovinMAX.showInterstitial("748119b36ab68e98");
                }
              },
              child: Text('int show'),
            ),
            MaxAdView(
                adUnitId: "bb4169ba633e2229",
                adFormat: AdFormat.mrec,
                listener: AdViewAdListener(
                    onAdLoadedCallback: (ad) {},
                    onAdLoadFailedCallback: (adUnitId, error) {},
                    onAdClickedCallback: (ad) {},
                    onAdExpandedCallback: (ad) {},
                    onAdCollapsedCallback: (ad) {}))
          ],
        ),
      ),
      bottomNavigationBar: MaxAdView(
          adUnitId: "1854404de1b527db",
          adFormat: AdFormat.banner,
          listener: AdViewAdListener(
              onAdLoadedCallback: (ad) {},
              onAdLoadFailedCallback: (adUnitId, error) {},
              onAdClickedCallback: (ad) {},
              onAdExpandedCallback: (ad) {},
              onAdCollapsedCallback: (ad) {})),
    );
  }

  void initializeInterstitialAds() {
    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        // Interstitial ad is ready to be shown. AppLovinMAX.isInterstitialReady(_interstitial_ad_unit_id) will now return 'true'
        print('Interstitial ad loaded from ' + ad.networkName);

        // Reset retry attempt
        _interstitialRetryAttempt = 0;
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        // Interstitial ad failed to load
        // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
        _interstitialRetryAttempt = _interstitialRetryAttempt + 1;

        int retryDelay = m.pow(2, m.min(6, _interstitialRetryAttempt)).toInt();

        print('Interstitial ad failed to load with code ' +
            error.code.toString() +
            ' - retrying in ' +
            retryDelay.toString() +
            's');

        Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
          AppLovinMAX.loadInterstitial("748119b36ab68e98");
        });
      },
      onAdDisplayedCallback: (ad) {},
      onAdDisplayFailedCallback: (ad, error) {},
      onAdClickedCallback: (ad) {},
      onAdHiddenCallback: (ad) {},
    ));

    // Load the first interstitial
    AppLovinMAX.loadInterstitial("748119b36ab68e98");
  }
}
