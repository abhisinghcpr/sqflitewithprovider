
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newproject/views/screens/sqf_lites_screens/sqf_lite_screen/sqf_insert_screen/sqf_insert_widgets.dart';
import 'package:provider/provider.dart';
import '../../../../../controllers/providers/provider.dart';
import '../../../../../controllers/sqf_controllers/sql_controller.dart';

class AddData extends StatefulWidget {
  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController titleController = TextEditingController();
  TextEditingController artistController = TextEditingController();
  TextEditingController producerController = TextEditingController();
  TextEditingController companyDetailsController = TextEditingController();
  var time = DateTime.now().toString();
  // var Provider = DataProvider();
  var view = SqfWidget();
  late DBHelper dbHandler;

  @override
  void initState() {
    super.initState();
    dbHandler = DBHelper();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50),
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: artistController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your artist name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a artist name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: producerController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your producer name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a producer name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: companyDetailsController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your companyDetails',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a companyDetails';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String title = titleController.text;
                      String artist = artistController.text;
                      String producer = producerController.text;
                      String releaseTime = time.toString();
                      String companyDetails = companyDetailsController.text;
                      await Provider.of<DataProvider>(
                        context,
                        listen: false,
                      ).addData(title, artist,producer,companyDetails,releaseTime);

                      Fluttertoast.showToast(
                        msg: 'Data added successfully',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.deepPurple,
                        textColor: Colors.white,
                      );

                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Save data"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}