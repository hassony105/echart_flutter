import 'package:collection/collection.dart';
import 'package:echart_flutter/echart_flutter.dart';
import 'package:example/util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Sample1 extends StatelessWidget {
  const Sample1({Key? key}) : super(key: key);

  List<List<LineChartSpot>> get spotsList => [
    [
      const LineChartSpot(0.0, 3.7806739187454177),
      const LineChartSpot(1.0, 3.5991452613605475),
      const LineChartSpot(2.0, 2.6534102643618773),
      const LineChartSpot(3.0, 3.495803225491705),
      const LineChartSpot(4.0, 3.2687418283157106),
    ], [
      const LineChartSpot(0.0, 7.748415631185418),
      const LineChartSpot(1.0, 6.876026011448352),
      const LineChartSpot(2.0, 7.62484251992211),
      const LineChartSpot(3.0, 8.320701383214557),
      const LineChartSpot(4.0, 8.34446381632569),
    ], [
      const LineChartSpot(0.0, 1.8119931114678556),
      const LineChartSpot(1.0, 2.119198907823737),
      const LineChartSpot(2.0, 2.907415228279169),
      const LineChartSpot(3.0, 2.0087045168815028),
      const LineChartSpot(4.0, 2.675884068457985),
    ],[
      const LineChartSpot(0.0, 3.4873266523791857),
      const LineChartSpot(1.0, 4.446586791105186),
      const LineChartSpot(2.0, 4.223622629086266),
      const LineChartSpot(3.0, 4.191570249574648),
      const LineChartSpot(4.0, 4.7799742234986695),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    DateFormat outputFormat = DateFormat('yy-MM-dd');
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: LineChart(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  data: LineChartData(
                    lineBarsData: spotsList
                        .map((spots) =>
                        LineChartBarData(
                          spots: spots,
                          color: index % 2 == 0 ? Colors.orange : Colors.cyan,
                          point: const LineChartPoint(
                            type: LineChartPointType.circle,
                          ),
                        ))
                        .toList(),
                    area: const LineChartArea(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    runSpacing: 4,
                    children: spotsList.first
                        .sublist(1, 4)
                        .mapIndexed(
                          (index, spot) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                outputFormat.format(
                                  DateTime(today.year, today.month,
                                      today.day - 5 + spot.x.toInt() + 1),
                                ),
                              ),
                              Text(spot.y.toStringAsFixed(2)),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
