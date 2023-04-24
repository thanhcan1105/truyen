import 'package:truyen/model/story_model.dart';

class ChapterModel {
  int? id;
  String? header;
  String? slug;
  int? viewCount;
  String? updatedDate;
  StoriesModel? story;

  ChapterModel(
      {this.id,
      this.header,
      this.slug,
      this.viewCount,
      this.updatedDate,
      this.story});

  ChapterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    slug = json['slug'];
    viewCount = json['viewCount'];
    updatedDate = json['updatedDate'];
    story = json['story'] != null ? new StoriesModel.fromJson(json['story']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['slug'] = this.slug;
    data['viewCount'] = this.viewCount;
    data['updatedDate'] = this.updatedDate;
    if (this.story != null) {
      data['story'] = this.story!.toJson();
    }
    return data;
  }
}

