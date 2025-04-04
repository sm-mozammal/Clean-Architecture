import 'dart:io';

import 'package:clean_architecture_riverpod/config/injection.dart';
import 'package:clean_architecture_riverpod/config/theme/custome_theme.dart';
import 'package:clean_architecture_riverpod/core/constants/app_colors.dart';
import 'package:clean_architecture_riverpod/core/services/navigation_service.dart';
import 'package:clean_architecture_riverpod/core/services/networks/dio/dio.dart';
import 'package:clean_architecture_riverpod/core/utils/helper_methods.dart';
import 'package:clean_architecture_riverpod/core/utils/responsive_utils.dart';
import 'package:clean_architecture_riverpod/features/home/presentation/provider/todo_provider.dart';
import 'package:clean_architecture_riverpod/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  diSetup();
  // Get.put(InternetController(), permanent: true);
  DioSingleton.instance.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, result) async {
        showMaterialDialog(context,
            title: 'Do you want to exit the app?',
            btnName1: 'No',
            btnName2: 'Yes', onTapbutton1: () {
          Navigator.of(context).pop(false);
        }, onTapbutton2: () {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        });
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          SizeConfig.init(context); // Initialize SizeConfig
          return const AdaptiveScreen();
        },
      ),
    );
  }
}

class AdaptiveScreen extends StatelessWidget {
  const AdaptiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Mobile Layout
        return const MobileLayout();
      },
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add your providers here
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: CustomTheme.kToDark,
          useMaterial3: false,
          scaffoldBackgroundColor: AppColors.scaffoldColor,
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return MediaQuery(data: MediaQuery.of(context), child: widget!);
        },
        // onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: NavigationService.navigatorKey,
        home: HomeScreen(),
      ),
    );
  }
}
