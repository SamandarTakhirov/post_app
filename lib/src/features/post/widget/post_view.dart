import 'package:flutter/material.dart';
import 'package:post_app/src/common/constants/api_constants.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(ApiConst.baseUrl),
      ),
    );
  }
}
