# group_button

[![Build Status](https://travis-ci.com/Frezyx/group_button.svg?branch=master)](https://travis-ci.com/Frezyx/group_button) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Pub](https://img.shields.io/pub/v/group_button.svg)](https://pub.dartlang.org/packages/group_button)
![Stars](https://img.shields.io/github/stars/Frezyx/group_button?style=social)

Flutter custom widget to make a group buttons.<br>
Included Radio and CheckBox buttons models.<br>
[pub package](https://pub.dev/packages/group_button)

<img src="https://github.com/Frezyx/group_button/blob/master/example/rep_files/preview.gif?raw=true" width="270">

## Getting Started
Follow these steps to use this package

### Add dependency

```yaml
dependencies:
  group_button: ^2.0.0 #latest version
```

### Add import package

```dart
import 'package:group_button/group_button.dart';
```

### Easy to use
Simple example of use GroupButton<br>
Put this code in your project at an screen and learn how it works 😊

```dart
GroupButton(
    isRadio: false,
    spacing: 10,
    onSelected: (index, isSelected) => print('$index button is selected'),
    buttons: ["12:00", "13:00", "14:30", "18:00", "19:00", "21:40"],
)
```

### Customize

In order to customize your buttons inside *GroupButton* you can use code below</br>
This code includes *all* the fields used in *GroupButton*

```dart
GroupButton(
    spacing: 5,
    isRadio: false,
    direction: Axis.horizontal,
    onSelected: (index, isSelected) =>
          print('$index button is ${isSelected ? 'selected' : 'unselected'}'),
    buttons: ["Dart","Kotlin","Java","Swift","Objective-C","Python","JS"],
    selectedButtons: ["Dart","Kotlin"],
    selectedTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.red,
    ),
    unselectedTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.grey[600],
    ),
    selectedColor: Colors.white,
    unselectedColor: Colors.grey[300],
    selectedBorderColor: Colors.red,
    unselectedBorderColor: Colors.grey[500],
    borderRadius: BorderRadius.circular(5.0),
    selectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
    unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
)
```

### Attributes

| Attribute  | Annotation |
| ------------- | ------------- |
| buttons | [String] list that will be displayed on buttons in the [GroupButton] |
| selectedButtons | [String] list that will be set initial selected buttons in the [GroupButton] |
| onSelected  | Callback [Function] works by clicking on a group element <br> Return int [index] of selected button and [isSelected] if [isRadio] = false |
| isRadio | bool variable for switching between modes [ChackBox] and [Radio]<br>if the [isRadio] = true, only one button can be selected<br>if the [isRadio] = false, you can select several at once |
| direction | The direction of arrangement of the buttons in [GroupButton] |
| spacing | The spacing between buttons inside [GroupButton] |
| selectedTextStyle | [TextStyle] of text of selected button(s) |
| unselectedTextStyle | [TextStyle] of text of unselected buttons |
| selectedColor | background [Color] of selected button(s) |
| unselectedColor | background [Color] of  unselected buttons |
| selectedBorderColor | border [Color] of selected button(s) |
| unselectedBorderColor | border [Color] of  unselected buttons |
| borderRadius | [BorderRadius] of  buttons<br>How much the button will be rounded |
| selectedShadow | list of selected button(s) [BoxShadow] |
| unselectedShadow| list of unselected buttons [BoxShadow] |



For help getting started with 😍 Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


