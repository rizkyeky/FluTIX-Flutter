part of 'service.dart';

class MovieService {
  
  final http.Client _client = http.Client();
  final String _homeBase = 'api.themoviedb.org';
  
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
    
    const String _subBase = '3/discover/movie';

    // print('request api from $_homeBase');

    try {
      final Uri _uri = Uri.https(_homeBase, _subBase, query);
      final http.Response response = await _client.get(_uri).timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        // Respone not success
        return [];
      }
      else {
        // Respone success
        final Map data = json.decode(response.body) as Map;
        final List result = data['results'] as List;
        
        // print('respone success');
        
        return result.map<Movie>((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
      }
    } catch (e) {
      // print('request was failed');
      return [];
    }
  }

  Future<Movie> getMovie(int id) async {
    final Map<String, String> query = {
      'api_key': apiKey,
    };

    final String _subBase = '3/movie/$id';

    final Uri _uri = Uri.https(_homeBase, _subBase, query);
    final http.Response response = await _client.get(_uri);

    if (response.statusCode != 200) {
      // Respone not success
      return Movie.initial();
    }
    else {
      // Respone success
      final Map data = json.decode(response.body) as Map;

      // print('respone success');
      // print(data['runtime']);
      
      return Movie.fromJson(data as Map<String, dynamic>);
    }
  }

  Future<List<Cast>> getCasts(int id) async {
    final Map<String, String> query = {
      'api_key': apiKey,
    };

    final String _subBase = '3/movie/$id/credits';

    final Uri _uri = Uri.https(_homeBase, _subBase, query);
    final http.Response response = await _client.get(_uri);

    if (response.statusCode != 200) {
      // Respone not success
      return [];
    }
    else {
      // Respone success
      final Map data = json.decode(response.body) as Map;
      final List result = data['cast'] as List;
      
      return result.map((e) => Cast.fromJson(e as Map<String, dynamic>))
        .take(8).toList();
    }
  }
}