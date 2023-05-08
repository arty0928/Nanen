import 'package:flutter/material.dart';
import '../../constants/colors.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(327, 50),
  backgroundColor: softPurple,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
);

final ButtonStyle surveyButton1 = ElevatedButton.styleFrom(
  minimumSize: const Size(300, 100),
  backgroundColor: Colors.white,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
);

//mission에서 category 결정하는 버튼
class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: buttonPrimary,
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const ProgressPage()));
            },
            child: const Text('Show detail missions'),
          )
        ],
      ),
    );
  }
}
