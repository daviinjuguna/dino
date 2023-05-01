import 'package:dino/game/bloc/audio/audio_cubit.dart';
import 'package:dino/game/dino_run.dart';
import 'package:dino/loading/cubit/preload_cubit.dart';
import 'package:flame/game.dart' hide Route;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  static Route<void> route() =>
      MaterialPageRoute(builder: (_) => const GameView());

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  PreloadCubit get _preloadCubit => context.read<PreloadCubit>();
  late AudioCubit _audioCubit;
  // FlameGame? _game;
  @override
  void initState() {
    super.initState();
    _audioCubit = AudioCubit(_preloadCubit.audio);
  }

  @override
  void dispose() {
    _audioCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => _audioCubit),
      ],
      child: Scaffold(
        body: GameWidget(
          game: DinoRunGame(
            audioPlayer: _audioCubit.player,
            imageCache: _preloadCubit.images,
          ),
        ),
      ),
    );
  }
}
