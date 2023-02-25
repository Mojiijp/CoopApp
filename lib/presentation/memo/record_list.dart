import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:fruits_and_veggies/src/widgets/info_input.dart';
import 'package:get/get.dart';

List<String> items = [
  'Apple', 'Avocado', 'Blueberry', 'Broccoli', 'Cabbage', 'Carrot', 'Cherry',
  'Guava', 'Mulberry', 'Orange', 'Papaya', 'Pumpkin', 'Raspberry', 'Strawberry',
  'Tomato', 'Watermelon'
];

String? selectedItem = '';

List<String> numOfGram = [
  '10', '20', '30', '40', '50', '60', '70', '80', '90', '100',
  '110', '120', '130', '140', '150', '160', '170', '180', '190', '200',
  '210', '220', '230', '240', '250', '260', '270', '280', '290', '300',
  '310', '320', '330', '340', '350', '360', '370', '380', '390', '400',
];

String? selectedNumOfGram = '';

int numOfItems = 1;

var gram;

TextEditingController? _gramController;

///////////////////List record////////////
List<String> itemSelect = [];
List<String> gramTextField = [];
//////////////////////////////////////////

class RecordList extends StatefulWidget {
  const RecordList({Key? key}) : super(key: key);

  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {

  List<Widget> containerList = [
    const createNewContainer(),
  ];

  // Add
  void addContainer() {
    //print(containerList.length);
    ////ไม่ให้บันทึกเกิน 10 ชนิด
    if(containerList.length < 10){
      containerList.add(const createNewContainer());
    }
  }

  // Pop
  void popContainer() {
    ////ไม่ให้ลบฟอร์มแรกออก
    if(containerList.length > 1){
      containerList.removeLast();
    }
    //print(containerList.length);
  }

  // _childrenList
  List<Widget> _childrenList() {
    return containerList;
  }

  ////////////Key/////////////
  GlobalKey<FormState> _key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: _childrenList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ////Add button
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    if(numOfItems < 10){
                      setState(() {
                        numOfItems++;
                      });
                    }
                    setState(() {
                      addContainer();
                      //print("Add stack");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColor.green,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
              ////Remove button
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    if(numOfItems > 1){
                      setState(() {
                        numOfItems--;
                      });
                    }
                    setState(() {
                      popContainer();
                      //print("remove stack");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
          ////Submit button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print(itemSelect);
                print('$gramTextField กรัม');
                // Gram(gram: _gramController?.text);
                setState(() {
                  if(_key.currentState!.validate()) {
                    gram = _gramController?.text;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColor.green,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                  'บันทึก',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5, top: 3),
            child: Text(
              "รวมแคลอรี",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('$itemSelect'),
                  Text('$gramTextField กรัม'),
                  const Text('104 กิโลแคลอรี'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('$itemSelect'),
                  Text('$gram กรัม'),
                  const Text('104 กิโลแคลอรี'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class createNewContainer extends StatefulWidget {
  const createNewContainer({Key? key}) : super(key: key);

  @override
  State<createNewContainer> createState() => _createNewContainerState();
}

class _createNewContainerState extends State<createNewContainer> {
  @override
  void initState() {
    super.initState();
    gramTextField = [];
    _gramController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        width: 500,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ThemeColor.greenBackground
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "ชนิดที่ ${numOfItems.toString()}",
                        style: const TextStyle(
                            fontSize: 16
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    DropdownSelect(),
                    GramTextField(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownSelect extends StatefulWidget {
  const DropdownSelect({Key? key}) : super(key: key);

  @override
  State<DropdownSelect> createState() => _DropdownSelectState();
}

class _DropdownSelectState extends State<DropdownSelect> {
  final bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(width: 2, color: Colors.green)
              )
          ),
          hint: const Text('Select'),
          items: items.map(
                  (item) => DropdownMenuItem(
                value: item,
                child: Text(item, style: const TextStyle(fontSize: 14),),
              )
          ).toList(),
          onChanged: (item) {
            _isSelected?
            setState(() {
              itemSelect.add(item!);
            }) : setState(() {
              itemSelect.remove(item!);
            });
            setState(() {
              selectedItem = item;
            });
          },
          validator: (item) => item == null ? 'Please fill' : null ,
        ),
      ),
    );
  }
}

class Gram {
  String? gram;

  Gram ({
    this.gram
  });
}

class GramTextField extends StatefulWidget {

  GramTextField({Key? key}) : super(key: key);

  @override
  State<GramTextField> createState() => _GramTextFieldState();
}

class _GramTextFieldState extends State<GramTextField> {
  var _gramController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        validator: _validateGram,
        keyboardType: TextInputType.number,
        controller: _gramController,
        decoration: const InputDecoration(
            hintText: 'ประมาณกี่กรัม'
        ),
      ),
    );
  }

  String? _validateGram(String? value) {
    if(value!.isEmpty) {
      return 'Please enter gram';
    }
    return null;
  }

}


