import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart'as di;
import '../features/presentation/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../features/presentation/bloc/posts_bloc.dart';
import '../features/presentation/pages/homePage.dart';
import 'injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => sl<PostsBloc>()..add(GetAllPostsEvent())),
          BlocProvider(create: (_) => sl<AddDeleteUpdatePostBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Times',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home(),
        ));
  }
}
