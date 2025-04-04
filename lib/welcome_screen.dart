import 'package:clean_architecture_riverpod/core/constants/app_colors.dart';
import 'package:clean_architecture_riverpod/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.allPrimaryColor),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.height(20),
                width: SizeConfig.width(20),
                // child: Image.asset(
                //   Assets.images.splashLogo.path,
                // ),
              )
            ]),
      ),
    );
  }
}
