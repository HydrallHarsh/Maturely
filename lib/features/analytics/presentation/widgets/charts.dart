import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../domain/entities/portfolio_analytics.dart';

class BankDistributionChart extends StatelessWidget {
  final List<BankDistribution> banks;
  final double size;

  const BankDistributionChart({
    Key? key,
    required this.banks,
    this.size = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (banks.isEmpty) {
      return SizedBox(
        height: size,
        child: Center(
          child: Text(
            'No data available',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: size,
      child: PieChart(
        PieChartData(
          sectionsSpace: 2,
          centerSpaceRadius: size * 0.2,
          sections: banks.map((bank) => PieChartSectionData(
            color: _parseColor(bank.color),
            value: bank.percentage,
            title: '${bank.percentage.toStringAsFixed(1)}%',
            radius: size * 0.3,
            titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )).toList(),
        ),
      ),
    );
  }

  Color _parseColor(String colorString) {
    try {
      if (colorString.startsWith('#')) {
        return Color(int.parse(colorString.substring(1), radix: 16) + 0xFF000000);
      }
      return Colors.blue;
    } catch (e) {
      return Colors.blue;
    }
  }
}

class MonthlyTrendChart extends StatelessWidget {
  final List<MonthlyTrend> trends;
  final double height;

  const MonthlyTrendChart({
    Key? key,
    required this.trends,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (trends.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            'No trend data available',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    final maxY = trends.map((t) => t.cumulativeAmount).reduce((a, b) => a > b ? a : b);
    final minX = 0.0;
    final maxX = trends.length.toDouble() - 1;

    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            minX: minX,
            maxX: maxX,
            minY: 0,
            maxY: maxY * 1.1,
            lineBarsData: [
              LineChartBarData(
                spots: trends.asMap().entries.map((entry) {
                  return FlSpot(entry.key.toDouble(), entry.value.cumulativeAmount);
                }).toList(),
                isCurved: true,
                color: Theme.of(context).primaryColor,
                barWidth: 3,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(
                  show: true,
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                ),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 60,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '₹${(value / 1000).toStringAsFixed(0)}K',
                      style: const TextStyle(fontSize: 10),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    if (index >= 0 && index < trends.length) {
                      final month = trends[index].month;
                      return Text(
                        '${month.month}/${month.year.toString().substring(2)}',
                        style: const TextStyle(fontSize: 10),
                      );
                    }
                    return const Text('');
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: maxY / 5,
            ),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}

class StatusDistributionChart extends StatelessWidget {
  final List<StatusDistribution> statuses;
  final double size;

  const StatusDistributionChart({
    Key? key,
    required this.statuses,
    this.size = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (statuses.isEmpty) {
      return SizedBox(
        height: size,
        child: Center(
          child: Text(
            'No status data available',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: size,
      child: PieChart(
        PieChartData(
          sectionsSpace: 1,
          centerSpaceRadius: size * 0.25,
          sections: statuses.map((status) => PieChartSectionData(
            color: _parseColor(status.color),
            value: status.percentage,
            title: '${status.count}',
            radius: size * 0.25,
            titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )).toList(),
        ),
      ),
    );
  }

  Color _parseColor(String colorString) {
    try {
      if (colorString.startsWith('#')) {
        return Color(int.parse(colorString.substring(1), radix: 16) + 0xFF000000);
      }
      return Colors.blue;
    } catch (e) {
      return Colors.blue;
    }
  }
}

class ChartLegend extends StatelessWidget {
  final List<ChartDataPoint> items;
  final bool isHorizontal;

  const ChartLegend({
    Key? key,
    required this.items,
    this.isHorizontal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = items.map((item) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: _parseColor(item.color),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              item.label,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (item.subtitle.isNotEmpty) ...[
            const SizedBox(width: 4),
            Text(
              '(${item.subtitle})',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ],
      ),
    )).toList();

    if (isHorizontal) {
      return Wrap(
        children: children,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    }
  }

  Color _parseColor(String colorString) {
    try {
      if (colorString.startsWith('#')) {
        return Color(int.parse(colorString.substring(1), radix: 16) + 0xFF000000);
      }
      return Colors.blue;
    } catch (e) {
      return Colors.blue;
    }
  }
}
