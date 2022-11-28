import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:group_radio_button/group_radio_button.dart';

class DragAndDrop extends StatefulWidget {
  const DragAndDrop({Key? key}) : super(key: key);

  @override
  State<DragAndDrop> createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDrop> {
  List<Widget> list = [Container()];

  List<String> _kOptions = <String>[
    'Admin',
    'Staff',
    'Patient',
  ];

  List<String> _status = ["Pending", "Released", "Blocked"];
  String _verticalGroupValue = "Pending";
  bool isEdit = false;
  String name = '';
  List<bool>? isChecked;

  @override
  void initState() {
    isChecked = List<bool>.generate(_kOptions.length, (index) => false);
    super.initState();
  }

  //403452

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF403452),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  height: 500,
                  width: 500,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: (!isEdit)
                      ? Column(
                          children: <Widget>[
                            DragTarget(
                              builder: (BuildContext context,
                                  List<int?> candidateData,
                                  List<dynamic> rejectedData) {
                                return Container(
                                  // width: MediaQuery.of(context).size.width * 0.8,
                                  height: 480,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListView.builder(
                                            itemCount: list.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: list[index],
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                );
                              },
                              onWillAccept: (data) {
                                print("onWillAccept");
                                return data == 1 ||
                                    data == 2 ||
                                    data == 3 ||
                                    data == 4 ||
                                    data == 5 ||
                                    data == 6 ||
                                    data == 7 ||
                                    data == 8 ||
                                    data == 9 ||
                                    data == 10 ||
                                    data == 11 ||
                                    data == 12 ||
                                    data == 13 ||
                                    data == 14; // accept when data = 1 only.
                              },
                              onAccept: (data) {
                                if (data == 1) {
                                  list.add(listFields(
                                      title: "AutoComplete",
                                      child: autoComWidget()));
                                }
                                if (data == 2) {
                                  list.add(listFields(
                                      title: "Button", child: ButtonWidget()));
                                }
                                if (data == 3) {
                                  list.add(listFields(
                                      title: "Checkbox",
                                      child: checkboxName()));
                                }
                                if (data == 4) {
                                  list.add(listFields(
                                      title: "Date Field", child: dateField()));
                                }
                                if (data == 5) {
                                  list.add(listFields(
                                      title: "", child: autoComWidget()));
                                }
                                if (data == 6) {
                                  list.add(listFields(
                                      title: "Header", child: textName()));
                                }
                                if (data == 7) {
                                  list.add(listFields(
                                      title: "Header",
                                      child: hiddenInputField()));
                                }
                                if (data == 8) {
                                  list.add(listFields(
                                      title: "Number",
                                      child: textNumberFieldForm()));
                                }
                                if (data == 9) {
                                  list.add(listFields(
                                      title: "Paragraph", child: paragraph()));
                                }
                                if (data == 10) {
                                  list.add(listFields(
                                      title: "Radio Group",
                                      child: radioButtonWidget()));
                                }
                                if (data == 11) {
                                  list.add(listFields(
                                      title: "Select", child: spinnerWidget()));
                                }
                                if (data == 12) {
                                  list.add(listFields(
                                      title: "Text Field",
                                      child: textFieldForm()));
                                }
                                if (data == 13) {
                                  list.add(listFields(
                                      title: "Text Area",
                                      child: textFieldForm()));
                                }
                                if (data == 14) {
                                  list.add(listFields(
                                      title: "Signature", child: SignatureP()));
                                }
                              },
                              onLeave: (data) {},
                            )
                          ],
                        )
                      : Container(
                          padding: const EdgeInsets.all(20),
                          height: 400,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    isEdit = false;
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 200,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Access",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    SizedBox(
                                      height: 200,
                                      width: 300,
                                      child: ListView.builder(
                                          itemCount: _kOptions.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              alignment: Alignment.centerLeft,
                                              child: Transform.scale(
                                                scale: 0.8,
                                                child: CheckboxListTile(
                                                  title: Text(_kOptions[index]),
                                                  value: isChecked![index],
                                                  onChanged: (newValue) {
                                                    print(newValue);
                                                    isChecked![index] =
                                                        newValue!;
                                                    setState(() {});
                                                  },
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading, //  <-- leading Checkbox
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  height: 500,
                  width: 500,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Draggable(
                          child: RightSideWidget(
                              title: "AutoComplete", icon: Icons.comment),
                          feedback: RightSideWidget(
                              title: "AutoComplete", icon: Icons.comment),
                          childWhenDragging: RightSideWidget(
                              title: "AutoComplete", icon: Icons.comment),
                          data: 1,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Button", icon: Icons.smart_button),
                          feedback: RightSideWidget(
                              title: "Button", icon: Icons.smart_button),
                          childWhenDragging: RightSideWidget(
                              title: "Button", icon: Icons.smart_button),
                          data: 2,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Checkbox Group", icon: Icons.check_box),
                          feedback: RightSideWidget(
                              title: "Checkbox Group", icon: Icons.check_box),
                          childWhenDragging: RightSideWidget(
                              title: "Checkbox Group", icon: Icons.check_box),
                          data: 3,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Date Field", icon: Icons.date_range),
                          feedback: RightSideWidget(
                              title: "Date Field", icon: Icons.date_range),
                          childWhenDragging: RightSideWidget(
                              title: "Date Field", icon: Icons.date_range),
                          data: 4,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "File Upload", icon: Icons.upload),
                          feedback: RightSideWidget(
                              title: "File Upload", icon: Icons.upload),
                          childWhenDragging: RightSideWidget(
                              title: "File Upload", icon: Icons.upload),
                          data: 5,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Header", icon: Icons.view_headline),
                          feedback: RightSideWidget(
                              title: "Header", icon: Icons.view_headline),
                          childWhenDragging: RightSideWidget(
                              title: "Header", icon: Icons.view_headline),
                          data: 6,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Hidden Input", icon: Icons.input),
                          feedback: RightSideWidget(
                              title: "Hidden Input", icon: Icons.input),
                          childWhenDragging: RightSideWidget(
                              title: "Hidden Input", icon: Icons.input),
                          data: 7,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Number", icon: Icons.numbers),
                          feedback: RightSideWidget(
                              title: "Number", icon: Icons.numbers),
                          childWhenDragging: RightSideWidget(
                              title: "Number", icon: Icons.numbers),
                          data: 8,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Paragraph", icon: Icons.text_fields),
                          feedback: RightSideWidget(
                              title: "Paragraph", icon: Icons.text_fields),
                          childWhenDragging: RightSideWidget(
                              title: "Paragraph", icon: Icons.text_fields),
                          data: 9,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Radio Group",
                              icon: Icons.radio_button_checked_sharp),
                          feedback: RightSideWidget(
                              title: "Radio Group",
                              icon: Icons.radio_button_checked_sharp),
                          childWhenDragging: RightSideWidget(
                              title: "Radio Group",
                              icon: Icons.radio_button_checked_sharp),
                          data: 10,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Select", icon: Icons.select_all),
                          feedback: RightSideWidget(
                              title: "Select", icon: Icons.select_all),
                          childWhenDragging: RightSideWidget(
                              title: "Select", icon: Icons.select_all),
                          data: 11,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Text Field",
                              icon: Icons.format_textdirection_l_to_r),
                          feedback: RightSideWidget(
                              title: "Text Field",
                              icon: Icons.format_textdirection_l_to_r),
                          childWhenDragging: RightSideWidget(
                              title: "Text Field",
                              icon: Icons.format_textdirection_l_to_r),
                          data: 12,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Text Area",
                              icon: Icons.area_chart_outlined),
                          feedback: RightSideWidget(
                              title: "Text Area",
                              icon: Icons.area_chart_outlined),
                          childWhenDragging: RightSideWidget(
                              title: "Text Area",
                              icon: Icons.area_chart_outlined),
                          data: 13,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                        Draggable(
                          child: RightSideWidget(
                              title: "Signature",
                              icon: Icons.area_chart_outlined),
                          feedback: RightSideWidget(
                              title: "Signature",
                              icon: Icons.area_chart_outlined),
                          childWhenDragging: RightSideWidget(
                              title: "Signature",
                              icon: Icons.area_chart_outlined),
                          data: 14,
                          onDragStarted: () {},
                          onDragCompleted: () {},
                          onDragEnd: (details) {},
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {},
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget RightSideWidget({String? title, IconData? icon}) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title!,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              )
            ],
          )),
    );
  }

  Widget listFields({String? title, Widget? child}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title!),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        isEdit = true;
                        name = title;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        /*list.removeAt(
                            index);*/
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.cancel_outlined,
                        size: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // list[index]
            child!
          ],
        ),
      ),
    );
  }

  Widget textFieldForm() {
    return Card(
      elevation: 0,
      child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: '',
              labelText: 'Header',
            ),
          )),
    );
  }

  Widget textNumberFieldForm() {
    return Card(
      elevation: 0,
      child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(),
          )),
    );
  }

  Widget textName() {
    return Card(
      elevation: 0,
      child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Header",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )),
    );
  }

  Widget paragraph() {
    return Card(
      elevation: 0,
      child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Paragraph",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20),
          )),
    );
  }

  Widget hiddenInputField() {
    return Card(
      elevation: 0,
      child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Hidden Input",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20),
          )),
    );
  }

  Widget checkboxName() {
    return Card(
      elevation: 0,
      child: Container(
          padding: const EdgeInsets.all(10),
          child: CheckboxListTile(
            title: const Text("title text"),
            value: true,
            onChanged: (newValue) {},
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          )),
    );
  }

  Widget dateField() {
    return Card(
      elevation: 0,
      child: Container(
          padding: const EdgeInsets.all(10),
          child: DateTimeFormField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.event_note),
              labelText: 'Select Date',
            ),
            mode: DateTimeFieldPickerMode.date,
            autovalidateMode: AutovalidateMode.always,
            validator: (e) =>
                (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              print(value);
            },
          )),
    );
  }

  Widget autoComWidget() {
    return Card(
      elevation: 0,
      child: Container(
        height: 40.0,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: InputDecorator(
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            //add this Disabling Underline/Border only when Enabled
            focusedBorder: InputBorder.none,
            //Add this Removing the Underline/Border only when Focused
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                width: 1,
                style: BorderStyle.none,
              ),
            ), //Add this when
            // prefixIcon: const Icon(Icons.search, size: 25.0,),
            /*
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),*/
            // filled: true,
            // hintStyle: TextStyle(color: Colors.grey[800]),
            // hintText: "Type in your text",
            // fillColor: Colors.white,
            // isDense: true,
            // contentPadding: EdgeInsets.all(0.0),
          ),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return _kOptions.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            optionsViewBuilder: ((context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 200, maxWidth: 300),
                    //RELEVANT CHANGE: added maxWidth
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = _kOptions.elementAt(index);
                        return InkWell(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Builder(builder: (BuildContext context) {
                            final bool highlight =
                                AutocompleteHighlightedOption.of(context) ==
                                    index;
                            return Container(
                              color: highlight
                                  ? Theme.of(context).focusColor
                                  : null,
                              padding: const EdgeInsets.all(16.0),
                              child: Text(option),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget ButtonWidget() {
    return Card(
      elevation: 0,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 40.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {},
          child: const Text('Button'),
        ),
      ),
    );
  }

  Widget radioButtonWidget() {
    return Card(
      elevation: 0,
      child: Container(
        alignment: Alignment.centerLeft,
        child: RadioGroup<String>.builder(
          groupValue: _verticalGroupValue,
          onChanged: (value) => setState(() {
            _verticalGroupValue = value!;
          }),
          items: _status,
          itemBuilder: (item) => RadioButtonBuilder(
            item,
          ),
          activeColor: Colors.red,
        ),
      ),
    );
  }

  String _selectedValue = '';

  Widget spinnerWidget() {
    return Card(
      elevation: 0,
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        child: DropdownButton<String>(
          hint: Text(_selectedValue),
          items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (val) {
            _selectedValue = val!;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget normalAutoComplete() {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return _kOptions.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              debugPrint('You just selected $selection');
            },
          )),
    );
  }

  Widget SignatureP({Color color = Colors.white}) {
    return Card(
      child: Container(
          height: 150,
          width: 250,
          padding: const EdgeInsets.all(10),
          child: Signature(
            color: color,
            // Color of the drawing path
            strokeWidth: 5.0,
            // with
            backgroundPainter: null,
            // Additional custom painter to draw stuff like watermark
            onSign: null,
            // Callback called on user pan drawing
            key:
                null, // key that allow you to provide a GlobalKey that'll let you retrieve the image once user has signed
          )),
    );
  }
}
