import 'package:bloc_demo/bloc.dart';
import 'package:bloc_demo/emaple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          create: (_) => CatCaringBloc(),
          child:
              BlocBuilder<CatCaringBloc, CatState>(builder: (context, state) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () => context
                            .read<CatCaringBloc>()
                            .add(CatCaringFeedingEvent()),
                        child: const Text("feed")),
                    TextButton(
                        onPressed: () => context
                            .read<CatCaringBloc>()
                            .add(CatCaringSleepEvent()),
                        child: const Text("sleep")),
                    TextButton(
                        onPressed: () => context
                            .read<CatCaringBloc>()
                            .add(CatCaringPlayingEvent()),
                        child: const Text("play")),
                    Text(state.toString())
                  ],
                ),
              ),
            );
          })),
    );
  }
}
