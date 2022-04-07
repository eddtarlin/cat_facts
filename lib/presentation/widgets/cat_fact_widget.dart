import 'package:cat_fact/utils/date_formatter.dart';
import 'package:flutter/material.dart';

import '../../data/model/cat_fact.dart';

class CatFactWidget extends StatefulWidget {
  final CatFact catFact;
  final String image;
  const CatFactWidget({
    Key? key,
    required this.catFact,
    required this.image,
  }) : super(key: key);

  @override
  State<CatFactWidget> createState() => _CatFactWidgetState();
}

class _CatFactWidgetState extends State<CatFactWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: SizedBox.expand(
                child: Image.network(
                  widget.image,
                  key: ValueKey(widget.catFact),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Text(
                        widget.catFact.fact,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      DateFormatter.format(widget.catFact.date),
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
