import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/controllers/server_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  ServerController serverController = Get.put(ServerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DeviceID"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Obx((){
          return Column(
            children: [
              serverController.isLoading.value
                  ? Center(child: CircularProgressIndicator(),)
                  : Row(
                children: [
                  Text('${serverController.deviceName}'),
                  SizedBox(width: 50,),
                  Text('${serverController.deviceId}'),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter Server Ip"
                ),
              ),
            ],
          );
        }
        ),
      ),
    );
  }
}
