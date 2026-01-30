import 'package:deehelp/core/ui/extensions/dialog_extension.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(90.0),
        child: Column(
          children: [
            Text(
              "Text1",
              style: TextStyle(fontSize: 9.sp),
            ),
            Text(
              "Text1",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
