//import 'package:flutter_weko/api_controller/apple/apple_types.dart';
//import 'package:flutter_weko/api_controller/unified_data.dart';
//import 'package:health/health.dart';

import 'package:google_flutter_con3/Googletesting/api_controller/google/google_types.dart';
import 'package:googleapis/fitness/v1.dart';

import '../unified_data.dart';

class GoogleHealthData extends UnifiedHealthData {
  GoogleHealthData() : super();

  void addDataList(List<Dataset> data) {
    data.forEach((dataset) {
      print(dataset.toJson().toString());
      addData(dataset);

    });

  }
  void addData(Dataset data) {
      String? dataType = GoogleTypes().appleToWekoBase[data.type];
      innerData[dataType!].add(data.value);
    }
}
