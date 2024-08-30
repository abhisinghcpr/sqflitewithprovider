import 'package:flutter/material.dart';
import '../../models/sqf_models/sqf_model.dart';
import '../sqf_controllers/sql_controller.dart';

class DataProvider extends ChangeNotifier {
  late DBHelper dbHelper;
  List<MusicDataModel> dataList = [];

  DataProvider() {
    dbHelper = DBHelper();
    fetchData();
  }

  Future<void> fetchData() async {
    dataList = await dbHelper.getNoteList();
    notifyListeners();
  }

  Future<void> addData(String artists, String title, String companyDetails, String producer, String releaseTime) async {
    MusicDataModel newData = MusicDataModel(
      artists: artists,
      companyDetails: companyDetails,
      producer: producer,
      title: title,
      releaseTime: releaseTime
    );
    await dbHelper.insertData(newData);
    await fetchData();
  }

  Future<void> deleteData(int? id) async {

    await dbHelper.delete(id!);
    await fetchData();

    print('ID is null, unable to delete.');

  }
}