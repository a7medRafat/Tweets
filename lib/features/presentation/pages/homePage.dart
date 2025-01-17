import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweets/features/presentation/pages/post_add_upfdate_page.dart';
import '../../../core/utils/utils.dart';
import '../bloc/posts_bloc.dart';
import '../widgets/posts_page/display_message_widget.dart';
import '../widgets/posts_page/loading_widget.dart';
import '../widgets/posts_page/post_list_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingBtn(context));
  }

  AppBar _buildAppBar() => AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'tweets',
        ),
      );

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (BuildContext context, PostsState state) {
          if (state is LoadingPostsStates) {
            return const LoadingWidget();
          } else if (state is LoadedPostsStates) {
            return RefreshIndicator(
                onRefresh: () => _refresh(context),
                child: PostListWidget(
                  posts: state.posts,
                ));
          } else if (state is ErrorPostsStates) {
            return DisplayMessageWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Widget _buildFloatingBtn(BuildContext context) => FloatingActionButton(
        onPressed: () {
          navigateTo(
              context,
              const AddUpdatePostPage(
                isUpdatePage: false,
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      );

  Future<void> _refresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshAllPostsEvent());
  }
}
