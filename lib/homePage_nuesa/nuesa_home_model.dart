class Nuesa_news {
  final String id;
  final String title, imageUrl, para1, full;

  Nuesa_news({
    this.id,
    this.title,
    this.imageUrl,
    this.para1,
    this.full
  });

  factory Nuesa_news.fromJson(Map<String, dynamic> jsonData) {
    return Nuesa_news(
      id: jsonData['id'],
      title: jsonData['title'],
      para1: jsonData['para1'],
      imageUrl: "http://a1in1.com/w_springer/images/"+jsonData['image_url'],
      full: jsonData['full_desc']
    );
  }
}