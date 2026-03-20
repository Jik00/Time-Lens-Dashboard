abstract class DataSource {
  Future<void> addData(
      {required String tableName, required Map<String, dynamic> data});

  Future<List<Map<String, dynamic>>> fetchAllData({required String tableName});

  Future<List<Map<String, dynamic>>> fetchDataBy({required String tableName, required String query, required String value});
  
  // Future<void> updateData({required String tableName, required Map<String, dynamic> data, required Map<String, dynamic> filters});
  // Future<void> deleteData({required String tableName, required Map<String, dynamic> filters });
}
