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
/// sends each avalible health dataset to addData
  /// [data] list of google datasets
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
      print(data.dataSourceId.toString());
      data.point!.forEach((datapoint) {
        int pos = 0;
        datapoint.value!.forEach((datavalue) {
          if (indx == -1 || indx == pos) {
            print("value found of: " + wekoType);
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

              //a hyper specific case - calculates bike distance (km)
              if (wekoType == 'bikeDistance' && datavalue.intVal != null)
                {valuesList.add(datavalue.intVal!*0.001954013);}
            }
          }
          pos++;
        });

    });
      print(">[");
      valuesList.forEach((element) {print(">- " + element.toString() + ", ");});
      print(">]");
      //add data to innerData map that will be sent to weko
      if (valuesList.length > 0) {
        print("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
        for (int i = 0; i < valuesList.length; i++) {
          print(i.toString());
          innerData[wekoType].add(valuesList[i]);

        }
        print("_____________W END____________");
        //add values to innerdata to transfer to weko
        //return valuesList;
      }
      else print("no values for: " + wekoType + "  LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

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
        case "derived:com.google.height:com.google.android.gms:merge_height":  //HEIGHT
        case "derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas": //STEPS
        case "derived:com.google.cycling.wheel_revolution.cumulative:com.google.android.gms:merged": //BIKE DISTANCE
          datasetAsList(data, GoogleTypes.googleToWekoBase[dataType].toString() );
          break;

        case "derived:com.google.blood_pressure:com.google.android.gms:merged": //BLOOD PRESSURE
        //BLOOD PRESSURE
          datasetAsList(data, "bloodPressureSystolic", 0);
          datasetAsList(data, "bloodPressureDiastolic", 1);
          //BLOOD PRESSURE - DIASSTOLIC AND SYSTOLIC
          break;

        case "derived:com.google.oxygen_saturation:com.google.android.gms:merged"://BLOOD OXYGEN
        case "derived:com.google.heart_rate.bpm:com.google.android.gms:merge_heart_rate_bpm"://HEART RATE
        case "derived:com.google.body.temperature:com.google.android.gms:merged"://BODY TEMPERATURE
        case "derived:com.google.blood_glucose:com.google.android.gms:merged": //BLOOD GLUCOSE
        case "derived:com.google.body.fat.percentage:com.google.android.gms:merged": //BODY FAT %
        case "derived:com.google.active_minutes:com.google.android.gms:merged": //MOVE MINUTES
          datasetAsList(data, GoogleTypes.googleToWekoBase[dataType].toString(), 0);
          break;
        //calories
        case 'derived:com.google.calories.expended:com.google.android.gms:merge'://'activeEnergyBurned' - custom since their isnt one for just active lol
          print("not implimented!");
          break;
        case 'derived:com.google.calories.bmr:com.google.android.gms:merged': //'basalEnergyBurned',
          datasetAsList(data, GoogleTypes.googleToWekoBase[dataType].toString(), 0);
          break;
        //bike distance custom




        //sleep cases

        }

    }
}
