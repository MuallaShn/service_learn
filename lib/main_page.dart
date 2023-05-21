import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calisma/service_and_models/post_model.dart';
import 'package:flutter_calisma/service_and_models/service_post_learn.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with _PageUtility {
  List<PostModel>? _postItems;
  bool _isloading = false;
  late final IPostService _postManager;

  void _changeLoading() {
    setState(() {
      _isloading = !_isloading;
    });
  }

  Future<void> fetchTryMetod() async {
    _changeLoading();
    _postItems = await _postManager.fetchTryMetod();
    _changeLoading();
  }

  @override
  void initState() {
    super.initState();
    _postManager = PostService();
    fetchTryMetod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comments),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: _PageUtility.black,
              size: normalIconSize,
            ),
          ),
        ],
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : _postItems == null
              ? Center(
                  child: Text(dataNotFound),
                )
              : ListView.builder(
                  itemCount: _postItems!.length,
                  itemBuilder: (context, index) {
                    final post = _postItems![index];
                    return ListTile(
                      title: Text(post.title!),
                      subtitle: Text(post.body!),
                    );
                  },
                ),
    );
  }
}
mixin _PageUtility {
  final String comments = "Comments";
  final double normalIconSize = 30;
  static const Color black = Colors.black;
  final String dataNotFound="Veri bulunamadı";
}
