import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_state.dart';
import 'package:deehelp/features/itens/presentation/create/components/create_item_card.dart';
import 'package:deehelp/features/itens/presentation/create/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/resources.dart';
import 'bloc/item_event.dart';
import 'type_item_select.dart';

class ItemChooseTypePage extends StatefulWidget {
  const ItemChooseTypePage({super.key});

  @override
  State<ItemChooseTypePage> createState() => _ItemChooseTypePageState();
}

class _ItemChooseTypePageState extends State<ItemChooseTypePage> {
  _selectItem(TypeItemSelect item) {
    context.read<CreateItemBloc>().add(ItemSelectedEvent(item: item));
  }

  _refreshItem(TypeItemSelect item, List<TypeItemSelect> items) {
    setState(() {
      for (var position = 0; position < items.length; position++) {
        items[position].unselect();
      }
      item.select();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateItemBloc, ItemState>(
      listener: (context, state) {
        if (state.status == ItemStatus.updateItemSelected) {
          if (state.detailItem.selectedItem != null) {
            _refreshItem(
                state.detailItem.selectedItem!, state.detailItem.items);
          }
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      title: R.strings.stepOneHeader,
                      subtitle: R.strings.stepOneBody,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          state.detailItem.items.length, //defaultItems.length,
                      itemBuilder: (context, index) {
                        final item = state.detailItem.items[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: CreateItemCard(
                            item: item,
                            onTap: () => _selectItem(item),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
