class NewsItem {
  final String content;
  final String url;
  final int id;

  NewsItem({this.content, this.url, this.id});

  static List<NewsItem> fromJsonWithContent(List<dynamic> json) {
    return json.map((map) {
      String imgUrl = "";
      if (map["images"] != null) {
        imgUrl = map["images"][0];
      }
      return NewsItem(content: map["title"], url: imgUrl, id: map["id"]);
    }).toList();
  }

  static List<NewsItem> fromJsonWithBar(List<dynamic> json) {
    if (json == null) {
      return null;
    }
    return json.map((map) {
      return NewsItem(content: map["title"], url: map["image"]);
    }).toList();
  }
}

class ThemeItem {
  final String iconUrl;
  final String description;
  final int id;
  final String name;

  ThemeItem({this.id, this.description, this.name, this.iconUrl});

  static List<ThemeItem> json2List(List<dynamic> jsonArr) {
    return jsonArr.map(json2Item).toList();
  }

  static ThemeItem json2Item(dynamic map) {
    return ThemeItem(
        id: map['id'],
        description: map['description'],
        name: map['name'],
        iconUrl: map['thumbnail']);
  }
}
