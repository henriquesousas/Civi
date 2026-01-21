import 'package:deehelp/core/resources.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/features/search/topo_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Models
class FiltroPesquisa {
  final String? query;
  final String? estado;
  final String? cidade;
  final String? tipoVeiculo; // 'carro', 'moto', 'caminhao', etc.
  final DateTime? dataInicio;
  final DateTime? dataFim;
  final String? status; // 'ativo', 'resolvido', 'investigação'
  final String? tipoOcorrencia; // 'roubo', 'assalto', 'furto'

  FiltroPesquisa({
    this.query,
    this.estado,
    this.cidade,
    this.tipoVeiculo,
    this.dataInicio,
    this.dataFim,
    this.status,
    this.tipoOcorrencia,
  });

  FiltroPesquisa copyWith({
    String? query,
    String? estado,
    String? cidade,
    String? tipoVeiculo,
    DateTime? dataInicio,
    DateTime? dataFim,
    String? status,
    String? tipoOcorrencia,
  }) {
    return FiltroPesquisa(
      query: query ?? this.query,
      estado: estado ?? this.estado,
      cidade: cidade ?? this.cidade,
      tipoVeiculo: tipoVeiculo ?? this.tipoVeiculo,
      dataInicio: dataInicio ?? this.dataInicio,
      dataFim: dataFim ?? this.dataFim,
      status: status ?? this.status,
      tipoOcorrencia: tipoOcorrencia ?? this.tipoOcorrencia,
    );
  }
}

final filtroPesquisaProvider = StateProvider.autoDispose<FiltroPesquisa>((ref) {
  return FiltroPesquisa();
});

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtro = ref.watch(filtroPesquisaProvider);

    return UICustomScaffold(
      padding: EdgeInsets.zero,
      hideAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopoSearch(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: _buildSecaoTipoVeiculo(ref, filtro, context),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: context.screenWidth,
              height: context.screenHeight,
              color: AppColors.whiteColor,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSecaoTipoVeiculo(
      WidgetRef ref, FiltroPesquisa filtro, BuildContext context) {
    final tiposVeiculo = [
      {'icon': R.svg.category, 'label': 'Todos', 'value': 'todos'},
      {'icon': R.svg.car, 'label': 'Carro', 'value': 'carro'},
      {'icon': R.svg.motorcycle, 'label': 'Moto', 'value': 'moto'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tipo de Veículo',
          style: context.appTextStyles.bodyTextStyle2.copyWith(
            color: AppColors.textColorBody,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: tiposVeiculo.map((tipo) {
            final isSelected = filtro.tipoVeiculo == tipo['value'];

            return FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon(tipo['icon'] as IconData, size: 18),
                  UIMyAssetsImageWidget(
                    isSvg: true,
                    assetPath: tipo['icon'] as String,
                    width: Dimens.size18.r,
                    height: Dimens.size18.r,
                    color: isSelected
                        ? AppColors.primaryColor
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    tipo['label'] as String,
                    style: context.appTextStyles.bodyTextStyle1.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? AppColors.primaryColorDark
                          : AppColors.textColorBody,
                    ),
                  ),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                ref.read(filtroPesquisaProvider.notifier).state =
                    filtro.copyWith(
                        tipoVeiculo: selected ? tipo['value'] as String : null);
              },
              selectedColor: AppColors.primaryColor.withValues(alpha: 0.3),
              checkmarkColor: AppColors.primaryColor,
              backgroundColor: Colors.grey[100],
              shape: StadiumBorder(
                side: BorderSide(
                  color:
                      isSelected ? AppColors.primaryColor : Colors.grey[300]!,
                  width: 1,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
