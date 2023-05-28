class WebToonModel {
  final String title, thumb, id;

  // named constructor
  WebToonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
