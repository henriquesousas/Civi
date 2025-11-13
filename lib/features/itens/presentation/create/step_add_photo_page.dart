import 'dart:io';

import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_state.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/resources/resources.dart';
import 'bloc/item_event.dart';
import 'components/header.dart';

class StepAddPhotoPage extends StatefulWidget {
  const StepAddPhotoPage({super.key});

  @override
  State<StepAddPhotoPage> createState() => _StepAddPhotoPageState();
}

class _StepAddPhotoPageState extends State<StepAddPhotoPage> {
  final ImagePicker imagePicker = ImagePicker();
  bool isUploading = false;

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && mounted) {
      context
          .read<CreateItemBloc>()
          .add(ImagePickerEvent(file: File(image.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateItemBloc, ItemState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Header(
                title: R.strings.stepAddPhotoHead,
                subtitle: R.strings.stepAddPhotoBody,
              ),
              GestureDetector(
                onTap: () async => await pickImageFromGallery(),
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
                    width: context.screenWidth,
                    height: 200,
                    child: state.photoUrl != null
                        ? Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: FileImage(state.photoUrl!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                spacing: 5,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: Colors.black.withValues(alpha: 0.2),
                                  ),
                                  Text(
                                    R.strings.addPhoto,
                                    style: context.getTextStyle.small,
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
