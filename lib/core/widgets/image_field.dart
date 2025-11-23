import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageField extends StatelessWidget {
  final double width;
  final double height;

  const CustomImageField({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      },
      child: Container(
        width: width,
        height: height,
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
      ),
    );
  }
}
