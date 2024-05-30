import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircleParts extends StatelessWidget {
  String label;
  double val;
  double max;
  CircleParts(
      {super.key, required this.label, required this.val, required this.max});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            showTicks: false,
            minimum: 0,
            maximum: max,
            startAngle: 270,
            endAngle: 270,
            axisLineStyle: AxisLineStyle(
              color: button_color,
            ),
            pointers: [
              RangePointer(
                value: val,
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
                      val.toStringAsFixed(0) + " Gr",
                      style: TextStyles.WorkoutsPartsTextStyle(),
                    ),
                    Text(
                      label,
                      style: TextStyles.WorkoutsPartsSubtitleTextStyle(),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
