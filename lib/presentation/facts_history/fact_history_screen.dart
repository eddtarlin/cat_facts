import 'package:cat_fact/config/config_import.dart';
import 'package:cat_fact/data/data_import.dart';
import 'package:cat_fact/presentation/widgets/cat_app_bar.dart';
import 'package:cat_fact/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FactHistoryScreen extends StatefulWidget {
  const FactHistoryScreen({Key? key}) : super(key: key);

  @override
  State<FactHistoryScreen> createState() => _FactHistoryScreenState();
}

class _FactHistoryScreenState extends State<FactHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CatAppBar(
        context: context,
        text: "Facts History",
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<CatFact>(DbPath.factsDb).listenable(),
        builder: (context, Box<CatFact> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text("No facts"),
            );
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              CatFact? catFact = box.getAt(index);
              if (catFact != null) {
                return ListTile(
                  title: Text(
                    catFact.fact,
                    style: theme.textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    DateFormatter.format(catFact.date),
                  ),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
