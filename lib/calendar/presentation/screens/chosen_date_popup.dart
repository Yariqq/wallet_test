import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChosenDatePopup extends StatelessWidget {
  final DateTime chosenDate;

  const ChosenDatePopup({required this.chosenDate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    DateFormat("dd.MM.yyyy").format(chosenDate),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    padding: const EdgeInsets.only(left: 18),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                ListTile(
                  title: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                      hintText: 'Amount',
                      hintStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(142, 141, 146, 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(235, 236, 240, 1),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(235, 236, 240, 1),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color.fromRGBO(235, 236, 240, 1),
                        width: 1,
                      ),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: 'first',
                      underline: Container(),
                      onChanged: (String? newValue) {},
                      items: <String>['first', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  height: 45,
                  minWidth: 100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.black26,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 1.5,
                ),
                const ListTile(
                  leading: Icon(Icons.category),
                  title: Text('Transport'),
                  trailing: Text('9p'),
                ),
                const ListTile(
                  leading: Icon(Icons.emoji_food_beverage),
                  title: Text('Food'),
                  trailing: Text('25p'),
                ),
                const ListTile(
                  leading: Icon(Icons.emoji_food_beverage),
                  title: Text('Food'),
                  trailing: Text('25p'),
                ),
                const ListTile(
                  leading: Icon(Icons.emoji_food_beverage),
                  title: Text('Food'),
                  trailing: Text('25p'),
                ),
                const ListTile(
                  leading: Icon(Icons.emoji_food_beverage),
                  title: Text('Food'),
                  trailing: Text('25p'),
                ),
                const ListTile(
                  leading: Icon(Icons.emoji_food_beverage),
                  title: Text('Food'),
                  trailing: Text('25p'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
