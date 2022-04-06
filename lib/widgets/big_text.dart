import 'package:flutter/cupertino.dart';
import 'package:idr_corner/utils/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  TextOverflow overFlow;
  double size;

  BigText(
      //parameter untuk text
      {Key? key,
      this.color = const Color(0xFF332d2d),
      required this.text,
      this.size = 20,
      this.overFlow = TextOverflow
          .ellipsis //ini buat text yang lebih nanti jadi titik-titik
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1, //jadi untuk membatasi maksimal paragraf di text
      overflow: overFlow,
      style: TextStyle(
          fontSize: size == 0 ? Dimensions.font20 : size,
          color: color,
          fontWeight: FontWeight.w400),
    );
  }
}
