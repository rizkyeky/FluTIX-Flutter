part of 'service.dart';

class MovieService {
  
  final http.Client _client = http.Client();
  final String _homeBase = 'https://api.themoviedb.org/3/discover';
  final String _subBase = 'movie';
  
  Future<List<Movie>> getMovies() async {
    
    final Map<String, String> query = {
      'page': '1',
      'year': '2020',
      'api_key': apiKey,
      'language': 'en-US',
      'include_adult': 'true',
      'include_video': 'false',
      'sort_by': 'popularity.desc',
    };

    final Uri _uri = Uri.https(_homeBase, _subBase, query);
    final http.Response response = await _client.get(_uri);

    if (response.statusCode != 200) {
      // Respone not success
      return [];
    }
    else {
      // Respone success
      final data = json.decode(response.body);
      final List<Map<String, dynamic>> result = data['results'] as List<Map<String, dynamic>>;
      return result.map((e) => Movie.fromJson(e)).toList();
    }
  }
}