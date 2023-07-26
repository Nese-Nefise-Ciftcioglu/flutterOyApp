import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _sum = 0;

  void _updateSum(int value) {
    setState(() {
      _sum += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Seçim 2023 Çetele Tablosu"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Padding(
                padding: EdgeInsets.only(top: 16.0.h), // Added padding at the bottom
                child: Text(
                  "TOPLAM OY SAYISI",
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                _sum.toString(),
                style: TextStyle(
                  fontSize: 32.0.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              PresidentCard(
                title: "Recep Tayyip Erdoğan",
                color: Colors.amber,
                onValueChanged: _updateSum,
                width: 180.w,
                height: 200.h,
                titleFont: 16.0.sp,
                valueFont: 64.0.sp,
                buttonSizeH: 58,
                buttonSizeW: 58,
              ),


                PresidentCard(
                  title: "Kemal Kılıçdaroğlu",
                  color: Colors.red.shade800,
                  onValueChanged: _updateSum,
                  width: 180.w,
                  height: 200.h,
                  titleFont: 16.0.sp,
                  valueFont: 64.0.sp,
                  buttonSizeH: 58,
                  buttonSizeW: 58,
                ),

              PresidentCard(
                  title: "Geçersiz Oylar",
                  color: Theme.of(context).primaryColor,
                  onValueChanged: _updateSum,
                  width: 180.w,
                  height: 140.h,
                titleFont: 15.0.sp,
                valueFont: 38.0.sp,
                buttonSizeH: 42,
                buttonSizeW: 42,

              ),

      ],
           ),
        ),
      ),
    );
  }
}

class PresidentCard extends StatefulWidget {
  const PresidentCard({
    Key? key,
    required this.title,
    required this.color,
    required this.onValueChanged, required this.width, required this.height, required this.titleFont, required this.valueFont,  required this.buttonSizeH, required this.buttonSizeW,
  }) : super(key: key);

  final String title;
  final Color color;
  final void Function(int value) onValueChanged;
  final double width;
  final double height;
  final double titleFont;
  final double valueFont;
  final double buttonSizeH;
  final double buttonSizeW;

  @override
  _PresidentCardState createState() => _PresidentCardState();
}

class _PresidentCardState extends State<PresidentCard> {
  int _counter = 0;

  void _incrementValue() {
    setState(() {
      _counter++;
      widget.onValueChanged(1);
    });
  }

  void _decrementValue() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        widget.onValueChanged(-1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.sp),
        color: widget.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: widget.titleFont, //16
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            _counter.toString(),
            style: TextStyle(
              fontSize: widget.valueFont, //64
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                icon: Icons.remove,
                onPressed: _decrementValue,
                buttonSizeH: widget.buttonSizeH.h,
                buttonSizeW: widget.buttonSizeW.w,

              ),
              SizedBox(width: 32.0.w), // Added padding between buttons
              Button(
                icon: Icons.add,
                onPressed: _incrementValue,
                buttonSizeH: widget.buttonSizeH.h,
                buttonSizeW: widget.buttonSizeW.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.icon,
    required this.onPressed, required this.buttonSizeH, required this.buttonSizeW,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;
  final double buttonSizeH;
  final double buttonSizeW;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0.sp),
      ),
      fillColor: Colors.white,
      constraints: BoxConstraints.tightFor(
        height: buttonSizeH, //58
        width: buttonSizeW,
      ),
      elevation: 6,
      child: Icon(
        icon,
        size: 30.sp,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

