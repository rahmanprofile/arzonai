import 'Items.dart';

class Orders {
  Orders({
    this.id,
    this.date,
    this.items,
    this.total,
  });

  Orders.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    total = json['total'];
  }
  String? id;
  String? date;
  List<Items>? items;
  double? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    return map;
  }
}
