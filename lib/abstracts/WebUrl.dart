
class Urls {
  /*--------BASES-------------------*/
  static const String DOMAIN = 'https://yalla-jeye.azurewebsites.net/api/v1/';

  static const String BASE_HOME_PAGE = DOMAIN + 'HomePage/';
  static const String BASE_NOTIFICATION = DOMAIN + 'Notifications/';
  static const String BASE_ORDER= DOMAIN + 'Orders/';
  static const String BASE_ADDRESSES= DOMAIN + 'Addresses/';
  static const String AUTH= DOMAIN + 'Accounts/';

  static const GET_HOME_PAGE = BASE_HOME_PAGE + 'GetHomePage';
  static const GET_ORDERS = BASE_HOME_PAGE + 'PlaceOrder';

  /*-----------------------ADDRESSES--------------------------------------*/
  static const GET_ADDRESSES = BASE_ADDRESSES + 'GetAllAddresses';
  static const CREATE_ADDRESSES = BASE_ADDRESSES + 'CreateAddress';
  static const DELETE_ADDRESSES = BASE_ADDRESSES + 'DeleteAddress/';
  static const EDIT_ADDRESSES = BASE_ADDRESSES + 'UpdateAddress';

  /*-----------------------ORDERS--------------------------------------*/
  static const CUSTOM_ORDER = BASE_ORDER + 'CustomPlaceOrder';
  static const GET_ORDER = BASE_ORDER + 'GetOrders';
  static const GET_ORDERS_DETAILS = BASE_ORDER + 'GetOrder/';
  static const PLACE_ORDER = BASE_ORDER + 'PlaceOrder/';



  /*-----------------------AUTH----------------------------------*/
  static const LOG_IN = AUTH + 'Login';
  static const SIGN_UP = AUTH + 'SignUp';
  static const GENERATE_OTP = AUTH + 'GenerateOtp';
  static const CONFIRM_OTP = AUTH + 'ConfirmOtp';
  static const UPDATE_PROFILE = AUTH + 'UpdateProfile';
  static const GET_PROFILE = AUTH + 'GetProfile';
  static const CONFIRM_PHONE_NUMBER = AUTH + 'ConfirmPhoneNumber';


  /*-----------------------NOTIFICATION----------------------------------*/
  static const NOTIFICATION = BASE_NOTIFICATION + 'GetAllNotifications';





}
