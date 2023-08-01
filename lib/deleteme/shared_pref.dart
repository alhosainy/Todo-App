import 'package:shared_preferences/shared_preferences.dart';

class StoredData {
  SharedPreferences? preff;

  //initialize the data
  Future<SharedPreferences?> getShared() async {
    preff = await SharedPreferences.getInstance();
    return preff;
  }

//setting data
  addData({required String key, required List<String> value}) async {
    preff?.setStringList(key, value);
  }

  //read data
  readData({required String key}) {
    List? list = preff?.getStringList(key);
    return list;
  }

  //remove data
  deleteData(key) {
    preff?.remove(key);
  }
}
