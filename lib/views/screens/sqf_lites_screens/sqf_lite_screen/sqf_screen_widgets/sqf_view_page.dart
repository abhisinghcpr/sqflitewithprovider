// import 'package:flutter/material.dart';
// import 'package:newproject/views/screens/sqf_lites_screens/sqf_lite_screen/sqf_screen_widgets/sqf_views_widget.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../controllers/providers/provider.dart';
// import '../../../../../models/sqf_models/sqf_model.dart';
// import '../sqf_insert_screen/sqf_insert_screen.dart';
//
// class DataListWidget extends StatefulWidget {
//   @override
//   State<DataListWidget> createState() => _DataListWidgetState();
// }
//
// class _DataListWidgetState extends State<DataListWidget> {
//   var view = SqfInsert();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context) => AddData(),));
//         },
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         title: Text('Data List'),
//       ),
//       body: Consumer<DataProvider>(
//         builder: (context, dataProvider, _) {
//           if (dataProvider.dataList.isEmpty) {
//             return const Center(
//               child: Text('No data available'),
//             );
//           }
//
//           return ListView.builder(
//             itemCount: dataProvider.dataList.length,
//             itemBuilder: (context, index) {
//               MusicDataModel data = dataProvider.dataList[index];
//               return Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey, // Border color
//                     width: 1.0, // Border width
//                   ),
//                   borderRadius: BorderRadius.circular(8.0), // Border radius
//                 ),
//                 margin: EdgeInsets.all(8.0), // Margin around the container
//                 padding: EdgeInsets.all(8.0), // Padding inside the container
//                 child: ListView(
//                   children: [
//                 Card(
//                 child: Column(
//                 children: [
//                     Text(data.title),
//                     //  Column(children: [Text(data.artists.toString()),Text(data.producer.toString())],),
//                     // Text(data.companyDetails),
//                     // Text(data.releaseTime.toString()),
//                     ],
//                   ),
//                 ),
//                     IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () {
//                         dataProvider.deleteData(data.id);
//                       },
//                     ),
//                   ],
//                 ),
//               );
//
//             },
//           );
//         },
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/providers/provider.dart';
import '../../../../../models/sqf_models/sqf_model.dart';
import '../sqf_insert_screen/sqf_insert_screen.dart';
class DataListWidget extends StatefulWidget {
  @override
  State<DataListWidget> createState() => _DataListWidgetState();
}

class _DataListWidgetState extends State<DataListWidget> {
  bool fev = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddData(),));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Data List'),
        // actions: [
        //   // IconButton(onPressed: () {
        //   //
        //   // },
        //     //icon: Icon(Icons.favorite),color: Colors.red,)
        // ],
      ),
      body: Consumer<DataProvider>(
        builder: (context, dataProvider, _) {
          if (dataProvider.dataList.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }

          return ListView.builder(
            itemCount: dataProvider.dataList.length,
            itemBuilder: (context, index) {
              MusicDataModel data = dataProvider.dataList[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  subtitle:    Card(
                child: Column(
                children: [
                    Text('Title:- ${data.title}'),
                     Column(children: [Text(data.artists.toString()),Text(data.producer.toString())],),
                    Text(data.companyDetails),
                    Text(data.releaseTime.toString()),
                    ],

                  ),
                ),

                ),
              );
            },

          );
        },
      ),
    );
  }
}