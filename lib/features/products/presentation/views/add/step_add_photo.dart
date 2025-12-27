import 'package:deehelp/core/services/media/image_picker_service.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/header_text_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepAddPhoto extends ConsumerWidget {
  final ImagePickerService _imagePicker;
  const StepAddPhoto({super.key, required ImagePickerService imagePicker})
      : _imagePicker = imagePicker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addProductViewModelProvider);
    final viewModel = ref.watch(addProductViewModelProvider.notifier);
    return UICustomAppCard(
      child: Column(
        children: [
          const HeaderTextCard(
            header: "Foto detalhada",
            text:
                "Envie uma imagem do produto para facilitar a identificação e tornar seu registro mais completo.",
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final image = await _imagePicker.pickImageFromGallery();
              if (image != null) {
                viewModel.addPhoto(image);
              }
              //TODO: Mostrar mensagem avisando que nao conseguiu pegar a image
            },
            child: DottedBorder(
              options: const RoundedRectDottedBorderOptions(
                dashPattern: [5, 5],
                strokeWidth: 2,
                radius: Radius.circular(15),
                color: AppColors.primaryColor,
                // padding: EdgeInsets.all(16),
              ),
              child: Container(
                color: Colors.white,
                width: context.percentWidth(0.9),
                height: context.percentWidth(0.4),
                child: state.imageMedia == null
                    ? _addPhotoDottedContainer(context)
                    : UIMyAssetsImageWidget(
                        width: context.percentWidth(0.9),
                        height: context.percentWidth(0.9),
                        boxFit: BoxFit.cover,
                        isFile: true,
                        assetPath: state.imageMedia!.value,
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _addPhotoDottedContainer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UIICon(
              bgColor: AppColors.primaryColor,
              icon: Icon(
                Icons.camera_alt,
                color: AppColors.whiteColor,
                size: 16,
              ),
            ),
            Text(
              "Adicionar foto",
              style: context.appTextStyles.caption1Style,
            ),
          ],
        ),
      ],
    );
  }
}
