import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:skrew/common/routes/app_routes.dart';
import 'package:skrew/common/widgets/custom_button.dart';
import 'package:skrew/common/widgets/skrew_logo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SkrewLogo(),
              const Gap(20),
              CustomButton(
                onTap: () => _navigateToNormalModeView(context),
                data: 'سكرو عاديه',
              ),
              const Gap(20),
              CustomButton(
                onTap: () => _navigateToCompetitionModeView(context),
                data: 'مسابقه سكرو',
              ),
            ],
          ),
        ),
      ),
    );
  }

  _navigateToNormalModeView(BuildContext context) {
    context.push(AppRoutes.normalMode);
  }

  _navigateToCompetitionModeView(BuildContext context) {
    context.push(AppRoutes.competitionMode);
  }
}
