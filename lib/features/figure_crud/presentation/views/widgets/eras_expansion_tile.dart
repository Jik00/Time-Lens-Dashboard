import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';

class ErasExpansionTile extends StatefulWidget {
  const ErasExpansionTile(
      {super.key,
      this.onTap,
      required this.belongEraController,
      required this.eras});

  final List<EraEntity> eras;
  final void Function()? onTap;
  final TextEditingController belongEraController;

  @override
  State<ErasExpansionTile> createState() => _ErasExpansionTileState();
}

class _ErasExpansionTileState extends State<ErasExpansionTile> {
  final TextEditingController eraNameController =
      TextEditingController(text: 'Select the belonged era');

  final ExpansibleController expandController = ExpansibleController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300),
      child: ExpansionTile(
        controller: expandController,
        title: Text(
          (widget.belongEraController.text.isEmpty)
              ? 'Select the belonged era'
              : eraNameController.text,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        iconColor: Colors.white,
        collapsedIconColor: const Color(0xFFBC8729),
        backgroundColor: const Color(0xFF614317),
        collapsedBackgroundColor: Colors.transparent,
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            side: BorderSide(color: const Color(0xFFBC8729))),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            side: BorderSide(color: const Color(0xFFBC8729))),
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  eraNameController.text = widget.eras[index].eraName;
                  expandController.collapse();
                  widget.belongEraController.text = widget.eras[index].eraName;
                });
              },
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.white)),
                ),
                child: Center(
                  child: Text(
                    widget.eras[index].eraName,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ),
            ),
            padding: const EdgeInsets.all(6),
            itemCount: widget.eras.length,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    eraNameController.dispose();
    expandController.dispose();
    super.dispose();
  }
}
