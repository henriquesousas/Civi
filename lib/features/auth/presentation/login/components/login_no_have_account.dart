import 'package:deehelp/core/router/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginNoHaveAccount extends StatelessWidget {
  const LoginNoHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(R.strings.parts(text: R.strings.notHaveAccount).first),
          // TextButton(
          //   onPressed: () {
          //     context.push(RouterConstant.registerAccount);
          //   },
          //   child: Text(R.strings.parts(text: R.strings.notHaveAccount).last),
          // )
        ],
      ),
    );
  }
}
