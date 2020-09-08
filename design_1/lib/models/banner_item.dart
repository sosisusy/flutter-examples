class BannerItem {
  final String title, subTitle;

  BannerItem({
    this.title,
    this.subTitle,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) => BannerItem(
        title: json["title"],
        subTitle: json["subTitle"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
      };
}
