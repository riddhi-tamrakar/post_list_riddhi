import 'package:get/get.dart';
import 'package:pet_adoption/views/post_detail.dart';
import 'package:pet_adoption/views/post_list.dart';

class AppRoutes {
  // A static list of pages (routes) used in GetX routing
  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => PostListScreen(),
    ),
    GetPage(
      name: '/postDetails',
      page: () => PostDetailScreen(),
      transition: Transition.fadeIn, // Optional: You can add transitions here
    ),
    
  ];
}
