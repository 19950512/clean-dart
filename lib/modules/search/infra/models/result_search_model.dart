import 'dart:convert';

import 'package:clean_architeture/modules/search/domain/entities/result_search.dart';

//* Princípio do Open/Closed, fechado para alteração mas aberto para extensão
class ResultSearchModel extends ResultSearch {
  ResultSearchModel({String? title, String? content, String? img})
      : super(img: img, title: title, content: content);

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'title': title,
      'content': content,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      img: map['img'],
      title: map['title'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
