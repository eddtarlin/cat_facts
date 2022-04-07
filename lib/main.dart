import 'package:cat_fact/data/data_import.dart';
import 'package:cat_fact/presentation/facts_history/fact_history_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cat_fact/presentation/facts_screen/facts_screen_import.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'styles/styles.dart';
import 'config/config_import.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(CatFactAdapter());
  await Hive.openBox<CatFact>(DbPath.factsDb);

  runApp(
    BlocProvider<FactBloc>(
      create: (context) => FactBloc(
        FactsRepository(
          restClient: RestClient(
            Dio(),
          ),
        ),
      ),
      child: const RandomCatFactApp(),
    ),
  );
}

class RandomCatFactApp extends StatelessWidget {
  const RandomCatFactApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        AppRoutes.home: (context) => const FactsScreen(),
        AppRoutes.factsHistory: (context) => const FactHistoryScreen(),
      },
    );
  }
}
