class ApiConstants {
  const ApiConstants._();

  static const baseUrl = 'https://api.coingecko.com/api/v3/';
  static String getAll({required int perPage, required int page}) =>
      'coins/markets?vs_currency=usd&order=market_cap_desc&per_page=$perPage&page=$page&sparkline=false&price_change_percentage=1h%2C24h%2C7d&locale=en';
  static const String search = 'search';
}
