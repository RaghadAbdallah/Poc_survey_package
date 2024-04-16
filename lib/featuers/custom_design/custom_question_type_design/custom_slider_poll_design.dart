import 'package:flutter/material.dart';
import '../widget/custom_thumb_widget.dart';

class CustomSliderPollDesign extends StatefulWidget {
  const CustomSliderPollDesign(
      {super.key,
      required this.questionDesc,
      required this.maxValue,
      required this.minValue,
      required this.stepValue,required this.answerStatus,required this.answerValue});

  final double maxValue;
  final double minValue;
  final double stepValue;
  final double answerValue;
  final String questionDesc;
  final int answerStatus;
  @override
  State<CustomSliderPollDesign> createState() => _CustomSliderPollDesignState();
}

class _CustomSliderPollDesignState extends State<CustomSliderPollDesign> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    if(widget.answerStatus==1){
      _sliderValue = widget.answerValue;
    }else{
      _sliderValue = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Center(
            child: SingleChildScrollView(
                child: Column(children: [
      Text(
        widget.questionDesc,
        style: const TextStyle(fontSize: 18,color: Colors.teal),
        textAlign: TextAlign.center,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width*0.04,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                gradient: LinearGradient(
                  colors: [
                    Colors.teal[200] ??  Colors.teal,
                    Colors.teal[400] ??  Colors.teal,
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  stops: const [0.0, 1.0],
                ),
              ),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTickMarkColor: Colors.cyan,
                  thumbShape: CustomThumbShape(
                    thumbRadius: 10,
                    thumbColor: Colors.white,
                    textColor: Colors.black,
                    textStyle: const TextStyle(color: Colors.black,fontSize: 8),
                    borderColor: Colors.cyan,
                    borderWidth: 1 ,
                  ),
                ),
                child: Slider.adaptive(
                  value: _sliderValue,
                  onChanged: (double value) {
                    if(widget.answerStatus==1){}else{ setState(() {
                      _sliderValue = value;
                    });}
                  },
                  min: widget.minValue,
                  max: widget.maxValue,
                  activeColor: Colors.white70,
                  divisions:
                      (widget.maxValue - widget.minValue) ~/ widget.stepValue,
                  label: _sliderValue.toString(),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'value: $_sliderValue',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black ,fontSize: 12),
              ),
            ),
            Row(
              children: [
                Text(
                  ' ${widget.minValue}',
                  style: const TextStyle(color: Colors.black ,fontSize: 12),
                ),
                const Spacer(),
                Text(
                  ' ${widget.maxValue}',
                  style: const TextStyle(color: Colors.black,fontSize: 12),
                ),
              ],
            )
          ],
        ),
      )
    ]))));
  }
}
