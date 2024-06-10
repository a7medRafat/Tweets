import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../entities/posts.dart';
import '../repositories/postst_repositories.dart';

class GetAllPostsUseCase {
  final PostRepositories postRepositories;

  GetAllPostsUseCase(this.postRepositories);

  Future<Either<Failure, List<Posts>>> call() async {
    return await postRepositories.getAllPosts();
  }
}
