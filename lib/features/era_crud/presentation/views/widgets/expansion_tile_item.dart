import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpansionTileItem extends StatelessWidget {
  const ExpansionTileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: const Text(
          'Era Title',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        iconColor: Colors.white,
        collapsedIconColor: const Color(0xFFBC8729),
        backgroundColor: const Color(0xFF614317),
        collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(color: Color(0xFF614317))),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        children: [
          Container(
            height: 150,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://bgiyysstohukhiztkyju.supabase.co/storage/v1/object/public/eras/the_new_kingdom/the_new_kingdom.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          ),
          const Text(
            '( 1100 - 1200 )',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
