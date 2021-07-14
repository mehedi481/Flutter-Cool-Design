import 'package:flutter/material.dart';
import 'package:mehedi_pattern/helpers/size_config/size_config.dart';

class GlowingButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  const GlowingButton(
      {Key? key, this.color1 = Colors.cyan, this.color2 = Colors.greenAccent})
      : super(key: key);

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  bool isGlowing = false;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    //TODO: If Mobile then use GestureDetector.This is for Web. 
    return MouseRegion(
      onExit:(val) {
        setState(() {
          isGlowing = false;
          scale = 1.0;
        });
      },
      onEnter: (val) {
        setState(() {
          isGlowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: Duration(milliseconds: 100),
        height: 48,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(colors: [
              widget.color1,
              widget.color2,
            ]),
            boxShadow: isGlowing
                ? [
                    BoxShadow(
                        color: widget.color1.withOpacity(0.6),
                        blurRadius: 16,
                        spreadRadius: 1,
                        offset: Offset(-8, 0)),
                    BoxShadow(
                        color: widget.color2.withOpacity(0.6),
                        blurRadius: 16,
                        spreadRadius: 1,
                        offset: Offset(8, 0)),
                    BoxShadow(
                        color: widget.color1.withOpacity(0.2),
                        blurRadius: 32,
                        spreadRadius: 16,
                        offset: Offset(-8, 0)),
                    BoxShadow(
                        color: widget.color2.withOpacity(0.2),
                        blurRadius: 32,
                        spreadRadius: 16,
                        offset: Offset(8, 0)),
                  ]
                : []),
        child: Row(
          mainAxisAlignment: mainCenter,
          children: [
            Icon(
              isGlowing ? Icons.lightbulb : Icons.lightbulb_outline,
              color: Colors.white,
            ),
            Text(isGlowing ? "Glowing Button" : "Normal Button")
          ],
        ),
      ),
    );
  }
}
