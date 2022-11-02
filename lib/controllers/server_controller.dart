import 'package:get/get.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

class ServerController extends GetxController{
 RxBool isLoading = false.obs;
 String deviceName = '', deviceId = '';

 @override
  void onInit() {
    // TODO: implement onInit
    getDeviceDetails();
    super.onInit();
  }

  Future<void> getDeviceDetails() async{
  isLoading(true);
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try{
   if(Platform.isAndroid){
    var build = await deviceInfoPlugin.androidInfo;
    deviceName = build.model;
    deviceId = build.androidId;
    print('=========$deviceName===========$deviceId');
    print('=========${build.board}===========${build.bootloader}');
    print('=========${build.device}===========${build.display}');
    print('=========${build.androidId}===========${build.fingerprint}');
    print('=========${build.host}===========${build.manufacturer}');
    print('=========${build.product}===========${build.version}');
    print('=========${build.type}===========${build.tags}');
    print('=========${build.id}===========${build.tags}');
   }
  }catch(e){
   print("Something occurs $e");
  }
  isLoading(false);
  }
}