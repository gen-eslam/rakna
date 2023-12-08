abstract class EndPoints {
  static const String baseUrl = 'https://api.billsolution.co';
  static const String ads = '/users/ads';
  static const String aboutUs = '/users/about_us';
  static const String contactUs = '/users/contact_us'; //post name message phone email
  static const String settingsFooter = '/users/settings';
  static const String blogs = '/users/blogs';
  static String oneBlog(int id) => '/users/blog/$id';
  static const String workingHours = '/users/working_hours';
  static const String categories = '/users/categories';
  static String oneCategory(int id) => '/users/category/$id';
  static const String ourTeam = '/users/our_team';
}
