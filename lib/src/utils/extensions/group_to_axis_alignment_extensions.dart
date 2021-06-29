import 'package:flutter/material.dart';
import 'package:group_button/src/utils/utils.dart';

/// Make [MainAxisAlignment] from [MainGroupAlignment]
extension GroupToMainAxis on MainGroupAlignment {
  MainAxisAlignment toAxis() {
    switch (this) {
      case MainGroupAlignment.center:
        return MainAxisAlignment.center;
      case MainGroupAlignment.end:
        return MainAxisAlignment.end;
      case MainGroupAlignment.start:
        return MainAxisAlignment.start;
      case MainGroupAlignment.spaceAround:
        return MainAxisAlignment.spaceAround;
      case MainGroupAlignment.spaceBetween:
        return MainAxisAlignment.spaceBetween;
      case MainGroupAlignment.spaceEvenly:
        return MainAxisAlignment.spaceEvenly;
    }
  }
}

/// Make [CrossAxisAlignment] from [CrossGroupAlignment]
extension GroupToRunAxis on CrossGroupAlignment {
  CrossAxisAlignment toAxis() {
    switch (this) {
      case CrossGroupAlignment.center:
        return CrossAxisAlignment.center;
      case CrossGroupAlignment.end:
        return CrossAxisAlignment.end;
      case CrossGroupAlignment.start:
        return CrossAxisAlignment.start;
    }
  }
}
