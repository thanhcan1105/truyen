import 'chapter_model.dart';

class StoriesModel {
  int? id;
  String? title;
  String? author;
  String? slug;
  List<String>? description;
  String? poster;
  List<String>? categoryList;
  List<String>? categories;
  String? status;
  List<ChapterModel>? chapters;
  String? uploadDate;
  String? updatedDate;
  String? deletedAt;

  StoriesModel(
      {this.id,
      this.title,
      this.author,
      this.slug,
      this.description,
      this.poster,
      this.categoryList,
      this.categories,
      this.status,
      this.chapters,
      this.uploadDate,
      this.updatedDate,
      this.deletedAt});

  StoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    slug = json['slug'];
    description = json['description'].cast<String>();
    poster = json['poster'];
    categoryList = json['categoryList'].cast<String>();
    categories = json['categories'].cast<String>();
    status = json['status'];
    if (json['chapters'] != null) {
      chapters = <ChapterModel>[];
      json['chapters'].forEach((v) {
        chapters!.add(ChapterModel.fromJson(v));
      });
    }
    uploadDate = json['uploadDate'];
    updatedDate = json['updatedDate'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['poster'] = this.poster;
    data['categoryList'] = this.categoryList;
    data['categories'] = this.categories;
    data['status'] = this.status;
    if (this.chapters != null) {
      data['chapters'] = this.chapters!.map((v) => v.toJson()).toList();
    }
    data['uploadDate'] = this.uploadDate;
    data['updatedDate'] = this.updatedDate;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
