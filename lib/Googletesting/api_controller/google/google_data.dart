//import 'package:flutter_weko/api_controller/apple/apple_types.dart';
//import 'package:flutter_weko/api_controller/unified_data.dart';
//import 'package:health/health.dart';

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import '../unified_data.dart';
import 'google_types.dart';
import 'package:googleapis/fitness/v1.dart';

//import '../../../../../googleapi/google_flutter_con3/lib/Googletesting/api_controller/unified_data.dart';




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


  ///RETURN DATA AS FINAL 1 LIST AS WELL AS WELL AS SEND TO INNER DATA LIST
  ///
  ///
  /// [data] fitness dataset - contains health values for request and other information
  /// [wekType] name of the health data type that is to be passed to within data_types
  /// [indx] if multiple values are returned for a datapoint, get the required values index
   void datasetAsList(Dataset data,String? wekoType, [int indx = -1]) {  //List<dynamic>
    var valuesList = <dynamic>[];
    if (wekoType == null || Dataset == null) print("weko value not found");
    else {
      data.point!.forEach((datapoint) {
        int pos = 0;
        datapoint.value!.forEach((datavalue) {
          if (indx == -1 || indx == pos) {
            print("value found");
            print("pos = " + pos.toString() +" | indx = " + indx.toString() );
            //gets either intger value or floating point value
            if (datavalue.fpVal != null) {
              print("value added");
              valuesList.add(datavalue.fpVal!);
              print(datavalue.fpVal);
            }
            else {
              print("value added");
              if (datavalue.intVal != null) {valuesList.add(datavalue.intVal!);}
              print(datavalue.intVal);
            }
          }
          pos++;
        });

    });
      print("[");
      valuesList.forEach((element) {print(element.toString() + ", ");});
      print("]");
      //add data to innerData map that will be sent to weko
      if (valuesList.length > 0) {
        print("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
        for (int i = 0; i < valuesList.length; i++) {
          innerData[wekoType].add(valuesList[i]);
          print(valuesList[i]);
        }
        print("W END");
        //add values to innerdata to transfer to weko
        //return valuesList;
      }
      else print("no values for: " + wekoType + "  LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      print(data.dataSourceId.toString());
    }
  }

  ///
  /// Manages data for each individual health data type
  ///
  void addData(Dataset data) {
    var dataValues = <dynamic>[];
    String? dataType = data.dataSourceId;
      //get data in the correct format - so basically it is just the right values within a list
      switch(dataType) {
        case "derived:com.google.weight:com.google.android.gms:merge_weight":  //WEIGHT
          //WEIGHT
          //datasetAsList(data, GoogleTypes.googleToWekoBase[dataType].toString() );
          datasetAsList(data, "weight");
          break;

        case "derived:com.google.height:com.google.android.gms:merge_height":  //HEIGHT
          //Height
          datasetAsList(data, GoogleTypes.googleToWekoBase[dataType].toString() );
          break;

        case "derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas": //STEPS
          var valuesList = <dynamic>[];
          //SEND DATA valuesList TO WEKO
          String dataname = "steps";
          datasetAsList(data,dataname);
          print("steps: " + valuesList.toString());
          break;

        case "derived:com.google.blood_pressure:com.google.android.gms:merged": //BLOOD PRESSURE
        //SEND DATA valuesList TO WEKO
          String dataname = "bloodPressureDiastolic";
          var valuesList = <dynamic>[];
          datasetAsList(data, dataname, 0);
          // for (int i = 0; i < valuesList.length; i++) {
          //   if (i == 0 || i % 4 == 0) {
          //     innerData["bloodPressureSystolic"].add(valuesList[i]);
          //   }
          //   else if ( i % 4 == 1)
          //     {
          //       innerData["bloodPressureDiastolic"].add(valuesList[i]);
          //     }
          // }
          //innerData[dataname].add(valuesList);
          print("blood pressure: " + valuesList.toString());
          break;

        case "derived:com.google.oxygen_saturation:com.google.android.gms:merged": //OXYGEN
        //SEND DATA valuesList TO WEKO
        //latest & average
        //BLOOD SATURATION
          String dataname = "bloodOxygen";
          var valuesList = <dynamic>[];
          datasetAsList(data, dataname, 0);
          // for (int i = 0; i < valuesList.length; i++) {
          //   if(i == 0 || i % 5 == 0){
          //     innerData[dataname].add(valuesList[i]);
          //   }
          // }
          //innerData[dataname].add(valuesList[0]);
          print("oxygen: " + valuesList.toString());
          //valuesList[0] is saturation
          //.,..

          break;

        case "derived:com.google.heart_rate.bpm:com.google.android.gms:merge_heart_rate_bpm": //HEART RATE
          var valuesList = <dynamic>[];
          //SEND DATA valuesList TO WEKO
          String dataname = "heartRate";
          datasetAsList(data, dataname);
          print("heartRate: " + valuesList.toString());
          break;

        case "derived:com.google.body.temperature:com.google.android.gms:merged": //BODY TEMPERATURE
          //SEND DATA valuesList TO WEKO
          String dataname = "bodyTemperature";
          var valuesList = <dynamic>[];
          datasetAsList(data, dataname, 0);
          // for (int i = 0; i < valuesList.length; i++) {
          //   if(i == 0 || i % 2 == 0){
          //     innerData[dataname].add(valuesList[i]);
          //   }
          // }

          //innerData[dataname].add(valuesList);
          print("bodyTemperature: " + valuesList.toString());
          break;

        }
        print(innerData.toString());
    }
}
