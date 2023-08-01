import 'files.dart';

class FilesMemoryImpl extends Files {
  final Map<String, String> files = {};
  @override
  Future<void> delete(String path) async {
    files.remove(path);
  }

  @override
  Future<String?> read(String path) async {
    return files[path];
  }

  @override
  Future<void> write(String path, String content) async {
    files.addAll({path: content});
  }
}
