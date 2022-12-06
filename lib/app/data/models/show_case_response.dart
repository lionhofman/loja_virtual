import 'package:loja_virtual/app/domain/entities/show_case.dart';

class ShowCaseResponse extends ShowCase {
  ShowCaseResponse({
    required super.image,
    required super.page,
    required super.pos,
    required super.x,
    required super.y,
  });

  factory ShowCaseResponse.fromFirestone(
    Map<String, dynamic> dataSnapshot,
  ) {
    return ShowCaseResponse(
        image: dataSnapshot['image'],
        page: dataSnapshot['page'],
        pos: dataSnapshot['pos'],
        x: dataSnapshot['x'],
        y: dataSnapshot['y']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "image": image,
      "page": page,
      "pos": pos,
      "x": x,
      "y": y,
    };
  }
}
