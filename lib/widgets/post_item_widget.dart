import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/dynamic_height.dart';

class PostItemWidget extends StatelessWidget {
  final Map<String, dynamic> post;
  const PostItemWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: DynamicSize.height(context, 0.022),
          vertical: DynamicSize.height(context, 0.015)),
      child: Card(
          shadowColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(DynamicSize.height(context, 0.01)),
          ),
          elevation: 1,
          child: ListTile(
              title: Text(
                post['title'] ?? 'No Title',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                'Score: ${post['score']} | By: ${post['by']}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
             onTap: () => Get.toNamed('/postDetails', arguments: post),)),
    );
  }
}
