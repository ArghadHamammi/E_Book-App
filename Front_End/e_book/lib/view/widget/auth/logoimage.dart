import 'package:e_book/core/constant/imagesassets.dart';
import 'package:flutter/cupertino.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageAssets.login, height: 130);
  }
}
