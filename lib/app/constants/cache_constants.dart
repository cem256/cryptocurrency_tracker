/// This is where we define constants related to the cache
///
/// Each object in the cache is identified by a unique type id
///
/// Each box in the cache is identified by a unique name
abstract final class CacheConstants {
  static const int favoritesTypeID = 0;
  static const String favoritesBox = 'Favorites';

  static const String onboardingBox = 'Onboarding';
  static const String onboardingKey = 'isCompleted';
}
