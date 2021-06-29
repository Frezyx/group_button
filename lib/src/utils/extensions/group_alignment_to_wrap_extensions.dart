part of 'extensions.dart';

/// Make [MainAxisAlignment] from [MainGroupAlignment]
extension GroupToMainWrap on MainGroupAlignment {
  WrapAlignment toMainWrap() {
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

/// Make [CrossAxisAlignment] from [CrossGroupAlignment]
extension GroupToRunWrap on CrossGroupAlignment {
  WrapCrossAlignment toCrossAxis() {
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
