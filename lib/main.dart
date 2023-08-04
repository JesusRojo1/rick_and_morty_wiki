import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rick_and_morty_show/routes.dart';
import 'package:rick_and_morty_show/ui/characters/blocs/characters_bloc.dart';
import 'package:rick_and_morty_show/ui/characters/providers/api_provider.dart';
import 'package:rick_and_morty_show/ui/episodes/blocs/episode_bloc.dart';
import 'package:rick_and_morty_show/ui/episodes/providers/api_provider_episodes.dart';
import 'package:rick_and_morty_show/ui/login/screens/login_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersBloc(apiProvider: ApiProvider()),
        ),
        BlocProvider(
          create: (context) => EpisodeBloc(apiProvider: ApiProviderEpisodes()),
        ),
      ],
      child: const MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: routes,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoginScreen()),
    );
  }
}
