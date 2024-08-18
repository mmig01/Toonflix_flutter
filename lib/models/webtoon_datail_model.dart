class WebtoonDatailModel {
  final String title;
  final String about;
  final String genre;
  final String age;

  WebtoonDatailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
