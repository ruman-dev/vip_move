class Const {
  static const String BASE_URL = 'https://vip-movers-backend.vercel.app/api/v1';
  static const String SIGN_UP_URL = '$BASE_URL/users/pending';
  static const String SIGN_IN_URL = '$BASE_URL/auth/login';
  static const String VERIFY_USER_URL = '$BASE_URL/users/create';
  static const String VERIFY_OTP_URL = '$BASE_URL/auth/verify-otp';
  static const String FORGOT_PASS_URL = '$BASE_URL/auth/send-otp';
  static const String UPDATE_PASS_URL = '$BASE_URL/auth/reset-password';
  static const String ALL_SERVICES_URL = '$BASE_URL/service/allServices';
  static const String POPULAR_SERVICES_URL = '$BASE_URL/service/popular';
  static const String DONATION_URL = '$BASE_URL/service/donation';
  static const String SERVICE_DETAILS_URL = '$BASE_URL/service/single/';
  static const String CREATE_BOOKING_URL = '$BASE_URL/service/create';
  static const String LOCAL_AREAS_URL = '$BASE_URL/booking/areas';
  static const String VEHICLE_URL = '$BASE_URL/service/vehicles';
  static const String BOOKING_URL = '$BASE_URL/booking/bookings';
  static const String USER_DATA_URL = '$BASE_URL/users/single';
  static const String UPDATE_USER_URL = '$BASE_URL/users/update';
  static const String SEARCH_URL = '$BASE_URL/service/searches';
  static const String DEL_ALL_SEARCH_URL = '$BASE_URL/service/search/deleteAll';

  static const String GOOGLE_API_KEY = 'AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ';



  /////////////// SEARCH /////////////////
  static String searchServiceApiEndpoint({required String searchText}) => '$BASE_URL/service/allServices?search=$searchText';
  static String searchApiEndpoint = '$BASE_URL/service/searches';
  /////////////// SEARCH /////////////////



}
