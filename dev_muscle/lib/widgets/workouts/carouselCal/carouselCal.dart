import 'package:carousel_slider/carousel_slider.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';

final DateTime _currentDate = DateTime.now();

Map<String, String> month({required Months month, int? year}) {
  Map<String, String> map = {};
  var days = 31;
  switch (month) {
    case Months.february:
      days = 28;
      break;
    case Months.april:
    case Months.june:
    case Months.september:
    case Months.november:
      days = 30;
      break;
    default:
      days = 31;
      break;
  }
  year = year ?? _currentDate.year;

  if ((month.index + 1) == _currentDate.month && year == _currentDate.year) {
    days = _currentDate.day;
  }

  for (var day in List.generate(days, (index) => index + 1)) {
    map.addAll(
        {day.toString(): getDay(DateTime(year, month.index + 1, day).weekday)});
  }
  return map;
}

String getDay(int element) {
  switch (element % 7) {
    case 1:
      return "Monday";
    case 2:
      return "Tuesday";
    case 3:
      return "Wednesday";
    case 4:
      return "Thursday";
    case 5:
      return "Friday";
    case 6:
      return "Saturday";
    default:
      return "Sunday";
  }
}

enum Months {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december,
}

extension on Months {
  String string() {
    return toString().split('.').last;
  }

  String capitalized() {
    List<String> separate = string().split(RegExp(r"(?=[A-Z])"));
    String labelMerge = "";

    for (var la in separate) {
      labelMerge += "${la.capitalize()} ";
    }

    return labelMerge.trimRight();
  }
}

class carouselCal extends StatefulWidget {
  /// Specifies the spacing between the month and the weekdays
  final EdgeInsets? monthSelectorMargin;
  final EdgeInsets? weekdayMargin;
  final Function(DateTime) onChanged;
  final WeekdayAbbreviation weekdayAbb;
  final Color? selectedColor,
      unselectedColor,
      selectedTextColor,
      unselectedTextColor;
  final double? dayCarouselHeight;
  final DateTime? firstDate, lastDate;
  final bool showYearAlways;
  final DateTime? value;

  carouselCal({
    Key? key,
    required this.onChanged,
    this.monthSelectorMargin,
    this.weekdayMargin,
    this.weekdayAbb = WeekdayAbbreviation.three,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.dayCarouselHeight,
    this.firstDate,
    this.lastDate,
    this.showYearAlways = false,
    this.value,
  }) : super(key: key);

  @override
  State<carouselCal> createState() => _carouselCalState();
}

class _carouselCalState extends State<carouselCal> {
  /// The Value here should be the initial page index of the carousel
  int selectedDay = 10; // cannot be zero
  int selectedMonth = 12; // ranges between 1 - 12
  int? selectedYear;

  final CarouselController monthCarouselController = CarouselController();
  final CarouselController dayCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();

    if (mounted) {
      setState(() {
        selectedDay = widget.value?.day ?? _currentDate.day;
        selectedMonth = widget.value?.month ?? _currentDate.month;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Container(
            margin: widget.monthSelectorMargin,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          selectDate(context,
                                  firstDate: widget.firstDate,
                                  lastDate: widget.lastDate)
                              .then((value) {
                            setState(() {
                              selectedYear = selectedYear != _currentDate.year
                                  ? value?.year
                                  : null;
                              selectedMonth = value?.month ?? 1;
                              selectedDay = value?.day ?? 1;

                              monthCarouselController
                                  .animateToPage(selectedMonth - 1);
                              dayCarouselController
                                  .animateToPage(selectedDay - 1);
                            });
                          });
                        },
                        child: CarouselSlider.builder(
                            carouselController: monthCarouselController,
                            itemCount: selectedYear == _currentDate.year ||
                                    selectedYear == null
                                ? _currentDate.month
                                : Months.values.length,
                            itemBuilder: (context, index, realIndex) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  Months.values[index].capitalized() +
                                      (selectedYear != null
                                          ? " $selectedYear"
                                          : (widget.showYearAlways
                                              ? ' ${DateTime.now().year}'
                                              : '')),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                height: 40,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                initialPage: selectedMonth - 1,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                viewportFraction: 0.8,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    selectedMonth = index + 1;
                                  });
                                  // widget.onChanged(currentDate);
                                })),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    left: 0.0,
                    child: IconButton(
                      color: calUnselected_color,
                      onPressed: () {
                        monthCarouselController.previousPage();
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 32,
                        color: Colors.white,
                      ),
                    )),
                Positioned(
                    right: 0.0,
                    child: IconButton(
                      onPressed: () {
                        monthCarouselController.nextPage();
                      },
                      color: calUnselected_color,
                      icon: const Icon(
                        Icons.chevron_right,
                        size: 32,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: widget.dayCarouselHeight ?? 70,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: month(
                      month: Months.values[selectedMonth - 1],
                      year: selectedYear)
                  .length,
              itemBuilder: (context, index, realIndex) {
                bool isCurrent = (selectedDay - 1) == realIndex;
                return Wrap(
                  children: [
                    Container(
                      constraints:
                          const BoxConstraints(minHeight: 60, minWidth: 40),
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: isCurrent
                            ? widget.selectedColor ??
                                Theme.of(context).primaryColor
                            : widget.unselectedColor ?? Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: widget.weekdayMargin ?? EdgeInsets.zero,
                            child: Text(
                              month(
                                      month: Months.values[selectedMonth - 1],
                                      year: selectedYear)
                                  .values
                                  .elementAt(index)
                                  .substring(0, 1),
                              style: TextStyle(
                                color: isCurrent
                                    ? widget.selectedTextColor ?? Colors.white
                                    : widget.unselectedTextColor ??
                                        const Color(0xFFBCC1CD),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              month(
                                      month: Months.values[selectedMonth - 1],
                                      year: selectedYear)
                                  .keys
                                  .elementAt(index),
                              style: TextStyle(
                                color: isCurrent
                                    ? widget.selectedTextColor ?? Colors.white
                                    : widget.unselectedTextColor ??
                                        const Color(0xFFBCC1CD),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              carouselController: dayCarouselController,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: selectedDay - 1,
                  aspectRatio: 9 / 16,
                  viewportFraction: 0.15,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      selectedDay = index + 1;
                    });
                    widget.onChanged(DateTime(selectedYear ?? _currentDate.year,
                        selectedMonth, selectedDay));
                  }),
              // items: imageSliders,
            ),
          )
        ],
      ),
    );
  }
}

Future<DateTime?> selectDate(BuildContext context,
    {DateTime? firstDate, DateTime? lastDate}) async {
  // final DateTime? picked =
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    initialDatePickerMode: DatePickerMode.day,
    firstDate: firstDate ?? DateTime(2020),
    lastDate: lastDate ?? DateTime.now(),
  );
}

enum WeekdayAbbreviation {
  one,
  two,
  three,
  full,
}

extension on WeekdayAbbreviation {
  int? get length {
    switch (this) {
      case WeekdayAbbreviation.one:
        return 1;
      case WeekdayAbbreviation.two:
        return 2;
      case WeekdayAbbreviation.three:
        return 3;
      case WeekdayAbbreviation.full:
        return null;
    }
  }
}

extension StringCasingExtension on String {
  String capitalize() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
