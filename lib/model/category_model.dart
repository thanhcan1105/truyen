import 'package:truyen/model/story_model.dart';

class CategoryModel {
	int? id;
	String? name;
	String? slug;
	String? description;
	List<StoriesModel>? stories;

	CategoryModel({this.id, this.name, this.slug, this.description, this.stories});

	CategoryModel.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		slug = json['slug'];
		description = json['description'];
		if (json['stories'] != null) {
			stories = <StoriesModel>[];
			json['stories'].forEach((v) { stories!.add(new StoriesModel.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['slug'] = this.slug;
		data['description'] = this.description;
		if (this.stories != null) {
      data['stories'] = this.stories!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}
