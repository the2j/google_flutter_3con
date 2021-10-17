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
      //get data in the correct format - so basically it is just the right values within a list
      switch(dataType) {
        case "derived:com.google.weight:com.google.android.gms:merge_weight":  //WEIGHT
          var valuesList = <dynamic>[];
          data.point!.forEach((datapoint) {
            datapoint.value!.forEach((datavalue) {
              if(datavalue.fpVal != null) valuesList.add(datavalue.fpVal!);
              else  {
                if (datavalue.intVal != null) valuesList.add(datavalue.intVal!);
              }
            });
          });

          //SEND DATA valuesList TO WEKO
          String dataname = "weight";
          innerData[dataname].add(valuesList);
          print("weight: " + valuesList.toString());
          break;

        case "derived:com.google.height:com.google.android.gms:merge_height":  //HEIGHT
          var valuesList = <dynamic>[];
          data.point!.forEach((datapoint) {
            datapoint.value!.forEach((datavalue) {
              if(datavalue.fpVal != null) valuesList.add(datavalue.fpVal!);
              else  {
                if (datavalue.intVal != null) valuesList.add(datavalue.intVal!);
              }
            });
          });

          //SEND DATA valuesList TO WEKO
          String dataname = "height";
          innerData[dataname].add(valuesList);
          print("height: " + valuesList.toString());
          break;

        case "derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas": //STEPS
          var valuesList = <dynamic>[];
          data.point!.forEach((datapoint) {
            datapoint.value!.forEach((datavalue) {
              if(datavalue.fpVal != null) valuesList.add(datavalue.fpVal!);
              else  {
                if (datavalue.intVal != null) valuesList.add(datavalue.intVal!);
              }
            });
          });

          //SEND DATA valuesList TO WEKO
          String dataname = "steps";
          innerData[dataname].add(valuesList);
          print("steps: " + valuesList.toString());
          break;

        case "derived:com.google.blood_pressure:com.google.android.gms:merged": //BLOOD PRESSURE
          var valuesList = <dynamic>[];
          data.point!.forEach((datapoint) {
            datapoint.value!.forEach((datavalue) {
              if(datavalue.fpVal != null) valuesList.add(datavalue.fpVal!);
              else  {
                if (datavalue.intVal != null) valuesList.add(datavalue.intVal!);
              }
            });
          });

          //SEND DATA valuesList TO WEKO
          String dataname = "bloodPressureDiastolic";
          innerData[dataname].add(valuesList);
          print("blood pressure: " + valuesList.toString());
          break;

        case "derived:com.google.oxygen_saturation:com.google.android.gms:merged": //OXYGEN
          var valuesList = <dynamic>[];
          data.point!.forEach((datapoint) {
            datapoint.value!.forEach((datavalue) {
              if(datavalue.fpVal != null) valuesList.add(datavalue.fpVal!);
              else  {
                if (datavalue.intVal != null) valuesList.add(datavalue.intVal!);
              }
            });
          });

          //SEND DATA valuesList TO WEKO
          String dataname = "bloodOxygen";
          innerData[dataname].add(valuesList);
          print("oxygen: " + valuesList.toString());

          //valuesList[0] is saturation
          //.,..

          break;

        case "derived:com.google.heart_rate.bpm:com.google.android.gms:merge_heart_rate_bpm": //HEART RATE
          var valuesList = <dynamic>[];
          data.point!.forEach((datapoint) {
            datapoint.value!.forEach((datavalue) {
              if(datavalue.fpVal != null) valuesList.add(datavalue.fpVal!);
              else  {
                if (datavalue.intVal != null) valuesList.add(datavalue.intVal!);
              }
            });
          });

          //SEND DATA valuesList TO WEKO
          String dataname = "heartRate";
          innerData[dataname].add(valuesList);
          print("heartRate: " + valuesList.toString());
          break;

        case "derived:com.google.body.temperature:com.google.android.gms:merged": //BODY TEMPERATURE
          var valuesList = <dynamic>[];
          data.point!.forEach((datapoint) {
            datapoint.value!.forEach((datavalue) {
              if(datavalue.fpVal != null) valuesList.add(datavalue.fpVal!);
              else  {
                if (datavalue.intVal != null) valuesList.add(datavalue.intVal!);
              }
            });
          });

          //SEND DATA valuesList TO WEKO
          String dataname = "bodyTemperature";
          innerData[dataname].add(valuesList);
          print("bodyTemperature: " + valuesList.toString());
          break;
        }
    }
}
