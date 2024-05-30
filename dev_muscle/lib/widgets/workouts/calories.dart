import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Calories extends StatefulWidget {
  double calValue;
  double maxValue;
  Calories({super.key, required this.calValue, required this.maxValue});

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            showTicks: false,
            minimum: 0,
            maximum: widget.maxValue,
            startAngle: 270,
            endAngle: 270,
            axisLineStyle: AxisLineStyle(
              color: button_color,
            ),
            pointers: [
              RangePointer(
                value: widget.calValue,
                color: button_color,
                gradient: SweepGradient(
                  colors: [
                    GradientsFirst_color,
                    GradientsSec_color,
                  ],
                ),
              ),
            ],
            annotations: [
              GaugeAnnotation(
                angle: 90,
                positionFactor: 0.8,
                widget: Column(
                  children: [
                    Text(
                      widget.calValue.toStringAsFixed(0) + " Cal",
                      style: TextStyles.WorkoutsCalTextStyle(),
                    ),
                    Text(
                      "Active Calories",
                      style: TextStyles.WorkoutsCalSubtitleTextStyle(),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
