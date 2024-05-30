// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class myIndicator extends StatefulWidget {
  int selectedIndex;
  Function(int) onItemTapped;
  myIndicator(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<myIndicator> createState() => _myIndicatorState();
}

class _myIndicatorState extends State<myIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: widget.selectedIndex,
      onDotClicked: widget.onItemTapped,
      count: 3,
      effect: const ExpandingDotsEffect(
        activeDotColor: Color(0xFFD0FD3E),
        dotHeight: 4,
      ),
    );
  }
}
