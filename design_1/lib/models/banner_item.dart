class BannerItem {
  final String title, subTitle;
  final String background;

  BannerItem({
    this.title,
    this.subTitle,
    this.background,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) => BannerItem(
        title: json["title"],
        subTitle: json["subTitle"],
        background: json["background"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "background": background,
      };
}
