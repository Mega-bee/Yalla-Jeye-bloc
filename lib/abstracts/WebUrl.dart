
class Urls {
  /*--------BASES-------------------*/
  static const String DOMAIN = 'https://yallajeyiapi.azurewebsites.net/api/';

  static const String BASE_API_BUSINESS = DOMAIN + 'Businesses/';
  static const String BASE_API_FILTER = DOMAIN + 'Interests/';
  static const String BASE_API_POSTS = DOMAIN + 'Posts/';
  static const String BSE_API_SETTINGS = DOMAIN + 'Accounts/';
  static const String BSE_API_LOCATION = DOMAIN + 'General/';
  static const String BASE_HOME_PAGE = DOMAIN + 'HomePage/';
  static const String BASE_NOTIFICATION = DOMAIN + 'Notifications/';
  static const String  HUBS ='https://brandsome.azurewebsites.net/hubs/signalrHub';

//  /*--------Auth-------------------*/
   static const REQUEST_OTP = BSE_API_SETTINGS + 'RequestOtp';
   static const VERIFY_OTP = BSE_API_SETTINGS + 'VerifyOtp';

  /*--------homepage-------------------*/
  static const GET_HOME_PAGE = BASE_HOME_PAGE + 'GetHomePage';

  /*--------business-------------------*/
  static const GET_BUSINESS = BASE_API_BUSINESS + 'GetBusinesses';
  static const DELETE_BUSINESS = BASE_API_BUSINESS + 'DeleteBusiness/';
  static const DELETE_POST = BASE_API_POSTS + 'DeletePost/';
  static const UPDATE_BUSINESS = BASE_API_BUSINESS + 'UpdateBusiness';
  static const CREATE_BUSINESS = BASE_API_BUSINESS + 'CreateBusiness';
  static const GET_BUSINESS_DETAILS = BASE_API_BUSINESS + 'GetBusiness/';
  static const PHONE_CLICK = BASE_API_BUSINESS + 'RegisterNewPhoneClick/';
  static const CREATE_REVIEW = BASE_API_BUSINESS + 'CreateReview';
  static const BUSINESS_VIEW = BASE_API_BUSINESS + 'RegisterBusinessView/';
  static const GET_FILTER = BASE_API_FILTER + 'GetSearchCategories';
  static const FOLLOW_UNFOLLOW = BASE_API_BUSINESS + 'FollowBusiness/';
  static const NOTIFICATION_FBT = BSE_API_SETTINGS + 'RefreshFcmToken';
  static const NOTIFICATION = BASE_NOTIFICATION + 'GetAllNotifications';

  static const GET_USER_BUSINESS = BASE_API_BUSINESS + 'GetUserBusinesses';

  /*--------postHOMEPAGE-------------------*/
  static const LIKE_HOME = BASE_API_POSTS + 'LikePost/';
  static const GET_LIKED_POSTS = BASE_API_POSTS + 'LikeList/';
  static const CREATE_POSTS = BASE_API_POSTS + 'CreatePost';
  //
  /*--------Settings-------------------*/
  static const ACCOUNTS_SETTINGS =BSE_API_SETTINGS + 'GetAccountSetings';
  static const GETPROFILE =BSE_API_SETTINGS + 'GetProfile';
  static const UPDATE_PROFILE =BSE_API_SETTINGS + 'UpdateProfile';
  static const GETFOLLOWEDBUSINESSES =BSE_API_SETTINGS + 'GetFollowedBusinessses';
  static const GETLOCATION =BSE_API_LOCATION + 'GetCities';
  static const DELETE_ACC =BSE_API_SETTINGS + 'DeleteAccount';
  static const PHONE_CHANGE =BSE_API_SETTINGS + 'ResendOtp';

}
