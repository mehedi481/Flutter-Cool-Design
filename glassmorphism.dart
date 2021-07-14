import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mehedi_pattern/helpers/assets_path.dart';
import 'package:mehedi_pattern/helpers/size_config/size_config.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsPath.background),
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5.0,
                  spreadRadius: 7,
                  offset: Offset(8, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25.0,
                  sigmaY: 25.0,
                ),
                child: Container(
                  height: ScreenSize.height! * 0.8,
                  width: ScreenSize.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Mehedi Hasan",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(25),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
