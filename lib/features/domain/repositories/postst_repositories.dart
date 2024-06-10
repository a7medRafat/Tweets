import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../entities/posts.dart';

abstract class PostRepositories {
  Future<Either<Failure, List<Posts>>> getAllPosts();

  Future<Either<Failure, Unit>> addPosts(Posts posts);

  Future<Either<Failure, Unit>> deletePosts(int id);

  Future<Either<Failure, Unit>> updatePosts(Posts posts);
}
