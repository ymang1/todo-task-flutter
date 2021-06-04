import 'dart:math';
import 'package:flutter/material.dart';

/*
Custom widget for page view dots indicator
 - controller: page controller reference
 - itemCount: total number of items in page view
 - onPageSelected: action on dot indicator
 - color: dot indicator color
 */
class DotsIndicator extends AnimatedWidget {
  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged < int > onPageSelected;

  /// The color of the dots.
  final Color color;

  /// The base size of the dots
  static const double _kDotSize = 8.0;

  /// The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  /// The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  DotsIndicator( {
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color:Colors.black,
  }):super(listenable:controller);

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children:List < Widget > .generate(itemCount, _buildDot),
    );
  }

/*
Custon widget for dots indicator styling
 */
  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page??controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return Container(
      width:_kDotSpacing,
      child:Center(
        child:Material(
          color:color,
          type:MaterialType.circle,
          child:Container(
            width:_kDotSize * zoom,
            height:_kDotSize * zoom,
            child:InkWell(
              onTap:() => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }
}