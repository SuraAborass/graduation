const baseLink = "http://10.65.0.99:8000/api/";
const loginLink = "out_user/login";
const subjects = "student/my_subject";
const images = "student/img_subject";
const homeworks = "student/my_homework";
const teachers = "out_user/all-teatcher";
const program = "student/my_programe";
const notes = "student/my_note";
const ads = "all_publish";
const courses = "student/my_course";
const discussions = "student/display_all_post";
const order = "out_user/add-order";
const updateProfile = "student/edit_some_info_profile";
String getComment(int postId) =>"student/post/$postId";
String add_Comment(int postId) => "student/add_comment/$postId";
String edit_comment(int commentId) => "student/edit_comment/$commentId";
String delete_comment(int commentId)=>"student/delete_comment/$commentId";
