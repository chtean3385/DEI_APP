class ApiUrls {
  static const baseUrl = 'http://thinkdream.in/nutrition-food/api/';

  //auth
  static const verifyOtp = 'verify-otp';
  static const resendOtp = 'resend-otp';
  static const signIn = 'signin';

  //kitchen
  static const kitchenStatus = 'chef/status';
  static const chefData = 'loggeduser';

  //menu
  static const category = 'chef/category';
  static const addDish = 'add-food-items';
  static const updateDish = 'edit-food-items';
  static const deleteDish = 'delete-food-items';
  static const listDishes = 'list-food-items';
  static String updateDishStock(int id) => 'chef/dishes/$id/stock';
  static String updateDishIsRecommended(int id) => 'chef/dishes/$id/recommended';

  //oder
  static const orderList = 'chef/orders';
  static String orderDetails(int id) => 'order-detail/$id';

}
