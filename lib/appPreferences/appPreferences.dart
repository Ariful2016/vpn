import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:vpn_basic_project/allModels/vpn_info.dart';

class AppPreferences {
  static late Box boxOfData;

  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxOfData = await Hive.openBox("data");
  }

  // saving user choice about theme selection
  static bool get isModeDark => boxOfData.get("isModeDark") ?? false;

  static set isModeDark(bool value) => boxOfData.put("isModeDark", value);

  // for savings single selected vpn details
  static VpnInfo get vpnInfoObj =>
      VpnInfo.fromJson(jsonDecode(boxOfData.get("vpn") ?? '{}'));

  static set vpnInfoObj(VpnInfo value) =>
      boxOfData.put("vpn", jsonEncode(value));

  // for saving all vpn servers details
  static List<VpnInfo> get vpnList{
    List<VpnInfo> tempVpnList = [];
    final dataVpn = jsonDecode(boxOfData.get("vpnList") ?? '[]');

    for(var data in dataVpn){
      tempVpnList.add(VpnInfo.fromJson(data));
    }
    return tempVpnList;
  }
  static set vpnList(List<VpnInfo> valueList) => boxOfData.put("vpnList", jsonEncode(valueList));
}
