import 'package:flutter/material.dart';
import 'package:nanen/src/constants/sizes.dart';
import 'package:nanen/src/features/core/screens/on_boarding/model/on_boarding_model.dart';

class MissionPageWidget extends StatelessWidget {
  final OnBoardingModel model;

  const MissionPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.2,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // Text(
          //   model.counterText,
          //   style: Theme.of(context).textTheme.headline6,
          // ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}
