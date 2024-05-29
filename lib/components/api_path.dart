const baseUrl = "https://node-server-api-q7vr.onrender.com/api/v1";
class APIPath {
  // -------- auth ----------
  static String login = "${baseUrl}/user/login";
  static String register = "${baseUrl}/user/register";
  static String refreshToken = "${baseUrl}/user/refreshToken";
  //---------- banner ------------
  static String getAllBanner = "${baseUrl}/banner/getAll";
  //---------- category --------
  static String getAllCategory = "${baseUrl}/category/getAll";
  // --------- product ------
  static String getProductAll = "${baseUrl}/product/getAll";
   static String getProductByCategory = "${baseUrl}/product/getByCategory/";
}