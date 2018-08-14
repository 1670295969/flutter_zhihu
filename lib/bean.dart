class NewsItem {
  final String content;
  final String url;

  NewsItem({this.content, this.url});

  static List<NewsItem> fromJsonWithContent(List<dynamic> json) {
    return json.map((map) {
      return NewsItem(content: map["title"], url: map["images"][0]);
    }).toList();
  }

  static List<NewsItem> fromJsonWithBar(List<dynamic> json) {
    return json.map((map) {
      return NewsItem(content: map["title"], url: map["images"]);
    }).toList();
  }
}
