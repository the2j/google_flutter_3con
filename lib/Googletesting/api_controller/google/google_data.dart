//import 'package:flutter_weko/api_controller/apple/apple_types.dart';
//import 'package:flutter_weko/api_controller/unified_data.dart';
//import 'package:health/health.dart';

import 'dart:ffi';

import 'package:google_flutter_con3/Googletesting/api_controller/google/google_types.dart';
import 'package:googleapis/fitness/v1.dart';

import '../unified_data.dart';

class GoogleHealthData extends UnifiedHealthData {
  GoogleHealthData() : super();


///
/// manages a list of all current health data types
  ///
  void addDataList(List<Dataset> data) {
    //DataP
    data.forEach((dataset) {
      //print(dataset.toJson().toString());

      //dataset is each existing set of data for a health source
      addData(dataset);

    });

  }

  ///
  /// Manages data for each individual health data type
  void addData(Dataset data) {
    var dataValues = <dynamic>[];
    String? dataType = data.dataSourceId;
      print ('###################');
      print(dataType);

      //get data in the correct format - so basically it is just the right values within a list

        switch(dataType) {
          // case statement above is to ensure data is put into the correct format for the unified data file


          //case "derived:com.google.height:com.google.android.gms:merge_height":
          case "derived:com.google.weight:com.google.android.gms:merge_weight":
            //for specific dataset
            data.point!.forEach((datapoint) {

              //now iterate through value within datapoint
              datapoint.value!.forEach((datavalue) {
                //if values are not null then add the respective value
                //currently accounts for int and float values (float is just double)
                if(datavalue.fpVal != null) dataValues.add(datavalue.fpVal!);
                else  {
                  if (datavalue.intVal != null) dataValues.add(datavalue.intVal!);
                }
                //now add datavalue to dataVaules list



              });

              //manages datapoints
              //datapoint




            });
            // //var value;
            // for( in data.point!) {
            //   v
            //   if (value[] == dataType) {
            //
            //   }
            //
            // }
            // print(data.point![0].value);
            //
            //
            // print("HERE WE EXTRACT HEIGHT DATA & PUSH TO WEKO");
        }







      //innerData[dataType!].add();
    }
}
