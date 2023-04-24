class ChapterModel {
  int? id;
  String? header;
  String? slug;
  List<String>? body;
  int? viewCount;
  String? uploadDate;
  String? updatedDate;
  String? deletedAt;
  // Story? story;

  ChapterModel({
    this.id,
    this.header,
    this.slug,
    this.body,
    this.viewCount,
    this.uploadDate,
    this.updatedDate,
    this.deletedAt,
    // this.story,
  });

  ChapterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    slug = json['slug'];
    body = json['body'] != null ? List<String>.from(json['body']) : [];
    viewCount = json['viewCount'];
    uploadDate = json['uploadDate'] ?? '';
    updatedDate = json['updatedDate'] ?? '';
    deletedAt = json['deletedAt'] ?? '';
    // story = json['story'] != null ? new Story.fromJson(json['story']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['slug'] = this.slug;
    data['body'] = this.body;
    data['viewCount'] = this.viewCount;
    data['uploadDate'] = this.uploadDate;
    data['updatedDate'] = this.updatedDate;
    data['deletedAt'] = this.deletedAt;
    // if (this.story != null) {
    //   data['story'] = this.story!.toJson();
    // }
    return data;
  }
}
