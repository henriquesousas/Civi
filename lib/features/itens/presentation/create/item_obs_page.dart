import 'package:deehelp/core/components/textfields/ui_primary_text_field.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/resources.dart';
import 'components/header.dart';

class ItemObsPage extends StatelessWidget {
  const ItemObsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateItemBloc, ItemState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Header(
                title: R.strings.stepObsHeady,
                subtitle: R.strings.stepObsBody,
              ),
              const SizedBox(height: 32),
              UIPrimaryTextField(
                labelText: R.strings.obs,
                maxLine: 5,
              ),
            ],
          ),
        );
      },
    );
  }
}
