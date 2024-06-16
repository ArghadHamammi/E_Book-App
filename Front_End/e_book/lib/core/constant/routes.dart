// import 'dart:html';

import 'package:e_book/core/middleware/mymiddleware.dart';
import 'package:e_book/view/screen/auth/login.dart';
import 'package:e_book/view/screen/auth/signup.dart';
import 'package:e_book/view/screen/auth/successsignup.dart';
import 'package:e_book/view/screen/bookdetails.dart';
import 'package:e_book/view/screen/books.dart';
import 'package:e_book/view/screen/favorite.dart';
import 'package:e_book/view/screen/homepage.dart';
import 'package:e_book/view/screen/homescreen.dart';
import 'package:e_book/view/screen/bookpdf.dart';
import 'package:e_book/view/screen/library.dart';
import 'package:e_book/view/screen/notofocationview.dart';
import 'package:e_book/view/screen/onboarding.dart';
import 'package:get/get.dart';
import '../../view/screen/language.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: "/bookpdf", page: () => BookPdf()),
  GetPage(name: "/login", page: () => const Login()),
  GetPage(name: "/signup", page: () => const SignUp()),
  GetPage(name: "/onboarding", page: () => const OnBoarding()),
  GetPage(name: "/successsignup", page: () => const SuccessSignUP()),
  GetPage(name: "/homepage", page: () => const HomeScreen()),
  GetPage(name: "/homescreen", page: () => const HomePage()),
  GetPage(name: "/books", page: () => Books()),
  GetPage(name: "/favorite", page: () => Favorite()),
  GetPage(name: "/bookdetails", page: () => BookDetails()),
  GetPage(name: "/libary", page: () => Library()),
  GetPage(name: "/notification", page: () => NotificationView()),
];
