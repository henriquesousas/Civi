import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';

class ModalSelectBrand extends StatelessWidget {
  final List<String> values;
  final Function(String) onChange;
  const ModalSelectBrand({
    super.key,
    required this.onChange,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            R.strings.selectBrand,
            style: context.appTextStyles.bodyTextStyle1
                .copyWith(color: AppColors.textSecondary),
          ),
        ),
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            itemCount: values.length,
            itemBuilder: (context, index) {
              final value = values[index];
              return ListTile(
                onTap: () {
                  onChange(value);
                },
                title: Text(
                  value,
                  style: context.appTextStyles.sectionSubTitle1,
                  // style: Theme.of(context).textTheme.titleSmall,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
