import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazione2ViewModel.dart';
import 'package:provider/provider.dart';

class Registrazione2Regione extends StatelessWidget {
  const Registrazione2Regione({super.key});

  final List<String> regioni = const [
    'Abruzzo',
    'Basilicata',
    'Calabria',
    'Campania',
    'Emilia-Romagna',
    'Friuli-Venezia Giulia',
    'Lazio',
    'Liguria',
    'Lombardia',
    'Marche',
    'Molise',
    'Piemonte',
    'Puglia',
    'Sardegna',
    'Sicilia',
    'Toscana',
    'Trentino-Alto Adige',
    'Umbria',
    "Valle d'Aosta",
    'Veneto',
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Register2pageViewModel>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Regione",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.8),
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.005,
          ),
          child: DropdownButton<String>(
            hint: Text(
              'Seleziona regione',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black.withValues(alpha: 0.4),
              ),
            ),
            value: regioni.contains(viewModel.regioneController.text)
                ? viewModel.regioneController.text
                : null,
            items: regioni
                .map((value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              viewModel.setRegione(value!);
            },
            isExpanded: true,
            underline: SizedBox(), // per togliere la linea sottostante
          ),
        ),
      ],
    );
  }
}
