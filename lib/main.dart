import 'package:apicallingflutter/bloc/bloc.dart';
import 'package:apicallingflutter/hive/model.dart';
import 'package:apicallingflutter/repository.dart';
import 'package:apicallingflutter/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
  // Needed for Hive.initFlutter()

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for Flutter

  await Hive.initFlutter();
  // Register adapters
  Hive.registerAdapter(WelcomeAdapter());
  Hive.registerAdapter(ProductListAdapter());
  Hive.registerAdapter(AttributeValueListAdapter());

  // Create Repository instance here to pass to MyApp
  final repository = Repository();

  runApp(MyApp(repository: repository));
}

class MyApp extends StatefulWidget {
  final Repository repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DataFetchingBloc>(
            create: (_) => DataFetchingBloc(repository: widget.repository),
          ),
        ],
        child: HomeScreen()
      ),
    );
  }
}
