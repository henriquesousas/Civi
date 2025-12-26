// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/ui/localization/resources.dart';
// import '../bloc/create_item_bloc.dart';
// import '../bloc/item_event.dart';
// import '../bloc/item_state.dart';
// import '../components/create_item_card.dart';
// import '../components/header.dart';
// import '../utils/type_item_select.dart';

// class StepChooseTypePage extends StatefulWidget {
//   const StepChooseTypePage({super.key});

//   @override
//   State<StepChooseTypePage> createState() => _StepChooseTypePageState();
// }

// class _StepChooseTypePageState extends State<StepChooseTypePage> {
//   _selectItem(TypeItemSelect item) {
//     context.read<CreateItemBloc>().add(ItemSelectedEvent(item: item));
//   }

//   _refreshItem(TypeItemSelect item, List<TypeItemSelect> items) {
//     setState(() {
//       for (var position = 0; position < items.length; position++) {
//         items[position].unselect();
//       }
//       item.select();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CreateItemBloc, ItemState>(
//       listener: (context, state) {
//         if (state.status == ItemStatus.updateItemSelected) {
//           if (state.detailItem.selectedItem != null) {
//             _refreshItem(
//                 state.detailItem.selectedItem!, state.detailItem.items);
//           }
//         }
//       },
//       builder: (context, state) {
//         return Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   spacing: 30,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Header(
//                       title: R.strings.stepOneHeader,
//                       subtitle: R.strings.stepOneBody,
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount:
//                           state.detailItem.items.length, //defaultItems.length,
//                       itemBuilder: (context, index) {
//                         final item = state.detailItem.items[index];
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 4),
//                           child: CreateItemCard(
//                             item: item,
//                             onTap: () => _selectItem(item),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
