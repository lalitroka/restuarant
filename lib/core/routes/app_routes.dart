import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:foodmenu/view/admin_view/admin_homepage.dart';
import 'package:foodmenu/view/admin_view/adminauth/admin_register.dart';
import 'package:foodmenu/view/admin_view/adminauth/home_login.dart';
import 'package:foodmenu/view/admin_view/adminauth/password/forgot_password.dart';
import 'package:foodmenu/view/admin_view/adminauth/password/new_password.dart';
import 'package:foodmenu/view/admin_view/adminauth/password/verification_.dart';
import 'package:foodmenu/view/admin_view/adminauth/register_success.dart';
import 'package:foodmenu/view/admin_view/dashboard/food%20analysis/category_analysis.dart';
import 'package:foodmenu/view/admin_view/dashboard/food%20analysis/food_graph.dart';
import 'package:foodmenu/view/admin_view/dashboard/food%20analysis/food_revenue.dart';
import 'package:foodmenu/view/admin_view/dashboard/foodadd/category_add.dart';
import 'package:foodmenu/view/admin_view/dashboard/foodadd/food_add_page.dart';
import 'package:foodmenu/view/admin_view/dashboard/foodadd/fooditems.dart';
import 'package:foodmenu/view/admin_view/dashboard/foodview/food_description_view.dart';
import 'package:foodmenu/view/admin_view/foodreceive/food_complete_detail.dart';
import 'package:foodmenu/view/admin_view/foodreceive/food_new_detail_view.dart';
import 'package:foodmenu/view/admin_view/foodreceive/food_process_detail.dart';
import 'package:foodmenu/view/admin_view/profile/admin_about.dart';
import 'package:foodmenu/view/admin_view/profile/admin_order_payment.dart';
import 'package:foodmenu/view/admin_view/profile/admin_setting.dart';
import 'package:foodmenu/view/admin_view/profile/order_payment_detail.dart';
import 'package:foodmenu/view/default_page.dart';
import 'package:foodmenu/view/userview/cart/qr_payment.dart';
import 'package:foodmenu/view/userview/cart/user_payment.dart';
import 'package:foodmenu/view/userview/homepage/user_food_cart.dart';
import 'package:foodmenu/view/userview/homepage/user_food_page.dart';
import 'package:foodmenu/view/userview/homepage/order_payment_history.dart';
import 'package:foodmenu/view/userview/profile/user_account_delete.dart';
import 'package:foodmenu/view/userview/profile/user_help_support.dart';
import 'package:foodmenu/view/userview/profile/user_invite_friend.dart';
import 'package:foodmenu/view/userview/profile/user_personal_detail.dart';
import 'package:foodmenu/view/userview/profile/user_profile_page.dart';
import 'package:foodmenu/view/userview/user_homepage.dart';

class AppRoutes {
  // user
  static const String defaultPage = '/defaultpage';
  static const String userHomePage = '/userhomepage';
  static const String userFoodCartedPage = '/userfoodcartedpage';
  static const String userPaymentPage = '/userpaymentpage';
  static const String qrPaymentPage = '/qrpaymentpage';
  static const String userProfilePage = '/userprofilepage';
  static const String userPersonalDetailPage = '/userpersonaldetailpage';
  static const String userOrderPaymentHistoryPage ='/userorderpaymenthistorypage';
  static const String userInviteFriendPage = '/userinvitefriendpage';
  static const String userHelpSupportPage = '/userhelpsupportpage';
  static const String userAccountDeletePage = '/useraccountdelete';
  static const String foodDescriptionView = '/fooddescriptionview';

  //  admin
  static const String adminRegisterPage = '/adminregisterpage';
  static const String adminLoginPage = '/adminloginpage';
  static const String adminLoginHomePage = '/adminloginhomepage';
  static const String adminregisterSuccessPage = '/adminregistersuccesspage';
  static const String adminforgotPasswordPage = '/adminforgotpassword';
  static const String adminpasswordVerificationPage ='/adminpasswordverification';
  static const String adminnewPasswordPage = '/adminnewpassword';
  static const String adminHomePage = '/adminhomepage';
  static const String adminCategoryAddPage = '/admincategoryaddpage';
  static const String adminFoodItemPage = '/adminfooditempage';
  static const String adminFoodItemAddPage = '/adminfooditemAddpage';
  static const String adminFoodViewPage = '/adminfoodviewpage';
  static const String adminCategoryAnalysisPage = '/admincategoryanalysis';
  static const String adminNewOrderViewPage = '/adminneworderpage';
  static const String adminOrderProcessingPage = '/adminorderprocessing';
  static const String adminOrderCompletePage = '/adminordercomplete';
  static const String adminFoodRevenuePage = '/adminfoodrevenue';
  static const String adminSingleFoodGraphPage = '/adminsinglefoodpraghpage';
  static const String adminAboutUsPage = '/adminaboutus';
  static const String adminOrderPaymentHistoryPage = '/adminorderpayment';
  static const String adminOrderPaymentHistoryDetailPage ='/adminorderpaymentdetail';
  static const String adminSettingPage = '/adminsetting';
  
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.defaultPage:
      return customPageRoute(DefaultPage());

    // user
    case AppRoutes.userHomePage:
      return customPageRoute(UserHomePage());
    case AppRoutes.userFoodCartedPage:
      return customPageRoute(UserFoodCartedPage());
    case AppRoutes.userPaymentPage:
      return customPageRoute(UserPaymentPage());
    case AppRoutes.qrPaymentPage:
      return customPageRoute(QrPayment());
    case AppRoutes.userProfilePage:
      return customPageRoute(UserProfilePage());
    case AppRoutes.userPersonalDetailPage:
      return customPageRoute(UserPersonalDetailPage());
    case AppRoutes.userOrderPaymentHistoryPage:
      return customPageRoute(UserOrderPaymentHistoryPage());
    case AppRoutes.userInviteFriendPage:
      return customPageRoute(UserInviteFriendPage());
    case AppRoutes.userHelpSupportPage:
      return customPageRoute(UserHelpSupportPage());
    case AppRoutes.userAccountDeletePage:
      return customPageRoute(UserAccountDeletePage());



    // admin
    case AppRoutes.foodDescriptionView:
      return customPageRoute(FoodDescriptionView());
    case AppRoutes.adminRegisterPage:
      return customPageRoute(AdminRegisterPage());

    case AppRoutes.adminLoginHomePage:
      return customPageRoute(AdminLoginHomePage());

    case AppRoutes.adminHomePage:
      return customPageRoute(AdminHomepage());
    case AppRoutes.adminforgotPasswordPage:

      return customPageRoute(AdminForgotPasswordPage());
    case AppRoutes.adminnewPasswordPage:
      return customPageRoute(AdminNewPasswordPage());
    case AppRoutes.adminpasswordVerificationPage:
      return customPageRoute(AdminPasswordVerificationPage());
    case AppRoutes.adminregisterSuccessPage:
      return customPageRoute(AdminRegisterSuccessPage());
    case AppRoutes.adminNewOrderViewPage:
      return customPageRoute(AdminNewFoodDetailPage());
    case AppRoutes.adminOrderProcessingPage:
      return customPageRoute(AdminOrderProcessingDetailPage());
    case AppRoutes.adminOrderCompletePage:
      return customPageRoute(AdminOrderCompleteDetailPage());
    case AppRoutes.adminOrderPaymentHistoryPage:
      return customPageRoute(AdminOrderPaymentHistoryPage());
    case AppRoutes.adminOrderPaymentHistoryDetailPage:
      return customPageRoute(AdminOrderPaymentHistoryDetailPage());
    case AppRoutes.adminAboutUsPage:
      return customPageRoute(AdminAboutPage());
    case AppRoutes.adminSettingPage:
      return customPageRoute(AdminSettingPage());
    case AppRoutes.adminCategoryAnalysisPage:
      return customPageRoute(AdminCategoryAnalysis());
    case AppRoutes.adminFoodRevenuePage:
    return customPageRoute(AdminFoodRevenuePage());
    case AppRoutes.adminSingleFoodGraphPage:
    return customPageRoute(AdminSingleFoodGraphPage());
    case AppRoutes.adminCategoryAddPage:
      return customPageRoute(AdminFoodCategoryAddPage());
    case AppRoutes.adminFoodItemPage:
    return customPageRoute(AdminFoodItemPage());
    case AppRoutes.adminFoodItemAddPage:
     return customPageRoute(AdminFoodItemAddPage());
    default:
      return customPageRoute(UserFoodPage());
  }
}



PageRoute customPageRoute(Widget page) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: (context) => page);
  } else {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);  
        const end = Offset.zero;
        const curve = Curves.easeInOut;  
        
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);   
        return FadeTransition(
          alwaysIncludeSemantics: true,
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),  
    );
  }
}

