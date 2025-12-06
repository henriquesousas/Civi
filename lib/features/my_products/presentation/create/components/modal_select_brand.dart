import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/widgets/empty/ui_simple_empty_value.dart';
import 'package:deehelp/core/widgets/search/ui_search_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';

class ModalSelectBrand extends StatefulWidget {
  final List<String> values;
  final Function(String) onChange;
  const ModalSelectBrand({
    super.key,
    required this.onChange,
    required this.values,
  });

  @override
  State<ModalSelectBrand> createState() => _ModalSelectBrandState();
}

class _ModalSelectBrandState extends State<ModalSelectBrand> {
  late List<String> filteredValues;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredValues = List.from(widget.values);
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    final query = _searchController.text.toLowerCase().trim();

    if (query.isEmpty) {
      setState(() {
        filteredValues = List.from(widget.values);
      });
    } else {
      setState(() {
        filteredValues = widget.values
            .where((value) => value.toLowerCase().trim().contains(query))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
        UISearchField(searchController: _searchController),
        Flexible(
          child: filteredValues.isEmpty
              ? const UISimpleEmptyValue()
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                  itemCount: filteredValues.length,
                  itemBuilder: (context, index) {
                    final value = filteredValues[index];
                    return ListTile(
                      onTap: () {
                        widget.onChange(value);
                      },
                      title: Text(
                        value,
                        style: context.appTextStyles.sectionSubTitle1,
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

//   Widget _buildEmptyState() {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.search_off,
//               size: 32,
//               color: Colors.grey.shade400,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Nenhum resultado encontrado',
//               style: context.appTextStyles.bodyTextStyle1.copyWith(
//                 color: AppColors.textSecondary,
//               ),
//             ),
//             if (_searchController.text.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(top: 8),
//                 child: Text(
//                   'Tente buscar com outros termos',
//                   style: context.appTextStyles.caption1Style.copyWith(
//                     color: Colors.grey.shade500,
//                   ),
//                   // style: context.appTextStyles.caption.copyWith(
//                   //   color: Colors.grey.shade500,
//                   // ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
