import 'package:crypto_app/app/constants/asset_constants.dart';

class OnboardingModel {
  const OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  static const List<OnboardingModel> items = [
    OnboardingModel(
      imagePath: AssestConstants.onboarding1,
      title: 'View Top Cryptocurrencies',
      description: 'Stay updated with the latest prices of top cryptocurrencies',
    ),
    OnboardingModel(
      imagePath: AssestConstants.onboarding2,
      title: 'Save Your Favorites',
      description: 'Bookmark and track your favorite cryptocurrencies',
    ),
    OnboardingModel(
      imagePath: AssestConstants.onboarding3,
      title: 'Discover New Ones',
      description: 'Discover thousands of cryptocurrencies with search functionality',
    ),
  ];
}
