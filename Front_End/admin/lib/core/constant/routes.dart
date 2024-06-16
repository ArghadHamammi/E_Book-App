 
import 'package:admin/core/middleware/mymiddleware.dart';
import 'package:admin/view/book/add.dart';
import 'package:admin/view/book/edit.dart';
import 'package:admin/view/book/view.dart';
import 'package:admin/view/genre/add.dart';
import 'package:admin/view/genre/edit.dart';
import 'package:admin/view/genre/view.dart';
import 'package:admin/view/homepage.dart';
import 'package:admin/view/homescreen.dart';
import 'package:admin/view/language.dart';
import 'package:admin/view/login.dart';
import 'package:admin/view/users/view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: "/login", page: () => const Login()),
  GetPage(name: "/homescreen", page: () => const HomeScreen()),
  GetPage(name: "/homepage", page: () => const HomePage()),
  ///////////////////////
  GetPage(name: "/genreview", page: () => const GenreView()),
  GetPage(name: "/genreadd", page: () => const GenreAdd()),
  GetPage(name: "/genreedit", page: () => const GenreEdit()),
  // GetPage(name: "/genredelet", page: () => const GenreView()),
  //////////////////////
  GetPage(name: "/bookview", page: () => const BookView()),
  GetPage(name: "/bookadd", page: () => const Bookadd()),
  GetPage(name: "/bookedit", page: () => const BookEdit()),
  // GetPage(name: "/bookdelet", page: () => const GenreView()),
  //////////////////////
  GetPage(name: "/usersview", page: () => const UsersView()),




];

//Map<String, Widget Function(BuildContext)> routesm = {
 // "login": (context) => const Login(),
  //"language": (context) => const Language(),
  //"onboarding": (context) => const OnBoarding(),
  //"signup": (context) => const SignUp(),
 // "forgetpassword": (context) => const ForgetPassword(),
 // "verifiycode": (context) => const VerfiyCode(),
 // "rsetpassword": (context) => const ResetPassword(),
 // "successreset": (context) => const SuccessResetPassword(),
 // "successsignup": (context) => const SuccessSignUP(),
 // "verfiycodesignUp": (context) => const VerfiyCodeSignUp(),
//};
