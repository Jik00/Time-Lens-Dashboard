import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImageField extends StatefulWidget {
  final double width;
  final double height;
  final ValueChanged<File?> onImageChanged;

  const CustomImageField({
    super.key,
    required this.width,
    required this.height,
    required this.onImageChanged,
  });

  @override
  State<CustomImageField> createState() => _CustomImageFieldState();
}

bool isLoading = false;
File? selectedImage;

class _CustomImageFieldState extends State<CustomImageField> {
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: pickImage,
        child: selectedImage == null
            ? Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  // color: Colors.grey[200],
                  border: Border.all(color: const Color(0xFFBC8729)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      selectedImage!,
                      width: widget.width,
                      height: widget.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(
                        Icons.info,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Tap on image to change',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  void pickImage() async {
    setState(() {
      isLoading = true;
    });
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) {
        setState(() {
          isLoading = false;
        });
        return;
      }
      selectedImage = File(pickedFile.path);
      widget.onImageChanged(selectedImage!);
    } on Exception catch (e) {
      ScaffoldMessenger(child: SnackBar(content: Text(e.toString())));
    }
    setState(() {
      isLoading = false;
    });
  }
}
