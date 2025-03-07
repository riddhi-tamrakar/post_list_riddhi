import 'package:dio/dio.dart';
import 'package:get/get.dart';


class PostController extends GetxController {
  final Dio _dio = Dio();
  final RxList<Map<String, dynamic>> posts = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  List<int> storyIds = [];
  int currentIndex = 0;
  final int batchSize = 10;

  @override
  void onInit() {
    super.onInit();
    fetchPostList();
  }

  /// Fetches top story IDs and then fetches details for each ID
  Future<void> fetchPostList() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final response = await _dio.get('https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty');
      storyIds = List<int>.from(response.data);
      fetchNextBatch();
    } catch (e) {
      errorMessage.value = 'Failed to load stories';
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetches the next batch of story details
  Future<void> fetchNextBatch() async {
    if (currentIndex >= storyIds.length) return;
    
    int endIndex = (currentIndex + batchSize).clamp(0, storyIds.length);
    List<int> batchIds = storyIds.sublist(currentIndex, endIndex);
    currentIndex = endIndex;

    for (int id in batchIds) {
      await fetchPostDetails(id);
    }
  }

  /// Fetches details of a story by its ID
  Future<void> fetchPostDetails(int id) async {
    try {
      final response = await _dio.get('https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty');
      posts.add(response.data);
    } catch (e) {
      errorMessage.value = 'Error fetching story details';
    }
  }
}
