import 'package:flutter/material.dart';
import 'package:onfinance/ui/style/app_color.dart';

class ContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColor().boxGrey
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0011351, size.height * -0.0028372);
    path0.lineTo(size.width * 0.0005135, size.height * 0.9586977);
    path0.lineTo(size.width * 0.0597027, size.height * 0.9923488);
    path0.lineTo(size.width * 0.9322432, size.height * 0.9908837);
    path0.lineTo(size.width * 0.9928919, size.height * 0.9624186);
    path0.lineTo(size.width * 0.9937568, size.height * 0.0004419);
    path0.quadraticBezierTo(size.width * 0.7114865, size.height * 0.0017442,
        size.width * 0.0011351, size.height * -0.0028372);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TopPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0100000);
    path0.lineTo(size.width * 0.0331026, size.height);
    path0.lineTo(size.width * 0.9635897, size.height);
    path0.lineTo(size.width * 0.9974359, size.height * 0.0100000);
    path0.lineTo(0, size.height * 0.0100000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BasePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColor().baseColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height * 0.9758980);
    path0.lineTo(size.width * 0.0498974, size.height * 0.9994678);
    path0.lineTo(size.width * 0.9487179, size.height * 0.9977827);
    path0.lineTo(size.width, size.height * 0.9778049);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
