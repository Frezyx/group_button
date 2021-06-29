part of 'extensions.dart';

/// Make [MainAxisAlignment] from [MainGroupAlignment]
extension GroupToMainAxis on MainGroupAlignment {
  MainAxisAlignment toMainAxis() {
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
extension GroupToRunWrap on CrossGroupAlignment {
  CrossAxisAlignment toCrossAxis() {
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
