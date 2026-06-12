import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iobm/Views/more/workorder/post_work_order.dart';
import 'package:iobm/Views/more/workorder/work_order_tile_screen.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:get/get.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

class WorkOrderScreen extends StatefulWidget {
  const WorkOrderScreen({Key? key}) : super(key: key);

  @override
  _WorkOrderScreenState createState() => _WorkOrderScreenState();
}

class _WorkOrderScreenState extends State<WorkOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: SecAppBar(
          title: const Text(Strings.workOrder),
          context: context,
        ),
        body: Column(
          children: [
            _workOrderItem(
              title: 'Work Orders',
              onClicked: () {
                Get.to(() => const WorkOrders());
              },
            ),
            Divider(
              height: 1.h,
            ),

            _workOrderItem(
              title: 'Post Work Order',
              onClicked: () {
                Get.to(
                  () => const PostWorkOrder(
                    designation: '',
                    company: '',
                    description: '',
                    dueDate: '',
                    workId: '',
                    doc: '',
                  ),
                );
              },
            ),
            Divider(
              height: 1.h,
            ),
            //JOb opening container
          ],
        ),
      ),
    );
  }

  Widget _workOrderItem({
    String? title,
    VoidCallback? onClicked,
  }) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 7.0),
        title: Row(
          children: [
            SvgPicture.asset(
              AppImages.postjob,
              height: 18.h,
              width: 18.w,
              color: AppColor.primaryColor,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title ?? '',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: AppColor.black,
        ),
        onTap: onClicked,
        dense: true,
      ),
    );
  }
}
