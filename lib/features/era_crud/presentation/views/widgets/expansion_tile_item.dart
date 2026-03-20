import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';
import 'package:timelens_dashboard/features/era_crud/presentation/views/widgets/add_era_view_body.dart';

class ExpansionTileItem extends StatelessWidget {
  const ExpansionTileItem({super.key, required this.era});

  final EraEntity era;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: ExpansionTile(
        title: Text(
          eraName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        iconColor: Colors.white,
        collapsedIconColor: const Color(0xFFBC8729),
        backgroundColor: const Color(0xFF614317),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            side: BorderSide(color: Color(0xFF614317))),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        children: [
          Container(
            height: 150.h,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              image: DecorationImage(
                image: NetworkImage(
                  era.imgUrl!,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
          ),
          Text(
            era.eraPeriod,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
