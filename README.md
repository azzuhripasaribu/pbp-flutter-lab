# Assignment 7

## Stateless vs Stateful Widget

A stateless Widget is a widget that does not change, it stays the same throughout the execution of the application. Examples of a stateless widget are Text, Icon, and IconButton

A stateful widget is a widget that can change, it can change during the execution of the application through user interactions. Examples of stateful widgets are  Checkbox, Radio, and TextField

## Widgets Used

The widgets used in this creating application are:

### Text

Text is used to display text in the app

### TextStyle

TextStyle is used to define how it's parent text looks

### FloatingActionButton

FloatingActionButton is used to add a button to the app

### Row

Row is used to position widgets in a row

### Visibility

Visibility is used to show or hide it's child widget

### Icon

Icon is used to display an icon

## What setState() does

setState tells flutter that the state of an object has been changed and schedules a the build for the object

## Difference between const and final

final is a runtime-constant which means its value is assigned at runtime

Const value is assigned at compile time

## how the program is implemented

- start the default flutter app
- implement the _decrement counter function that decrement the function
- implement _getEvenOddText funtion that returns a Text widget. The function returns a red 'EVEN' if the counter is even and a blue 'ODD' if the counter is odd
- modify the floatingActionButton of scaffold to be a row containig 2 FloatingActionButton widget, one calls the _decrementCounter function and the other the _incrementCounter function
- encapsulate the decrement button with the Visibility widget that hides the button if the counters value is 0

# Assignment 8

## Difference between Navigator.push and Navigator.pushReplacement

Navigator.pushReplacement Replaces the previous top of the stack with the new route. Navigator.push only pushes it
## Widgets Used

### Card

### FutureBuilder

FutureBuilder asychronously builds widgets.

### Form

Create a form

### TextFormField

TextFormField adds a field for the user to input text

### DropdownButton

Adds a dropdown button to a page

### DropdownMenuItem

Items for thedrop down button

### SingleChildScrollView

Make the widget scrollable

## Event types in flutter

- onTap
- onPressed
- onChanged
- onSaved
- onPointerCancel
- onPointerDown
- onPointerHover
- onPointerMove
- onPointerPanZoomEnd
- onPointerPanZoomStart
- onPointerPanZoomUpdate
- onPointerSignal
- onPointerUp
## How Navigator works in flutter

Navigation history in flutter is saved as a stack. when switching to a new page, the Navigator pushes the page onto the stack using Navigator.push or replaces the top of the stack when using Navigator.pushReplacement. when returning to a previous screen, the top of the stack is popped and the previous page becomes the top of the stack.