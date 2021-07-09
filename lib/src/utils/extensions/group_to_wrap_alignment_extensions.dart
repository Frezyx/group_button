import 'package:flutter/material.dart';
import 'package:group_button/src/utils/utils.dart';

/// Make [WrapAlignment] from [MainGroupAlignment]
extension GroupToMainWrap on MainGroupAlignment {
  WrapAlignment toWrap() {
    switch (this) {
      case MainGroupAlignment.center:
        return WrapAlignment.center;
      case MainGroupAlignment.end:
        return WrapAlignment.end;
      case MainGroupAlignment.start:
        return WrapAlignment.start;
      case MainGroupAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case MainGroupAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case MainGroupAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }
}

/// Make [WrapCrossAlignment] from [CrossGroupAlignment]
extension GroupToCrossWrap on CrossGroupAlignment {
  WrapCrossAlignment toWrap() {
    switch (this) {
      case CrossGroupAlignment.center:
        return WrapCrossAlignment.center;
      case CrossGroupAlignment.end:
        return WrapCrossAlignment.end;
      case CrossGroupAlignment.start:
        return WrapCrossAlignment.start;
    }
  }
}

/// Make [WrapAlignment] from [GroupRunAlignment]
extension GroupToRunWrap on GroupRunAlignment {
  WrapAlignment toWrap() {
    switch (this) {
      case GroupRunAlignment.center:
        return WrapAlignment.center;
      case GroupRunAlignment.end:
        return WrapAlignment.end;
      case GroupRunAlignment.start:
        return WrapAlignment.start;
      case GroupRunAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case GroupRunAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case GroupRunAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }
}
