// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print

import 'dart:async';
import 'dart:io';
import 'package:clean_architecture_riverpod/common/widgets/custom_button.dart';
import 'package:clean_architecture_riverpod/config/injection.dart';
import 'package:clean_architecture_riverpod/core/utils/toast.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/text_font_style.dart';

//declared for cart scrren calling bottom shit with this from reorder rx
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<PopupMenuButtonState<String>> popUpGlobalkey =
    GlobalKey<PopupMenuButtonState<String>>();

Future<void> setInitValue() async {
  await appData.writeIfNull(kKeyIsLoggedIn, false);
  await appData.writeIfNull(kKeyIsExploring, false);
  await appData.writeIfNull(kKeyIsFirstTime, true);

  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    appData.writeIfNull(
        kKeyDeviceID, iosDeviceInfo.identifierForVendor); // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo =
        await deviceInfo.androidInfo; // unique ID on Android
    appData.writeIfNull(kKeyDeviceID, androidDeviceInfo.id);
  }
  await Future.delayed(const Duration(seconds: 2));
}

Future<void> initiInternetChecker() async {
  InternetConnectionChecker.createInstance(
          // checkTimeout: const Duration(seconds: 1),
          checkInterval: const Duration(seconds: 2))
      .onStatusChange
      .listen((status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        ToastUtil.showShortToast('Data connection is available.');
        break;
      case InternetConnectionStatus.disconnected:
        ToastUtil.showNoInternetToast();
        break;
      case InternetConnectionStatus.slow:
    }
  });
}

void showMaterialDialog(BuildContext context,
    {required String title,
    required VoidCallback onTapbutton1,
    required VoidCallback onTapbutton2,
    required String btnName1,
    required String btnName2}) {
  showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle16RobotoW400
                  .copyWith(color: AppColors.c000000),
            ),
            actions: [
              customButton(
                  name: btnName1,
                  onCallBack: onTapbutton1,
                  // onCallBack: () {
                  //   Navigator.of(context).pop(false);
                  // },
                  height: 30,
                  minWidth: .5,
                  borderRadius: 30,
                  color: AppColors.cFFFFFF,
                  textStyle: TextFontStyle.textStyle16RobotoW400,
                  context: context),
              Spacer(),
              customButton(
                  name: btnName2,
                  onCallBack: onTapbutton2,
                  // onCallBack: () {
                  //   if (Platform.isAndroid) {
                  //     SystemNavigator.pop();
                  //   } else if (Platform.isIOS) {
                  //     exit(0);
                  //   }
                  // },
                  height: 30,
                  minWidth: .5,
                  borderRadius: 30,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.textStyle16RobotoW400
                      .copyWith(color: AppColors.cFFFFFF),
                  context: context),
            ],
          ));
}

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void getPopUp(
  BuildContext context,
  Widget Function(BuildContext) childBuilder,
) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent, child: childBuilder(context));
      });
}
