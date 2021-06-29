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
extension GroupToRunWrap on CrossGroupAlignment {
  WrapCrossAlignment toWrapp() {
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
