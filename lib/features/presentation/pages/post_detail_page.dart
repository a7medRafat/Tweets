import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweets/features/presentation/pages/post_add_upfdate_page.dart';
import '../../../core/colors.dart';
import '../../../core/utils/buttons.dart';
import '../../../core/utils/snackbar_message.dart';
import '../../../core/utils/utils.dart';
import '../../domain/entities/posts.dart';
import '../add_delete_update_post/add_delete_update_post_bloc.dart';
import '../widgets/detail_page/delet_dialog_widget.dart';
import '../widgets/posts_page/loading_widget.dart';
import 'homePage.dart';

class PostDetailPage extends StatelessWidget {
  final Posts posts;

  const PostDetailPage({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text('tweet details'),
      );

  Widget _buildBody(context) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: defaultColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'post number ${posts.id.toString()}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent.withOpacity(0.5)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          posts.body,
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('edit'),
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: defaultColor),
                    onPressed: () {
                      navigateTo(
                        context,
                        AddUpdatePostPage(
                          isUpdatePage: true,
                          posts: posts,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  ButtonWidget(
                      txt: 'delete',
                      function:()=> deleteDialog(context),
                      color: Colors.redAccent.withOpacity(0.5)),
                ],
              ),
            )
          ],
        ),
      );

  void deleteDialog(context) {
    showDialog(context: context,
        builder: (context) {
          return BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
              listener: (context, state) {
            if (state is MessageAddDeleteUpdatePostStates) {
              showSuccessSnackBar(context: context, msg: state.message);
              navigateAndFinish(context, const Home());
            } else if (state is ErrorAddDeleteUpdatePostStates) {
              showErrorSnackBar(context: context, msg: state.message);
            }
          }, builder: (context, state) {
            if (state is LoadingAddDeleteUpdateState) {
              return const LoadingWidget();
            }
            return DeleteDialogWidget(postId: posts.id!);
          });
        });
  }
}
