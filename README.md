<div align="center">
  <img src="https://github.com/Frezyx/group_button/blob/master/example/rep_files/new/logo.svg?raw=true" width="400px">
</div>

<h2 align="center"> Flutter widget to create a group of buttons fast 🚀 </h2>

<p align="center">
Included Radio and CheckBox buttons models with custom groping types 🤤
   <br>
   <span style="font-size: 0.9em"> Show some ❤️ and <a href="https://github.com/Frezyx/group_button">star the repo</a> to support the project! </span>
</p>

<p align="center">
  <a href="https://pub.dev/packages/group_button"><img src="https://img.shields.io/pub/v/group_button.svg" alt="Pub"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/Frezyx/group_button"><img src="https://hits.dwyl.com/Frezyx/group_button.svg?style=flat" alt="Repository views"></a>
  <a href="https://github.com/Frezyx/group_button"><img src="https://img.shields.io/github/stars/Frezyx/group_button?style=social" alt="Pub"></a>
</p>
<p align="center">
  <a href="https://pub.dev/packages/group_button/score"><img src="https://img.shields.io/pub/likes/group_button?logo=flutter" alt="Pub likes"></a>
  <a href="https://pub.dev/packages/group_button/score"><img src="https://img.shields.io/pub/popularity/group_button?logo=flutter" alt="Pub popularity"></a>
  <a href="https://pub.dev/packages/group_button/score"><img src="https://img.shields.io/pub/points/group_button?logo=flutter" alt="Pub points"></a>
</p>

<br>



|    ![](https://github.com/Frezyx/group_button/blob/master/example/rep_files/new/e1.gif?raw=true)     |    ![](https://github.com/Frezyx/group_button/blob/master/example/rep_files/new/e2.gif?raw=true)     | ![](https://github.com/Frezyx/group_button/blob/master/example/rep_files/new/e3.gif?raw=true) |
| :------------------------------: | :------------------------------: | :------------------------------: |

| GroupButtonController | GroupButtonBuilder | GroupButtonOptions |
| :------------------------------: | :------------------------------: | :------------------------------: |


## Getting Started
Follow these steps to use this package

### Add dependency

```yaml
dependencies:
  group_button: ^5.3.4
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
    onSelected: (index, isSelected) => print('$index button is selected'),
    buttons: ["12:00", "13:00", "14:30", "18:00", "19:00", "21:40"],
)
```

### Controller
**Starting from version 4.1.0** <br>
You can control your Group Button using the controller

```dart
final controller = GroupButtonController();

Column(
  children: [
    GroupButton.checkbox(
      controller: controller,
      buttons: ['12:00', '13:00', '14:00'],
      onSelected: (i, selected) => debugPrint('Button #$i $selected'),
    ),
    TextButton(
      onPressed: () => controller.selectIndex(1),
      child: const Text('Select 1 button'),
    )
  ],
),
```

### Generic button value
In new 5.0.0 version you can set custom buttons value type <br>
It can be int, DateTime, double or YourCustomClass <br>
Button text will be result of .toString() model method in common button display case <br>
```dart
GroupButton<DateTime>(
  buttons: [DateTime(2022, 4, 9), DateTime(2022, 4, 10)],
)
```

### Button builders

Also you can use generic button values with cutsom buttonBuilder <br>
In order to turn values into any widget
```dart
GroupButton<DateTime>(
  buttons: [DateTime(2022, 4, 9), DateTime(2022, 4, 10)],
  buttonBuilder: (selected, date, context) {
    return Text('${date.year}-${date.month}-${date.day}');
  },
),
```

In this package, there are four different possibilities for customizing your buttons through builders

- 1 **buttonBuilder** It will build a fully custom button based on the value parameter
- 2 **buttonIndexedBuilder** same as buttonBuilder. But based on button index. 
- 3 **buttonTextBuilder** It will replace the text of your button, which is constructed based on the style parameters passed in GroupButtonOptions. The appearance of the button remains the same, but the text is changed. Based on button value. 
- 4 **buttonIndexedTextBuilder** same as buttonTextBuilder. But based on button index. 

### Fully Customize
In order to customize your buttons inside *GroupButton* you can use *GroupButtonOptions*

```dart
GroupButtonOptions(
  selectedShadow: const [],
  selectedTextStyle: TextStyle(
    fontSize: 20,
    color: Colors.pink[900],
  ),
  selectedColor: Colors.pink[100],
  unselectedShadow: const [],
  unselectedColor: Colors.amber[100],
  unselectedTextStyle: TextStyle(
    fontSize: 20,
    color: Colors.amber[900],
  ),
  selectedBorderColor: Colors.pink[900],
  unselectedBorderColor: Colors.amber[900],
  borderRadius: BorderRadius.circular(100),
  spacing: 10,
  runSpacing: 10,
  groupingType: GroupingType.wrap,
  direction: Axis.horizontal,
  buttonHeight: 60,
  buttonWidth: 60,
  mainGroupAlignment: MainGroupAlignment.start,
  crossGroupAlignment: CrossGroupAlignment.start,
  groupRunAlignment: GroupRunAlignment.start,
  textAlign: TextAlign.center,
  textPadding: EdgeInsets.zero,
  alignment: Alignment.center,
  elevation: 0,
),
```

![](https://github.com/Frezyx/group_button/blob/master/example/rep_files/options_example.png?raw=true) 

### Examples
You can check more examples of using this package [here](example/lib)

<br>
<div align="center" >
  <p>Thanks to all contributors of this package</p>
  <a href="https://github.com/Frezyx/group_button/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=Frezyx/group_button" />
  </a>
</div>
<br>

For help getting started with 😍 Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


