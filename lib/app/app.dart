import 'package:audioplayers/audioplayers.dart';
import 'package:dino/loading/cubit/preload_cubit.dart';
import 'package:dino/loading/view/loading_view.dart';
import 'package:flame/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final PreloadCubit _preloadCubit;
  @override
  void initState() {
    super.initState();
    _preloadCubit = PreloadCubit(Images(prefix: ''), AudioCache(prefix: ''))
      ..loadSeqeuntially();
  }

  @override
  void dispose() {
    _preloadCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => _preloadCubit),
      ],
      child: MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: const LoadingView(),
      ),
    );
  }
}
