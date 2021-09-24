import 'package:equb_flutter_challenge/models/debt.dart';
import 'package:equb_flutter_challenge/providers/debts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'indicator.dart';

class DebtChart extends StatelessWidget {
  const DebtChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Debts>(
      builder: (context, provider, child) {
        return provider.showDebt?SfCircularChart(
          // title: ChartTitle(text: "fds", alignment: ChartAlignment.near),
          legend: Legend(
            isVisible: true,
            position: LegendPosition.left,
            alignment: ChartAlignment.far,
            height: "100%",
            legendItemBuilder: (String name, dynamic series,
                dynamic point, int index) {
              return Indicator(
                index: index,
                color: provider.depts[index].color,
                text: "${provider.depts[index].bankName}",
                isSquare: false,
                // selectedIndex: selectedIndex,
                selectedIndex: context.watch<Debts>().selectedIndex,
              );
            },
            toggleSeriesVisibility: false,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          onLegendTapped: (LegendTapArgs args) {
            context.read<Debts>().selectIndex(args.pointIndex ?? 0);
          },
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              radius: '40%',
              widget: Container(
                child: PhysicalModel(
                  child: Container(),
                  shape: BoxShape.circle,
                  elevation: 0,
                  shadowColor: Colors.black,
                  color: const Color.fromRGBO(230, 230, 230, 1),
                ),
              ),
            ),
            CircularChartAnnotation(
              verticalAlignment: ChartAlignment.center,
              horizontalAlignment: ChartAlignment.center,
              widget: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ETB ${provider.depts[context.watch<Debts>().selectedIndex].deptAmount.round()}',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '${provider.depts[context.watch<Debts>().selectedIndex].bankName}',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          enableMultiSelection: false,
          series: <CircularSeries>[
            DoughnutSeries<Debt, String>(
              dataSource: provider.depts,
              explodeIndex: context.watch<Debts>().selectedIndex,
              explode: true,
              explodeAll: false,
              groupMode: CircularChartGroupMode.value,
              groupTo: 2,
              onPointTap: (ChartPointDetails details) {
                // print(details.pointIndex);
                // print(details.seriesIndex);
                // setState(() {
                //   selectedIndex = details.pointIndex ?? 0;
                // });
                context
                    .read<Debts>()
                    .selectIndex(details.pointIndex ?? 0);
              },
              dataLabelMapper: (Debt d, int val) {
                return "${provider.percentValue(d.deptAmount).round()}%";
              },
              radius: '160%',
              innerRadius: '80%',
              explodeOffset: '20%',
              startAngle: -36,
              endAngle: -36,
              legendIconType: LegendIconType.circle,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
              ),
              pointColorMapper: (Debt data, _) => data.color,
              xValueMapper: (Debt data, _) => data.bankName,
              yValueMapper: (Debt data, _) =>
                  provider.percentValue(data.deptAmount).round(),
            ),
          ],
        ):Container();
      },
    );
  }
}
