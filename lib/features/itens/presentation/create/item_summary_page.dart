import 'package:deehelp/core/components/container/ui_simple_container.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_event.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_state.dart';
import 'package:deehelp/features/itens/presentation/create/components/box_summary_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/resources.dart';
import 'components/header.dart';

class ItemSummaryPage extends StatelessWidget {
  const ItemSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    void navigate(int page) {
      context.read<CreateItemBloc>().add(ChangePageEvent(page: page));
    }

    return SingleChildScrollView(
      child: BlocConsumer<CreateItemBloc, ItemState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            spacing: 1,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: R.strings.stepSummaryHead,
                subtitle: R.strings.stepSummaryBody,
              ),
              const SizedBox(height: 10),
              UISimpleContainer(
                press: () => navigate(0),
                children: [
                  const BoxSummaryHeader(title: "Tipo"),
                  Text(
                    state.detailItem.selectedItem?.name ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              UISimpleContainer(
                press: () => navigate(1),
                children: [
                  const BoxSummaryHeader(title: "Detalhes"),
                  const SizedBox(height: 8),
                  Column(
                    children: state
                        .getVehicleDetails()
                        .entries
                        .map(
                          (entry) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  entry.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              UISimpleContainer(
                press: () => navigate(2),
                children: [
                  const BoxSummaryHeader(title: "Observações"),
                  Text(
                    (state.itemObs.value?.isEmpty ?? true)
                        ? "Não informado"
                        : state.itemObs.value!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
              UISimpleContainer(
                press: () => navigate(3),
                children: [
                  const BoxSummaryHeader(title: "Fotos"),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      itemCount: 1,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120,
                          width: 120,
                          // width: context.percentWidth(0.9),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: FileImage(state.photoUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
