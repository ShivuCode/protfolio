import 'package:shared_preferences/shared_preferences.dart';

class StoreList {
  Future<List<String>> getList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  Future<bool> insertItem(String key, String item) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      List<String> currentList = await getList(key);
      currentList.add(item);
      prefs.setStringList(key, currentList);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateItem(String key, int index, String newItem) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> currentList = await getList(key);
    if (index >= 0 && index < currentList.length) {
      currentList[index] = newItem;
      prefs.setStringList(key, currentList);
    }
  }

  Future<bool> deleteItem(String key, int index) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      List<String> currentList = await getList(key);
      if (index >= 0 && index < currentList.length) {
        currentList.removeAt(index);
        prefs.setStringList(key, currentList);
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
