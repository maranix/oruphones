import 'package:http/http.dart' as http;

base class Repository {
  Repository({
    required http.Client client,
  }) : _client = client;

  final Uri baseUri = Uri(
    scheme: 'https',
    host: 'dev2be.oruphones.com',
    path: 'api/v1/global/assignment',
  );

  final http.Client _client;

  http.Client get client => _client;
}
