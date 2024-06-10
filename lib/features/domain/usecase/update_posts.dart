import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../entities/posts.dart';
import '../repositories/postst_repositories.dart';

class UpdatePostUseCase {
  final PostRepositories postRepositories;

  UpdatePostUseCase(this.postRepositories);

  Future<Either<Failure, Unit>> call(Posts posts) async {
    return await postRepositories.updatePosts(posts);
  }
}
