import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/view_model/slider_view_model.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    print('line 15');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<SliderViewModel>(
          builder: (_, controller, __) {
            return Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  color: Colors.blue.withValues(alpha: controller.sliderValue),
                ),
                Slider(
                  value: controller.sliderValue,
                  onChanged: (value) {
                    controller.sliderValueChange(value);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
