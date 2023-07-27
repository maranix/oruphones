import 'package:http/http.dart' as http;

// Define a base class 'Repository'.
// This class serves as the base class for repositories that interact with an HTTP client.
base class Repository {
  // The constructor for the 'Repository' class.
  // This constructor creates a new instance of 'Repository' with the provided HTTP client.
  //
  // Parameters:
  //   client: An instance of 'http.Client' to be used for making HTTP requests.
  Repository({
    required http.Client client,
  }) : _client = client;

  // The base URI for the API.
  // This URI is used as the starting point for constructing API endpoints.
  final Uri baseUri = Uri(
    scheme: 'https',
    host: 'dev2be.oruphones.com',
    path: 'api/v1/global/assignment',
  );

  // The private HTTP client used for making HTTP requests.
  final http.Client _client;

  // A getter method to access the private HTTP client.
  // This getter allows external classes to access the HTTP client but not modify it.
  http.Client get client => _client;
}
