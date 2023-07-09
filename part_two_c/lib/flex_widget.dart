import 'package:flutter/material.dart';
import 'package:part_two_c/contacts_view.dart';
import 'package:part_two_c/contacts_data.dart';

class FlexWidget extends StatefulWidget {
  const FlexWidget ({Key? key }) : super(key: key);

  @override
  State<FlexWidget>  createState() =>
      _FlexWidgetState();
}

class _FlexWidgetState extends State<FlexWidget> {
  final TextEditingController firstNameController =
  TextEditingController();

  final TextEditingController lastNameController =
  TextEditingController();

  final TextEditingController numberController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController addressController =
  TextEditingController();

  String nameStr = ' ';

  @override
  void dispose() {
    // Cleans up the text controllers when
    // this widget is disposed
    firstNameController.dispose();
    lastNameController.dispose();
    numberController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Column (
      children: <Widget>[
        Flexible (
          child: ListView (
            shrinkWrap: true,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.name,
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First and Middle Name',
                  hintText: 'Enter First and Middle Name Here',
                ),
              ),
              TextField(
                keyboardType: TextInputType.name,
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter Last Name Here',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: numberController    ,
                decoration: const InputDecoration(
                  labelText: 'Number',
                  hintText: 'Enter Phone Number Here',
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Email Address Here',
                ),
              ),
              TextField(
                keyboardType: TextInputType.streetAddress,
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter Street Address Here',
                )
              )
            ], // children
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                      onPressed: onBtnClick,
                      child: const Text('Add Contact'),
              )
            ),
          ],
        ),
       Flexible (
         child: DisplayContacts(
                    key: UniqueKey()
               ),
        ),
      ], // Column children:
    );
  }

  void onBtnClick( ) {
    setState(() {
      nameStr = '${firstNameController.text} ${lastNameController.text}';
      String numStr = numberController.text;
      String emailStr = emailController.text;
      String addressStr = addressController.text;

      // add to to myContactList
      myContactsList.add(
          Contact(nameStr,
                  numStr,
                  emailStr,
                  addressStr));

      // clear text fields
      firstNameController.clear();
      lastNameController.clear();
      numberController.clear();
      emailController.clear();
      addressController.clear();
    }); // setState

    // Generate Alert Dialog
    AlertDialog alrtDialog = AlertDialog(
      content: Text(
          '$nameStr has been added'),
    );

    // Display dialog
    showDialog( context: context,
      builder: (context) {
        return alrtDialog;
      },  // builder
    );
  }
}