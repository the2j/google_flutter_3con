
class GoogleTypes {
  //const String device = "";

  static const derivedValues = [
    'derived:com.google.height:com.google.android.gms:merge_height',  //height
    'derived:com.google.weight:com.google.android.gms:merge_weight', //weight
    'derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas', //steps delta
    'derived:com.google.blood_pressure:com.google.android.gms:merged', //blood pressure
    'derived:com.google.heart_rate.bpm:com.google.android.gms:merge_heart_rate_bpm', //heart rate
    'derived:com.google.body.temperature:com.google.android.gms:merged', //body temperature
    'derived:com.google.oxygen_saturation:com.google.android.gms:merged' //blood oxygen
  ];

  static const Map<String?, String> googleToWekoBase = {
  //'derived:com.google.oxygen_saturation:com.google.android.gms:merged' //blood oxygen
  //
    //'activeEnergyBurned',
    //'basalEnergyBurned',
    //     'bloodGlucose',
    //     'bloodOxygen',
    'derived:com.google.blood_pressure:com.google.android.gms:merged': 'bloodPressureDiastolic', //NOTE CANNOT HAVE DUPE KEY, MANAGED IN ADDDATA FUNCTION
    //'derived:com.google.blood_pressure:com.google.android.gms:merged':  'bloodPressureSystolic',
    //     'bodyFatPercentage',
    //     'bodyMassIndex',
    //     'bodyTemperature',
    //     'electrodermalActivity',
    'derived:com.google.heart_rate.bpm:com.google.android.gms:merge_heart_rate_bpm': 'heart_rate',  //'heartRate',
  'derived:com.google.height:com.google.android.gms:merge_height':'height',//'height',
    //     'restingHeartRate',
    'derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas':'steps',  //'steps',
    //     'waistCircumference',
    //     'walkingHeartRate',
  'derived:com.google.weight:com.google.android.gms:merge_weight':'weight', //     'weight',
    //     'distanceWalkingRunning',
    //     'flightsClimbed',
    //     'moveMinutes',
    //     'distanceDelta',
    //     'mindfulness',
    //     'sleepInBed',
    //     'sleepAsleep',
    //     'sleepAwake',
    //     'water',
    //     'highHeartRateEvent',
    //     'lowHeartRateEvent',
    //     'irregularHeartRateEvent',
    //     'heartRateVariabilitySDNN',
    //     'swimDistance',
    //     'bikeDistane'
    };



//   static const Map<String, String> GoogleHealthRequests = {
//   'activeEnergyBurned':'',
//   'basalEnergyBurned':'',
//   'bloodGlucose':'',
//   'bloodOxygen':'',
//   'bloodPressureDiastolic':'',
//   'bloodPressureSystolic':'',
//   'bodyFatPercentage':'',
//   'bodyMassIndex':'',
//   'bodyTemperature':'',
//   'electrodermalActivity':'',
//   'heartRate':'',
//   'height': 'derived:com.google.height:com.google.android.gms:merge_height',
//   'restingHeartRate':'',
//   'steps':'derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas',
//   'waistCircumference':'',
//   'walkingHeartRate':'',
//   'weight':'derived:com.google.weight:com.google.android.gms:merge_weight',
//   'distanceWalkingRunning':'',
//   'flightsClimbed':'',
//   'moveMinutes':'',
//   'distanceDelta':'',
//   'mindfulness':'',
//   'sleepInBed':'',
//   'sleepAsleep':'',
//   'sleepAwake':'',
//   'water':'',
//   'highHeartRateEvent':'',
//   'lowHeartRateEvent':'',
//   'irregularHeartRateEvent':'',
//   'heartRateVariabilitySDNN':'',
//   'swimDistance':'',
//   'bikeDistance':''
//
// };




//
//   static Map <String, String> googleToWekoBase {
//
//   };
}