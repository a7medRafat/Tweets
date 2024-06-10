import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../repositories/postst_repositories.dart';

class DeletePostUseCase {
  final PostRepositories postRepositories;

  DeletePostUseCase(this.postRepositories);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await postRepositories.deletePosts(postId);
  }
}
