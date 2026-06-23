import 'dart:io';

import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/context_extensions.dart';
import 'package:training_acedamy/core/extensions/extension.dart';
import 'package:training_acedamy/core/helpers/media_handlers/images_handlers/image_picker_handler.dart';
import 'package:training_acedamy/core/theme/app_custom_color.dart';

import '../../theme/text_styles.dart';
import '../buttons/minus_button.dart';

class SingleImagePicker extends StatefulWidget {
  const SingleImagePicker({
    super.key,
    required this.onImageChanged,
    this.title,
    this.initialImage,
    required this.isReadOnly,
  });

  final ValueChanged<String?> onImageChanged;
  final String? initialImage;
  final String? title;
  final bool isReadOnly;

  @override
  State<SingleImagePicker> createState() => _SingleImagePickerState();
}

class _SingleImagePickerState extends State<SingleImagePicker> {
  String? imagePath;

  Future<void> _handleTap() async {
    final pickedImage = await ImagePickerHandler.singleImagePicker();
    if (pickedImage == null) {
      return;
    }

    setState(() {
      imagePath = pickedImage;
    });
    widget.onImageChanged(pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.horizontalComponentTitleAndComponentsSpacing,
      children: [
        if (widget.title != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.title!, style: AppTextStyles.body),
          ),

        Stack(
          children: [
            GestureDetector(
              onTap: (widget.isReadOnly) ? null : _handleTap,
              child: Container(
                width: context.isMobile ? double.infinity : 350.sp,
                decoration: BoxDecoration(
                  color: AppCustomColor.mainContainerColor.color,
                  borderRadius: BorderRadius.circular(
                    context.mainContainerBorderRadius,
                  ),
                ),
                padding: EdgeInsets.all(
                  (imagePath == null && widget.initialImage == null)
                      ? 32.sp
                      : 0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    context.mainContainerBorderRadius,
                  ),
                  child: imagePath != null
                      ? Image.file(File(imagePath!), fit: BoxFit.cover)
                      : widget.initialImage != null
                      ? Image.network(widget.initialImage!, fit: BoxFit.cover)
                      : Icon(
                          Icons.cloud_upload_outlined,
                          size: 52.sp,
                          color: AppCustomColor.primaryColor.color,
                        ),
                ),
              ),
            ),
            if (widget.initialImage != null || imagePath != null)
              Positioned.directional(
                textDirection: Directionality.of(context),
                end: 10.sp,
                top: 10.sp,
                child: MinusButton(
                  onTap: () {
                    imagePath = null;
                    widget.onImageChanged(null);
                    setState(() {});
                  },
                ),
              ),
          ],
        ),
      ],
    );
  }
}
