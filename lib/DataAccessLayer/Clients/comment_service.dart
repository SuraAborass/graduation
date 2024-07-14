import 'package:graduation/Constants/links.dart';
import 'package:graduation/DataAccessLayer/Models/comment.dart';
import 'package:graduation/core/network/http.dart';

class CommentService {
  Future<CommentQuostion> getComments(int postId) async {
    Request request = Request(
      getComment(postId),
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
    return CommentQuostion.fromJson(response);
  }

  Future<void> addComment(int postId, String description) async {
    Request request = Request(
      add_Comment(postId),
      RequestMethod.post,
      authorized: true,
      body: {"description": description},
    );
    Map<String , dynamic> response = await request.sendRequest();
  }
   Future<void> editComment(int commentId, String description) async {
    Request request = Request(
      edit_comment(commentId),
      RequestMethod.post,
      authorized: true,
      body: {"description": description},
    );
    Map<String , dynamic> response = await request.sendRequest();
  }
   Future<void> deleteComment(int commentId) async {
    Request request = Request(
      delete_comment(commentId),
      RequestMethod.delete,
      authorized: true,
     
    );
    Map<String , dynamic> response = await request.sendRequest();
  }
}
