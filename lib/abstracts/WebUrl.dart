
class Urls {
  /*--------BASES-------------------*/
  static const String DOMAIN = 'https://yallajeyiapi.azurewebsites.net/api/';

  static const String BASE_HOME_PAGE = DOMAIN + 'HomePage/';
  static const String BASE_NOTIFICATION = DOMAIN + 'Notifications/';
  static const String BASE_ORDER= DOMAIN + 'Orders/';
  static const String BASE_ADDRESSES= DOMAIN + 'Addresses/';

  static const GET_HOME_PAGE = BASE_HOME_PAGE + 'GetHomePage';
  static const GET_ORDERS = BASE_HOME_PAGE + 'PlaceOrder';

  /*-----------------------ADDRESSES--------------------------------------*/
  static const GET_ADDRESSES = BASE_ADDRESSES + 'GetAllAddresses';
  static const CREATE_ADDRESSES = BASE_ADDRESSES + 'CreateAddress';
  static const DELETE_ADDRESSES = BASE_ADDRESSES + 'DeleteAddress/';
  static const EDIT_ADDRESSES = BASE_ADDRESSES + 'UpdateAddress';


  /*-----------------------NOTIFICATION----------------------------------*/
  static const NOTIFICATION = BASE_NOTIFICATION + 'GetAllNotifications';





}
