part of 'model.dart';

class Cast {
  String name;
  String profilePath;
  
  Cast(this.name, this.profilePath);

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    (json['name'] as String).replaceAll(RegExp(r'\b \b'), '\n'),
    json['profile_path'] as String
  ); 
}