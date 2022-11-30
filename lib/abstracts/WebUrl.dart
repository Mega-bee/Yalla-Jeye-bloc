
class Urls {
  /*--------BASES-------------------*/
    // static const String DOMAIN = 'https://yalla-jeye.azurewebsites.net/api/v1/';
    static const String DOMAIN = 'http://peterjeye-001-site1.etempurl.com/api/v1/';

  static const String BASE_HOME_PAGE = DOMAIN + 'HomePage/';
  static const String BASE_NOTIFICATION = DOMAIN + 'Notifications/';
  static const String BASE_ORDER= DOMAIN + 'Orders/';
  static const String BASE_ADDRESSES= DOMAIN + 'Addresses/';
  static const String AUTH= DOMAIN + 'Accounts/';
  static const String PROMO_CODE= '${DOMAIN}PromoCodes/';

  static const String GET_HOME_PAGE = BASE_HOME_PAGE + 'GetHomePage';
  static const String GET_ORDERS = BASE_HOME_PAGE + 'PlaceOrder';

  /*-----------------------ADDRESSES--------------------------------------*/
  static const String GET_ADDRESSES = '${BASE_ADDRESSES}GetAllAddresses';
  static const String CREATE_ADDRESSES = '${BASE_ADDRESSES}CreateAddress';
  static const String DELETE_ADDRESSES = '${BASE_ADDRESSES}DeleteAddress/';
  static const String EDIT_ADDRESSES = '${BASE_ADDRESSES}UpdateAddress';
  static const String GET_REGIONS = '${BASE_ADDRESSES}GetAllRegions';

  /*-----------------------ORDERS--------------------------------------*/
  static const String CUSTOM_ORDER = BASE_ORDER + 'CustomPlaceOrder';
  static const String GET_ORDER = BASE_ORDER + 'GetOrders';
  static const String GET_ORDERS_DETAILS = BASE_ORDER + 'GetOrder/';

  static const String PLACE_ORDER = '${BASE_ORDER}PlaceOrder';

  static const String CALCULATE_PRICE = '${BASE_ORDER}CalculatePlaceOrderPricing';
  static const String CALCULATE_CUTOM_PRICE = '${BASE_ORDER}CalculateCustomOrderPricing';

  static const String REJECT_PRICE = '${BASE_ORDER}RejectPrice';
  static const String CONFIRM_PRICE = '${BASE_ORDER}ConfirmPrice';


  ///PROMOO
  static const String checkPromoCode = '${PROMO_CODE}CheckPromoCode';



  /*-----------------------AUTH----------------------------------*/
  static const String LOG_IN = AUTH + 'Login';
  static const String SIGN_UP = AUTH + 'SignUp';
  static const String GENERATE_OTP = AUTH + 'GenerateOtp';
  static const String CONFIRM_OTP = AUTH + 'ConfirmOtp';
  static const String UPDATE_PROFILE = AUTH + 'UpdateProfile';
  static const  String GET_PROFILE = AUTH + 'GetProfile';
  static const String CONFIRM_PHONE_NUMBER = AUTH + 'ConfirmPhoneNumber';


  /*-----------------------NOTIFICATION----------------------------------*/
  static const String NOTIFICATION = '${BASE_NOTIFICATION}GetAllNotifications';





}
