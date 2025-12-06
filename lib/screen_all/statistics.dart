import 'package:calories_app/styles/app_sttles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import '../styles/app_colores.dart';


class Statistics extends StatefulWidget {
  final List<Map<String, dynamic>> dailyMeals;

  const Statistics({
    super.key,
    required this.dailyMeals,
  });

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int touchedIndex = -1;

  int _breakfastCals = 0;
  int _lunchCals = 0;
  int _dinnerCals = 0;
  int _snacksCals = 0;
  int _totalCals = 0;

  @override
  void initState() {
    super.initState();
    _calculateDailyTotals(widget.dailyMeals);
  }

  @override
  void didUpdateWidget(covariant Statistics oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.dailyMeals != oldWidget.dailyMeals) {
      _calculateDailyTotals(widget.dailyMeals);
    }
  }

  void _calculateDailyTotals(List<Map<String, dynamic>> meals) {
    int tempBreakfastCals = 0;
    int tempLunchCals = 0;
    int tempDinnerCals = 0;
    int tempSnacksCals = 0;

    for (var meal in meals) {
      final String? mealTypeRaw = (meal['type'] as String?)?.trim();
      final int calories = (meal['calories'] as num?)?.toInt() ?? 0;

      if (mealTypeRaw != null) {
        final String mealTypeCleaned = mealTypeRaw.replaceAll(' ', '').toLowerCase();

        switch (mealTypeCleaned) {
          case 'فطور':
            tempBreakfastCals += calories;
            break;
          case 'غداء':

            tempLunchCals += calories;
            break;
          case 'عشاء':
            tempDinnerCals += calories;
            break;
          case 'وجبةخفيفة':
            tempSnacksCals += calories;
            break;
        }
      }
    }

    final int total =
        tempBreakfastCals + tempLunchCals + tempDinnerCals + tempSnacksCals;

    if (mounted) {
      setState(() {
        _breakfastCals = tempBreakfastCals;
        _lunchCals = tempLunchCals;
        _dinnerCals = tempDinnerCals;
        _snacksCals = tempSnacksCals;
        _totalCals = total;
      });
      debugPrint('STATISTICS: Daily totals updated. TOTAL: $_totalCals');
    }
  }


  List<PieChartSectionData> showingSections(double baseSize) {
    if (_totalCals == 0) {
      return [
        PieChartSectionData(
          color: Colors.grey.shade300,
          value: 100,
          title: 'لا توجد بيانات',
          radius: baseSize * 0.28,
          titleStyle: Appstyles.gruy12w500style.copyWith(color: Colors.black),
        ),
      ];
    }

    double percent(int calories) =>
        (_totalCals == 0) ? 0.0 : (calories / _totalCals) * 100;

    final List<Map<String, dynamic>> sectionsData = [
      {
        'title': 'الفطور',
        'value': percent(_breakfastCals),
        'calories': _breakfastCals,
        'color': Colors.blue.shade700,
      },
      {
        'title': 'الغداء',
        'value': percent(_lunchCals),
        'calories': _lunchCals,
        'color': Colors.amber.shade700,
      },
      {
        'title': 'العشاء',
        'value': percent(_dinnerCals),
        'calories': _dinnerCals,
        'color': Colors.deepPurple.shade700,
      },
      {
        'title': 'وجبات خفيفة',
        'value': percent(_snacksCals),
        'calories': _snacksCals,
        'color': Colors.green.shade700,
      },
    ];

    final double normalRadius = baseSize * 0.18;
    final double touchedRadius = baseSize * 0.21;

    return sectionsData.asMap().entries.map((entry) {
      final i = entry.key;
      final data = entry.value;
      final double value = (data['value'] as double);

      if (value <= 0) return PieChartSectionData(value: 0);

      final bool isTouched = i == touchedIndex;
      final double radius = isTouched ? touchedRadius : normalRadius;

      final String titleText = '${value.toStringAsFixed(1)}%';

      return PieChartSectionData(
        color: data['color'] as Color,
        value: value,
        title: titleText,
        radius: radius,
        titleStyle: Appstyles.secondaryStyle.copyWith(
          fontSize: isTouched ? 18 : 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        // no badgeWidget
      );
    }).toList();
  }

  Widget _buildIndicatorCard(
      String title,
      int calories,
      Color color,
      double percent,
      ) {
    if (calories == 0) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: color.withOpacity(0.25), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Appstyles.secondaryStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${percent.toStringAsFixed(1)}%',
                style: Appstyles.secondaryStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            '${calories} سعرة حرارية',
            style: Appstyles.gruy12w500style.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicators() {
    final List<Map<String, dynamic>> sectionsData = [
      {
        'title': 'الفطور',
        'calories': _breakfastCals,
        'color': Colors.blue.shade700,
      },
      {
        'title': 'الغداء',
        'calories': _lunchCals,
        'color': Colors.amber.shade700,
      },
      {
        'title': 'العشاء',
        'calories': _dinnerCals,
        'color': Colors.deepPurple.shade700,
      },
      {
        'title': 'وجبات خفيفة',
        'calories': _snacksCals,
        'color': Colors.green.shade700,
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: sectionsData.map((data) {
          final int calories = data['calories'] as int;
          final double percent =
          _totalCals > 0 ? calories / _totalCals * 100 : 0.0;

          return _buildIndicatorCard(
            data['title'] as String,
            calories,
            data['color'] as Color,
            percent,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTotalCaloriesCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Appcolores.primrecolor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Appcolores.primrecolor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إجمالي السعرات الحرارية اليومية',
            style: Appstyles.secondaryStyle.copyWith(
              fontSize: 16.sp,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$_totalCals',
                style: Appstyles.primtexsty.copyWith(
                  fontSize: 36.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'سعرة',
                style: Appstyles.secondaryStyle.copyWith(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),
              Text(
                'الإحصائيات والتحليلات',
                style: Appstyles.primtexsty.copyWith(fontSize: 24.sp),
              ),
              SizedBox(height: 16.h),

              _buildTotalCaloriesCard(),

              Container(
                constraints: BoxConstraints(minHeight: 300.h),
                width: double.infinity,
                padding: EdgeInsets.all(14.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'توزيع السعرات حسب الوجبة',
                      style: Appstyles.secondaryStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final double baseSize =
                            (constraints.maxHeight < constraints.maxWidth
                                ? constraints.maxHeight
                                : constraints.maxWidth) *
                                0.95;
                        final double centerSpace = baseSize * 0.18;
                        return Center(
                          child: SizedBox(
                            height: baseSize,
                            width: baseSize,
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                  touchCallback: (
                                      FlTouchEvent event,
                                      pieTouchResponse,
                                      ) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex =
                                          pieTouchResponse
                                              .touchedSection!
                                              .touchedSectionIndex;
                                    });
                                  },
                                ),
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 0,
                                centerSpaceRadius: centerSpace,
                                sections: showingSections(baseSize),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              Text(
                'تفاصيل توزيع الوجبات',
                style: Appstyles.secondaryStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 12.h),
              _buildIndicators(),
            ],
          ),
        ),
      ),
    );
  }
}