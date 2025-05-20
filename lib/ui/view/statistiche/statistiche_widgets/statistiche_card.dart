import 'package:flutter/material.dart';

import 'package:flutter_application/ui/viewModel/statisticheViewModel/statistiche_viewmodel.dart';
import 'package:provider/provider.dart';


class CardRegioniUtenti extends StatefulWidget {
  const CardRegioniUtenti({super.key});

  @override
  State<CardRegioniUtenti> createState() => _CardRegioniUtentiState();
}

class _CardRegioniUtentiState extends State<CardRegioniUtenti> {
  final Map<String, bool> _expandedMap = {};

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<StatisticheViewmodel>(context, listen: false);

    return StreamBuilder<Map<String, Map<String, int>>>(
      stream: viewmodel.getRegionCountStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final regioniCount = snapshot.data!;

        for (var regione in regioniCount.keys) {
          _expandedMap.putIfAbsent(regione, () => false);
        }

        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: regioniCount.entries.map((entry) {
            final regione = entry.key;
            final maschi = entry.value['Maschio']!;
            final femmine = entry.value['Femmina']!;
            final isExpanded = _expandedMap[regione]!;

            return Card(
              color: Colors.white,
              elevation: 10,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Column(
                children: [
                  ListTile(
                    title: Text(regione, style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: IconButton(
                      icon: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          _expandedMap[regione] = !isExpanded;
                        });
                      },
                    ),
                  ),
                  if (isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.male, color: Colors.blue, size: 20),
                              SizedBox(width: 6),
                              Text("Maschi: $maschi", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.female, color: Colors.pink, size: 20),
                              SizedBox(width: 6),
                              Text("Femmine: $femmine", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
