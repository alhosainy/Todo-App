abstract class SharedPrefrences {
  openPrefrences();
  savePrefrences(String key, String value);
  Future<String?> getPrefrences(String key);
  removePrefrences(String key);
}