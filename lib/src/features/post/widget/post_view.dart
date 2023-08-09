import 'package:flutter/material.dart';

import '../../../common/services/api_service.dart';
import '../models/data/repository.dart';
import '../models/post_model.dart';
import 'components/custom_text_field.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late final IPostRepository postRepository;
  List<PostModel> posts = [];
  List<PostModel> searchPosts = [];

  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    postRepository = PostRepositoryImpl(APIService());
    getAllPosts();
  }

  void getAllPosts() async {
    posts = await postRepository.getAllPosts();
    setState(() {});
  }

  void onChanged(String value) {
    if (value.isNotEmpty) {
      isSearching = true;
      searchPosts = [];
      for (final post in posts) {
        if (RegExp(value.toLowerCase()).hasMatch(post.body!.toLowerCase())) {
          searchPosts.add(post);
        }
      }
    } else {
      isSearching = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: CustomTextField(
                    onChanged: onChanged,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: isSearching ? searchPosts.length : posts.length,
                itemBuilder: (context, index) {
                  final post = isSearching ? searchPosts[index] : posts[index];
                  return Card(
                    margin: const EdgeInsets.all(16),
                    child: ListTile(
                      title: Text(post.title ?? ""),
                      subtitle: RichText(
                        text: TextSpan(
                          text: "${post.body}\n",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "${post.tags?.map((e) => "#$e").join(" ")}",
                              style: const TextStyle(
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
