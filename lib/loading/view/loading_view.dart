import 'package:dino/game/view/game_view.dart';
import 'package:dino/loading/cubit/preload_cubit.dart';
import 'package:dino/loading/widgets/animated_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  Future<void> _onPreloadComplete(BuildContext context) async {
    final nav = Navigator.of(context);
    await Future.delayed(AnimatedProgress.animDuration);
    if (!mounted) return;
    await nav.pushReplacement(GameView.route());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<PreloadCubit, PreloadState>(
      listenWhen: (previous, current) =>
          !previous.isComplete && current.isComplete,
      listener: (context, state) => _onPreloadComplete(context),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<PreloadCubit, PreloadState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: AnimatedProgress(
                      progress: state.progress,
                      background: theme.colorScheme.primary,
                      foreground: theme.colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    "Loading...",
                    style: theme.primaryTextTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
