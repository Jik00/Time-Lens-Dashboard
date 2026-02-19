abstract class DataService {
  Future<void> addData(
      {required String tableName, required Map<String, dynamic> data});

  // Future<List<Map<String, dynamic>>> getData({required String tableName, Map<String, dynamic>? filters});
  // Future<void> updateData({required String tableName, required Map<String, dynamic> data, required Map<String, dynamic> filters});
  // Future<void> deleteData({required String tableName, required Map<String, dynamic> filters });
}
