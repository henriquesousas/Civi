import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class DashboadIncidentsWarning extends StatelessWidget {
  const DashboadIncidentsWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        "Aqui aparecerá as ocorrências que foram \nregistradas nas últimas horasssa.",
        style:
            context.appTextStyles.sectionSubTitle1.copyWith(letterSpacing: 1.0),
      ),
    );
  }
}
