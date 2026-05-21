abstract interface class ArchivementDatasource {
  Future<List<Map<String, dynamic>>?> getArchivements();
}
