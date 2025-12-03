class ApiService {
  void init() {
    print("API Service initialized");
  }

  Future<dynamic> get(String endpoint) async {
    print("GET request to $endpoint");
    return null; // placeholder
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    print("POST request to $endpoint with data: $data");
    return null; // placeholder
  }
}
