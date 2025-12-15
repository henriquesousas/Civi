import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/faq/faq.dart';
import 'package:deehelp/features/faq/state/faq_bloc.dart';
import 'package:deehelp/features/faq/state/faq_event.dart';
import 'package:deehelp/features/faq/state/faq_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/faq_list_item_widget.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomScaffold(
      pageTitle: "Perguntas frequentes",
      onBackButtonTap: () => context.pop(),
      body: BlocBuilder<FaqBloc, FaqState>(
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemCount: Faq.faqList.length,
            itemBuilder: (context, index) => FaqListItemWidget(
              answer: (Faq.faqList[index].answer),
              question: (Faq.faqList[index].question),
              index: index,
              press: () {
                context.read<FaqBloc>().add(FaqChangedEvent(index, true));
              },
              selectedIndex: state.index,
            ),
          );
        },
      ),
    );
  }
}
