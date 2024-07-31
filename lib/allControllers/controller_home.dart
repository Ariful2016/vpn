import 'package:get/get.dart';
import 'package:vpn_basic_project/appPreferences/appPreferences.dart';

import '../allModels/vpn_info.dart';

class ControllerHome extends GetxController{
  final Rx<VpnInfo> vpnInfo = AppPreferences.vpnInfoObj.obs;
}