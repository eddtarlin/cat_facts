import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cat_fact/config/config_import.dart';
import 'package:cat_fact/data/data_import.dart';
import 'package:cat_fact/presentation/widgets/widgets.dart';

import 'package:cat_fact/presentation/facts_screen/bloc/fact_bloc.dart';

class FactsScreen extends StatefulWidget {
  const FactsScreen({Key? key}) : super(key: key);

  @override
  State<FactsScreen> createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
  @override
  void initState() {
    super.initState();
    _newRandomFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CatAppBar(
        text: "Cat Facts",
        context: context,
      ),
      body: BlocConsumer<FactBloc, FactState>(
        listener: (context, state) {
          if (state is RandomCatFact) {
            _saveFact(state.catFact);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: state is RandomCatFact
                      ? CatFactWidget(
                          catFact: state.catFact,
                          image: state.image,
                        )
                      : const AppProgressIndicator(),
                ),
                const SizedBox(height: 10),
                AppButton(
                  onPress: _navigateToFactsHistoryScreen,
                  height: 32,
                  title: "FactsHistory",
                ),
                AppButton(
                  onPress: _newRandomFact,
                  height: 32,
                  title: "New Fact",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _newRandomFact() {
    context.read<FactBloc>().add(GetRandomCatFact());
  }

  void _saveFact(CatFact fact) {
    context.read<FactBloc>().add(SaveCatFact(catFact: fact));
  }

  void _navigateToFactsHistoryScreen() {
    Navigator.of(context).pushNamed(
      AppRoutes.factsHistory,
    );
  }
}
