part of 'service.dart';

class MovieService {
  
  final http.Client _client = http.Client();
  final String _homeBase = 'api.themoviedb.org';
  final String _subBase = '3/discover/movie';
  
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
      final Map data = json.decode(response.body) as Map;
      final List result = data['results'] as List;
      
      print(result.length);
      
      // for (final movie in result) {
      //   print(movie['id']);
      // }

      return result.map<Movie>((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
    }
  }
}