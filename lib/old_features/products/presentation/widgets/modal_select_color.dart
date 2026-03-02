import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/empty/ui_simple_empty_value.dart';
import 'package:deehelp/old_core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../old_core/ui/widgets/search/ui_search_field.dart';

class ModalSelectColor extends StatefulWidget {
  final Function(String) onChange;
  const ModalSelectColor({super.key, required this.onChange});

  @override
  State<ModalSelectColor> createState() => _ModalSelectColorState();
}

class _ModalSelectColorState extends State<ModalSelectColor> {
  late List<Map<String, String>> filteredValues;
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> colors = [
    {'name': 'Preto', 'hex': '#000000'},
    {'name': 'Vermelho', 'hex': '#FF0000'},
    {'name': 'Branco', 'hex': '#FFFFFF'},
    {'name': 'Cinza', 'hex': '#808080'},
    {'name': 'Prata', 'hex': '#C0C0C0'},
    {'name': 'Verde', 'hex': '#00FF00'},
    {'name': 'Azul', 'hex': '#0000FF'},
    {'name': 'Amarelo', 'hex': '#FFFF00'},
    {'name': 'Roxo', 'hex': '#800080'},
    {'name': 'Laranja', 'hex': '#FFA500'},
    {'name': 'Rosa', 'hex': '#FFC0CB'},
    {'name': 'Marrom', 'hex': '#A52A2A'},
    {'name': 'Ciano', 'hex': '#00FFFF'},
    {'name': 'Magenta', 'hex': '#FF00FF'},
    {'name': 'Verde Lima', 'hex': '#00FF00'},
    {'name': 'Azul Marinho', 'hex': '#000080'},
    {'name': 'Verde Floresta', 'hex': '#228B22'},
    {'name': 'Dourado', 'hex': '#FFD700'},
    {'name': 'Turquesa', 'hex': '#40E0D0'},
    {'name': 'Salmão', 'hex': '#FA8072'},
  ];

  @override
  void initState() {
    super.initState();
    filteredValues = List.from(colors);
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    final query = _searchController.text.toLowerCase().trim();

    if (query.isEmpty) {
      setState(() {
        filteredValues = List.from(colors);
      });
    } else {
      setState(() {
        filteredValues = colors
            .where((value) =>
                value["name"].toString().toLowerCase().contains(query))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: Text(
        //     "Selecione uma cor",
        //     style: context.appTextStyles.sectionTitle.copyWith(
        //       // color: AppColors.textSecondary,
        //       color: Theme.of(context).colorScheme.surfaceDim,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              UIICon(
                press: () => context.pop(),
                isAlpha: true,
                bgColor: Theme.of(context).colorScheme.outline,
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        UISearchField(searchController: _searchController),
        Flexible(
          child: filteredValues.isEmpty
              ? const UISimpleEmptyValue()
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 1,
                    // color: Colors.grey.shade300,
                  ),
                  itemCount: filteredValues.length,
                  itemBuilder: (context, index) {
                    final color = filteredValues[index];
                    return ListTile(
                      onTap: () {
                        widget.onChange(color["name"].toString());
                      },
                      leading: Container(
                        width: Dimens.size32.w,
                        height: Dimens.size32.h,
                        decoration: BoxDecoration(
                          color: Color(int.parse(
                              color["hex"]!.replaceFirst('#', '0xFF'))),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                      ),
                      title: Text(
                        color["name"].toString(),
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
