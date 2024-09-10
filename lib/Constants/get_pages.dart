import 'package:get/get.dart';
import '../PresentationLayer/Screens/Auth/login_screen.dart';
import '../PresentationLayer/Screens/Auth/registration_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/about_us_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/fees_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/general_info_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/order_to_course_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/out_adverts_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/out_home_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/resolves_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/teachers_screen.dart';
import '../PresentationLayer/Screens/Public/adverts_screen.dart';
import '../PresentationLayer/Screens/Public/arachive_subjects_screen.dart';
import '../PresentationLayer/Screens/Public/course_files_screen.dart';
import '../PresentationLayer/Screens/Public/courses_screen.dart';
import '../PresentationLayer/Screens/Public/discussions_screen.dart';
import '../PresentationLayer/Screens/Public/exam_results_screen.dart';
import '../PresentationLayer/Screens/Public/home_screen.dart';
import '../PresentationLayer/Screens/Public/homeworks_screen.dart';
import '../PresentationLayer/Screens/Public/notes_screen.dart';
import '../PresentationLayer/Screens/Public/notifications_screen.dart';
import '../PresentationLayer/Screens/Public/one_discussion_screen.dart';
import '../PresentationLayer/Screens/Public/profile_screen.dart';
import '../PresentationLayer/Screens/Public/program_screen.dart';
import '../PresentationLayer/Screens/Public/splash_screen.dart';
import '../PresentationLayer/Screens/Public/subject_files_screen.dart';
import '../PresentationLayer/Screens/Public/subject_images_screen.dart';
import '../PresentationLayer/Screens/Public/subjects_screen.dart';
import '../PresentationLayer/Screens/Public/subjects_with_homework_screen.dart';
import '../PresentationLayer/Screens/Public/sumResult_screen.dart';
import '../PresentationLayer/Screens/Public/years_archive_screen.dart';
import 'get_routes.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.zoom,),
  GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),),
  GetPage(
    name: AppRoutes.registration,
    page: () =>  RegistrationOrderScreen(),),
  GetPage(
    name: AppRoutes.subjects,
    page: () =>  SubjectsScreen(),),
  GetPage(
    name: AppRoutes.profile,
    page: () =>  ProfileScreen(),),
  GetPage(
    name: AppRoutes.homeworks,
    page: () =>  HomeworksScreen(),),
  GetPage(
    name: AppRoutes.subjectImages,
    page: () =>  SubjectImagesScreen(),),
  GetPage(
    name: AppRoutes.viewImage,
    page: () =>  SubjectImagesScreen(),),
  GetPage(
    name: AppRoutes.subWithHomeworks,
    page: () =>  SubWithHomeworkScreen(),),
  GetPage(
    name: AppRoutes.notifications,
    page: () =>  NotificationsScreen(),),
  GetPage(
    name: AppRoutes.outHomeScreen,
    page: () =>  OutHomeScreen(),),
  GetPage(
    name: AppRoutes.teachers,
    page: () =>  TeachersScreen(),),
  GetPage(
    name: AppRoutes.program,
    page: () =>  ProgramScreen(),),
  GetPage(
    name: AppRoutes.subjectFiles,
    page: () =>  SubjectFilesScreen(),),
  GetPage(
    name: AppRoutes.notes,
    page: () =>  NotesScreen(),),
  GetPage(
    name: AppRoutes.ads,
    page: () =>  AdvertsScreen(),),
  GetPage(
    name: AppRoutes.archiveSubjects,
    page: () =>  ArchiveSubjectsScreen(),),
  GetPage(
    name: AppRoutes.archiveYears,
    page: () =>  YearsArchiveScreen(),),
  GetPage(
    name: AppRoutes.courses,
    page: () =>  CoursesScreen(),),
  GetPage(
    name: AppRoutes.discussions,
    page: () =>  DiscussionsScreen(),),
  GetPage(
    name: AppRoutes.oneDiscussion,
    page: () =>  OneDiscussionScreen(),),
  GetPage(
    name: AppRoutes.results,
    page: () =>  ExamResultsScreen(),),
  GetPage(
    name: AppRoutes.aboutUs,
    page: () =>  AboutUsScreen(),),
  GetPage(
    name: AppRoutes.resolves,
    page: () =>  ResolvesScreen(),),
  GetPage(
    name: AppRoutes.generalInfo,
    page: () =>  GeneralInfoScreen(),),
  GetPage(
    name: AppRoutes.fees,
    page: () =>  FeesScreen(),),
  GetPage(
    name: AppRoutes.outAdverts,
    page: () =>  OutAdvertsScreen(),),
  GetPage(
    name: AppRoutes.oderToCourse,
    page: () =>  OrderToCourseScreen(),),
  GetPage(
    name: AppRoutes.courseFiles,
    page: () =>  CourseFilesScreen(),),
  GetPage(
    name: AppRoutes.sumResult,
    page: () =>  SumResultScreen(),),


];
