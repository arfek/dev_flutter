import 'package:get/get.dart';

class Dependency{
  static S permanentSave<S>(S dependency) {
    return Get.put<S>(dependency, permanent: true);
  }

  static addOrReplace<S>(S dependency){
    if(Get.isRegistered<S>()){
      Get.replace<S>(dependency);
    }else{
      permanentSave<S>(dependency);
    }
  }

  static S get<S>({String? tag}) => Get.find<S>();

  static bool isRegistered<S>() => Get.isRegistered<S>();

  static Future<bool> delete<S>({String? tag, bool force = false}) async =>
      Get.delete<S>(tag: tag, force: force);
}