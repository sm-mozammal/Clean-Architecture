import 'package:clean_architecture_riverpod/core/constants/app_constants.dart';
import 'package:clean_architecture_riverpod/core/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'config/injection.dart';
import 'welcome_screen.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await Future.delayed(Durations.extralong2);
    await setInitValue();
    if (appData.read(kKeyIsLoggedIn)) {}
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return Container();
      //  return appData.read(kKeyIsLoggedIn) ? Container() : Container();
    }
  }
}
