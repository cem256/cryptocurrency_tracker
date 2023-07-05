import 'package:cryptocurrency_tracker/app/constants/asset_constants.dart';
import 'package:cryptocurrency_tracker/app/l10n/app_l10n.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingModel {
  const OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  static List<OnboardingModel> items = [
    OnboardingModel(
      imagePath: AssestConstants.onboarding1,
      title: LocaleKeys.onboarding_infoTitle1.tr(),
      description: LocaleKeys.onboarding_infoDescription1.tr(),
    ),
    OnboardingModel(
      imagePath: AssestConstants.onboarding2,
      title: LocaleKeys.onboarding_infoTitle2.tr(),
      description: LocaleKeys.onboarding_infoDescription2.tr(),
    ),
    OnboardingModel(
      imagePath: AssestConstants.onboarding3,
      title: LocaleKeys.onboarding_infoTitle3.tr(),
      description: LocaleKeys.onboarding_infoDescription3.tr(),
    ),
  ];
}
