import 'package:flutter/material.dart';
import 'package:lab05/showbmipage.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  // Form
  final GlobalKey<FormState> _formKey = GlobalKey();

  // TextField
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  String isRadio = "";
  bool isCheck = false;

  List<Fruit> fruits = [];

  final List<ListItem> _dropdownItems = [
    ListItem(1, 'ม่วง'),
    ListItem(2, 'เทา'),
    ListItem(3, 'น้ำเงิน'),
    ListItem(4, 'เขียว'),
    ListItem(5, 'ดำ'),
    ListItem(6, 'เหลือง'),
    ListItem(7, 'ส้ม'),
    ListItem(8, 'แดง'),
  ];

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem? _selectedItem;

  @override
  void initState() {
    super.initState();
    fruits = Fruit.getFruit();
    print(fruits[0].engName);

    _dropdownMenuItems = buildDropdownMenuItem(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> dropdownItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in dropdownItems) {
      items.add(DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculation"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            //Center(child: Text("\nHeight")),
            TextFormField(
              controller: _height,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter height";
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(suffixText: "cm", labelText: "ส่วนสูง"),
              // onChanged: (value) {
              //   setState(() {});
              // },
            ),
            TextFormField(
              controller: _weight,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter weight";
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  suffixText: "kg", labelText: "นํ้าหนัก"),
              // onChanged: (value) {
              //   setState(() {});
              // },
            ),
            /*Center(child: Text("\nTextFormField #2")),
            TextFormField(
              controller: _weight,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Center(child: Text("\nTextFormField #3")),
            TextFormField(
            controller: _text3,
              keyboardType: TextInputType.url,
              obscureText: true,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                
                prefixIcon: Icon(Icons.email,color: Colors.green,),
                hintText: "This is label text",
                enabledBorder: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.green,width: 3),


                  
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.green,width: 3),
                  
                  
                ),
              ),
              
              
            ),*/

            Center(child: Text("\nSex")),
            RadioListTile(
              title: Text("Male"),
              value: "Male",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("Female"),
              value: "Female",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("Other (LGBT+)"),
              value: "Other",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("Not Specify"),
              value: "Not",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            Column(
              children: createFruitCheckbox(),
            ),
            DropdownButton(
              value: _selectedItem,
              items: _dropdownMenuItems,
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
                print(_selectedItem!.name);
                print(_selectedItem!.value);
              },
            ),
            ElevatedButton(
              child: Text('Go to next page.'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(_height.text);
                  print(_weight.text);

                  double weight = double.parse(_weight.text);
                  double height = double.parse(_height.text) / 100;

                  var bmi = weight / (height * height);
                  print(bmi);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowBMI(
                            bminew: bmi,
                            weightnew: _weight.text,
                            heightnew: _height.text),
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createFruitCheckbox() {
    List<Widget> myfruit = [];

    for (Fruit fruit in fruits) {
      myfruit.add(
        CheckboxListTile(
          title: Text(fruit.thName),
          value: fruit.isCheck,
          onChanged: (value) {
            setState(() {
              fruit.isCheck = value!;
            });
          },
        ),
      );
    }

    return myfruit;
  }
}

class Fruit {
  String engName;
  String thName;
  bool isCheck;

  Fruit(this.engName, this.thName, this.isCheck);

  static List<Fruit> getFruit() {
    return <Fruit>[
      Fruit("1", "แอปเปิ้ล", false),
      Fruit("2", "มะละกอ", false),
      Fruit("3", "กล้วย", true),
      Fruit("4", "ส้ม", false),
      Fruit("5", "มะพร้าว", false),
    ];
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
