
class GoogleTypes {
  //const String device = "";

  static const derivedValues = [
    'derived:com.google.height:com.google.android.gms:merge_height',  //height
    'derived:com.google.weight:com.google.android.gms:merge_weight', //weight
    'derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas', //steps delta
    'derived:com.google.blood_pressure:com.google.android.gms:merged' //blood pressure

  ];

  static const Map<String, String> GoogleHealthRequests = {
  'activeEnergyBurned':'',
  'basalEnergyBurned':'',
  'bloodGlucose':'',
  'bloodOxygen':'',
  'bloodPressureDiastolic':'',
  'bloodPressureSystolic':'',
  'bodyFatPercentage':'',
  'bodyMassIndex':'',
  'bodyTemperature':'',
  'electrodermalActivity':'',
  'heartRate':'',
  'height': 'derived:com.google.height:com.google.android.gms:merge_height',
  'restingHeartRate':'',
  'steps':'derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas',
  'waistCircumference':'',
  'walkingHeartRate':'',
  'weight':'derived:com.google.weight:com.google.android.gms:merge_weight',
  'distanceWalkingRunning':'',
  'flightsClimbed':'',
  'moveMinutes':'',
  'distanceDelta':'',
  'mindfulness':'',
  'sleepInBed':'',
  'sleepAsleep':'',
  'sleepAwake':'',
  'water':'',
  'highHeartRateEvent':'',
  'lowHeartRateEvent':'',
  'irregularHeartRateEvent':'',
  'heartRateVariabilitySDNN':'',
  'swimDistance':'',
  'bikeDistance':''

};

  static const List<String> googleTypes = [
    ];


//
//   static Map <String, String> googleToWekoBase {
//
//   };
}