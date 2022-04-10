import 'dart:math';

import 'package:page_transition/page_transition.dart';

PageTransitionType getRandomTransition() {
  final _random = Random();
  int index = _random.nextInt(transitionList.length - 1);
  return transitionList[index];
}

List<PageTransitionType> transitionList = [
  PageTransitionType.fade,
  PageTransitionType.rightToLeft,
  PageTransitionType.topToBottom,
  PageTransitionType.bottomToTop,
  PageTransitionType.rotate,
];
