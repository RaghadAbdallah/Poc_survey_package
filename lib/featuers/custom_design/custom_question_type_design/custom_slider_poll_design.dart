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
              height: 35,
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
                  activeTickMarkColor: Colors.orange,
                  thumbShape: CustomThumbShape(
                    thumbRadius: 15,
                    thumbColor: Colors.white,
                    textColor: Colors.black,
                    textStyle: const TextStyle(color: Colors.black),
                    borderColor: Colors.orange,
                    borderWidth: 1.5,
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
                  activeColor: Colors.white,
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
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Row(
              children: [
                Text(
                  ' ${widget.minValue}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Spacer(),
                Text(
                  ' ${widget.maxValue}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            )
          ],
        ),
      )
    ]))));
  }
}
