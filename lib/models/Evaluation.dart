
import 'package:ab3ad/models/User.dart';

class Evaluation {
  final int id ;
  final User user;
  final User rater;
  final String rating, review;


  Evaluation({
    required this.id, 
    required this.user,
    required this.rater,
    required this.rating,
    required this.review,
  }); 
 
  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      id: json['id'],
      user: User.fromJson(json["user"]),
      rater: User.fromJson(json["rater"]), 
      rating: json["rating"],
      review: json['review'],
    );
  }

}
