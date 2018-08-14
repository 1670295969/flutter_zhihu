class NewsItem {
  final String content;
  final String url;
  final int id;
  NewsItem({this.content, this.url, this.id});

  static List<NewsItem> fromJsonWithContent(List<dynamic> json) {
    return json.map((map) {
      return NewsItem(
          content: map["title"], url: map["images"][0], id: map["id"]);
    }).toList();
  }

  static List<NewsItem> fromJsonWithBar(List<dynamic> json) {
    return json.map((map) {
      return NewsItem(content: map["title"], url: map["images"]);
    }).toList();
  }
}
