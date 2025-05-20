import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficoUtentiPerRegione extends StatelessWidget {
  //riceve in input una mappa che contiene le regioni e il numero di utenti registrati
  //la chiave è la regione e il valore è il numero di utenti registrati
  final Map<String, int> dati;

  const GraficoUtentiPerRegione({super.key, required this.dati});

  @override
  Widget build(BuildContext context) {
    final List<BarChartGroupData> barGroups = [];
    final List<String> regioni = dati.keys.toList();  //contiene le regioni
    final maxRegistrati = dati.values.fold<int>(0, (a, b) => a > b ? a : b);
    final double maxY = (maxRegistrati + 9).toDouble();


    //crea una lista di BarChartGroupData per ogni regione
    //ogni BarChartGroupData contiene un BarChartRodData che rappresenta il numero di utenti registrati
    for (int i = 0; i < regioni.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: dati[regioni[i]]!.toDouble(),
              color: Colors.blue,
              width: 4,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      );
    }

    return Container(
      
     
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width*0.97,
      
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          
          height: MediaQuery.of(context).size.height * 1,
          width: regioni.length * 17, // larghezza dinamica
          child: BarChart(
            
            BarChartData(
              
              alignment: BarChartAlignment.start,
              groupsSpace: 12,  //spazio tra le barre
              maxY: (maxRegistrati + 9).toDouble(),
              barGroups: barGroups,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 20,
                    interval: 2,
                    getTitlesWidget: (value, meta) {
                    // Se il valore è 11, non mostrare il testo
                    if (value == maxY) {
                      return Container(); // ritorna un widget vuoto
                    }
                    // Altrimenti mostra il testo normale
                    
                    return Text(
                      value.toInt().toString(),
                    
                      style: TextStyle(color: Colors.black, fontSize: 12, ),
                    );
                  },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 60,
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index < 0 || index >= regioni.length) return Container();
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                        child: Transform.rotate(
                          angle: -0.9, // -45 gradi in radianti (-pi/4)
                          child: Text(
                            regioni[index],
                            style: TextStyle(fontSize: 8),
                         ),
                        ),
                        )
                      );
                    },
                  ),
                ),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: FlGridData(show: true),
              borderData: FlBorderData(show: false),
              barTouchData: BarTouchData(enabled: true),
            ),
          ),
        ),
      ),
    );
  }
}
