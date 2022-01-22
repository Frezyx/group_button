## 4.1.1
 - **FIX**: GroupbuttonController initialization
## 4.1.0
 - **FEAT**: [onDisablePressed](https://github.com/Frezyx/group_button/blob/master/lib/src/group_button_base.dart#:~:text=Function(int%20index)%3F-,onDisablePressed,-%3B) calback method for handle taps on disabled buttons

## 4.0.0
 - **FEAT**: [GroupButtonController](https://github.com/Frezyx/group_button/blob/master/lib/src/utils/controller.dart) for working with GroupButton from the outside
 - **FEAT**: New GroupButton factory constructors [GroupButton.checkbox](https://github.com/Frezyx/group_button/blob/master/lib/src/group_button_base.dart#:~:text=///%20Build%20group%20button,button%20is%20seletced) and [GroupButton.checkbox](https://github.com/Frezyx/group_button/blob/master/lib/src/group_button_base.dart#:~:text=///%20Build%20group%20button%20for%20choising%20several,or%20unselected%20with%20%5Bbool%20selected%5D%20field) for faster buttons group creation
- **FIX**: Common issues

 Thanks for [bookyo](https://github.com/bookyo) and [mwm0022](https://github.com/mwm0022)

## 3.3.1
 - **FIX**: fix static analysis issues

## 3.3.0
 - **FEAT**: Add [alignment](https://github.com/Frezyx/group_button/blob/master/lib/group_button.dart#:~:text=///%20%5BAlignment%5D%20Text%20position,final%20AlignmentGeometry%3F%20alignment%3B) field
 - **FEAT**: Add [elevation](https://github.com/Frezyx/group_button/blob/master/lib/group_button.dart#:~:text=///%20%5Bdouble%5D%20The%20buttons,final%20double%3F%20elevation%3B) field
 - **FEAT**: Add [disabledButtons](https://github.com/Frezyx/group_button/blob/master/lib/group_button.dart#:~:text=///%20%5Bint%5D%20button%20ids,List%3Cint%3E%3F%20disabledButtons%3B) field

 Thanks for [slavap](https://github.com/slavap)

## 3.2.0
 - **FEAT**: Add [textAlign](https://github.com/Frezyx/group_button/blob/master/lib/group_button.dart#:~:text=///%20%5BTextAlign%5D%20The%20buttons,final%20TextAlign%20textAlign%3B) field
 - **FEAT**: Add [textPadding](https://github.com/Frezyx/group_button/blob/master/lib/group_button.dart#:~:text=///%20%5BEdgeInsets%5D%20The%20inner,final%20EdgeInsets%20textPadding%3B) field

## 3.1.0
 - **FEAT**: Add runSpacing field !
             When [groupingType] is [GroupingType.wrap] this field sets Wrap [runSpacing]
 - **BREAKING**: Now spacing field is not sets GroupButton items vertical spacing

## 3.0.1
 - **FIX**: Remove initial selected button from original widget 
            initialization

## 3.0.0+1
 - **FIX**: fix app logo link
## 3.0.0
 - **BREAKING**: Implement groupingType field to make different 
    grouping types like Wrap, Column, Row
 - **FEAT**: Remove default values of styling fields for delegate this to theme
 - refactoring: Make some internal refactoring

## 2.4.1

 - **FIX**: fix static analysis issues

## 2.4.0

 - **FEAT**: implement `runGroupAlignment` field for placed buttons runs themselves along the cross axis in a layout.

## 2.3.0

 - **FEAT**: implement `mainGroupAlignment` field for placed buttons in the main axis in a layout.
 - **FEAT**: implement `crossGroupAlignment` field for placed buttons along the cross axis in a layout.


## 2.2.2 - 2021-06-05

* Create example with using provider as state-manager 

## 2.2.1 - 2021-06-01

* Update examples in README.md 

## 2.2.0 - 2021-06-01

* Remove provider dependency
* Fix fields passing for widget
* Update selectedButtons field (Now int like index)
* Add selectedButton field for radio type

## 2.1.2 - 2021-05-04

*  Fix selectedBorderColor not working exception

## 2.1.1 - 2021-05-04

*  Fix spacing error issue

## 2.1.0 - 2021-04-06

*  Add ability for using radio mode without an selected buttons

## 2.0.0+1 - 2021-04-06

*  Fix static analysis issues

## 2.0.0 - 2021-04-06

*  Migrate to null-safety [commit](https://github.com/Frezyx/group_button/pull/13/commits/fb7fd02c97bd6e27dc83f125cb6749e3ef467397)

## 1.3.0 - 2021-03-04

*  Migrate from using RaisedButton to ElevatedButton

## 1.2.0 - 2021-03-03

* Add width and height fields for buttons

## 1.1.1 - 2021-02-20

* Refactor code
* Add lint package

## 1.1.0 - 2020-10-19

* Added ability to set initially selected buttons

## 1.0.2 - 2020-08-11

* Create travis & codemagic QA

## 1.0.1 - 2020-08-11

* Fix dart analyzer issues, errors and remarks

## 1.0.0 - 2020-08-11

* Basic functionality for creating a button group
* Two models of the group were created: 
    + Radio (one selected button)
    + CheckBox (several selected buttons)

## 0.1.0 - 2020-08-9

* Initial package skeleton
