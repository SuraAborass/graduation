import 'package:graduation/DataAccessLayer/Models/subject.dart';
import 'package:graduation/DataAccessLayer/Models/user.dart';

class CommentQuostion {
  int id;
  String quostion;
  String year;
  int state_on_off;
  int section_id;
  int teacher_id;
  List<Comment> comments;
  Subject subject;

  CommentQuostion(
      {required this.id,
      required this.quostion,
      required this.year,
      required this.state_on_off,
      required this.section_id,
      required this.teacher_id,
      required this.comments,
      required this.subject});

  factory CommentQuostion.zero() => CommentQuostion(
      id: 0,
      quostion: "",
      year: "",
      state_on_off: 0,
      section_id: 0,
      teacher_id: 0,
      comments: [],
      subject: Subject.zero());

  factory CommentQuostion.fromJson(Map<String, dynamic> json) => CommentQuostion(
      id: json["id"],
      quostion: json["quostion"],
      year: json["year"],
      state_on_off: json["state_on_off"],
      section_id: json["section_id"],
      teacher_id: json["teacher_id"],
      comments: Comment.fromJsonList(json),
      subject: Subject.fromMap(json["subject"]));
}

class Comment {
  int id;
  String description;
  int postID;
  User user;
  Comment({required this.id, required this.postID, required this.description, required this.user});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json["id"],
      postID: json["post_id"],
      description: json["description"],
      user: User.fromBoxMap(
        json["student"]["user"],
      ),
    );
  }

  static List<Comment> fromJsonList(Map<String, dynamic> json) {
    List<Comment> comments = [];

    json["comments"].forEach(
      (element) => comments.add(
        Comment.fromJson(element),
      ),
    );
    return comments;
  }
}
