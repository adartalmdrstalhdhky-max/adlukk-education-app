class DatabaseService {
  void init() {
    print("Database initialized");
  }

  void saveData(String key, dynamic value) {
    print("Saved $key : $value");
  }

  dynamic getData(String key) {
    print("Retrieve data for $key");
    return null; // placeholder
  }
}
