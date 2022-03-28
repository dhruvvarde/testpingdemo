import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/widget.dart';
import '../controller/ping_controller.dart';

class PingScreen extends GetView<PingController> {
  static const pageId = "/PingScreen";

  PingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() =>controller.serverDetails.isNotEmpty
            ?Column(
          children: [
              Expanded(
                      child: ListView.builder(
                          itemCount: controller.serverDetails.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: Text(
                                  'Server IP Address: ${controller.serverDetails[i].ipAddress.toString()}'),
                              subtitle: Text(
                                  'Server Time : ${controller.serverDetails[i].serverTime.toString()}'),
                            );
                          },
                        ),
                    ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("Total: " + controller.total.last.toString()),
            )
          ],
        ):Text("Click on Button to check server time")
        ),
        bottomNavigationBar: CustomTextButton(
          title: "Click",
          onCallback: controller.displayData,
        ),
      ),
    );
  }
}
