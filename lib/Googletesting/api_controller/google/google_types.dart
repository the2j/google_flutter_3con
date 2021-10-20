
class GoogleTypes {
  //const String device = "";

  static const derivedValues = [
    'derived:com.google.height:com.google.android.gms:merge_height',  //height
    'derived:com.google.weight:com.google.android.gms:merge_weight', //weight
    'derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas', //steps delta
    'derived:com.google.blood_pressure:com.google.android.gms:merged', //blood pressure
    'derived:com.google.heart_rate.bpm:com.google.android.gms:merge_heart_rate_bpm', //heart rate
    'derived:com.google.body.temperature:com.google.android.gms:merged', //body temperature
    'derived:com.google.oxygen_saturation:com.google.android.gms:merged', //blood oxygen
    'derived:com.google.blood_glucose:com.google.android.gms:merged', //blood glucose
    'derived:com.google.body.fat.percentage:com.google.android.gms:merged', //     'bodyFatPercentage',
    'derived:com.google.cycling.wheel_revolution.cumulative:com.google.android.gms:merged', //distance road - calc via revolutions
    'derived:com.google.active_minutes:com.google.android.gms:merged', //move minutes
    'derived:com.google.calories.expended:com.google.android.gms:merge',//'activeEnergyBurned' - custom since their isnt one for just active lol
    'derived:com.google.calories.bmr:com.google.android.gms:merged',//'basalEnergyBurned',



  ];

  static const Map<String?, String> googleToWekoBase = {
  //'derived:com.google.oxygen_saturation:com.google.android.gms:merged' //blood oxygen
  //
    'derived:com.google.calories.expended:com.google.android.gms:merge':'activeEnergyBurned',//'activeEnergyBurned' - custom since their isnt one for just active lol
    'derived:com.google.calories.bmr:com.google.android.gms:merged': 'basalEnergyBurned',//'basalEnergyBurned',
    'derived:com.google.blood_glucose:com.google.android.gms:merged':    'bloodGlucose', //BLOOD GLUCOSE
    'derived:com.google.oxygen_saturation:com.google.android.gms:merged': 'bloodOxygen', //OXYGEN BLOOD LEVEL - SATURATION
    'derived:com.google.blood_pressure:com.google.android.gms:merged': 'bloodPressureDiastolic', //BLOOD PRESSURE
    //'derived:com.google.blood_pressure:com.google.android.gms:merged':  'bloodPressureSystolic', //NOTE CANNOT HAVE DUPE KEY, MANAGED IN ADDDATA FUNCTION
    'derived:com.google.body.fat.percentage:com.google.android.gms:merged': 'bodyFatPercentage', //BODY FAT %
    //'derived:com.google.'  'bodyMassIndex', DOES NOT EXIST FOR GOOGLE FIT
    'derived:com.google.body.temperature:com.google.android.gms:merged':  'bodyTemperature',
    //     'electrodermalActivity',
    'derived:com.google.heart_rate.bpm:com.google.android.gms:merge_heart_rate_bpm': 'heartRate',  //'heartRate',
  'derived:com.google.height:com.google.android.gms:merge_height':'height',//'height',
    //     'restingHeartRate',
    'derived:com.google.step_count.delta:com.google.android.gms:merge_step_deltas':'steps',  //'steps',
    //     'waistCircumference',
    //     'walkingHeartRate',
  'derived:com.google.weight:com.google.android.gms:merge_weight':'weight', //     'weight',
    //     'distanceWalkingRunning',
    //     'flightsClimbed',
    'derived:com.google.active_minutes:com.google.android.gms:merged':  'moveMinutes', //move minutes
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
    'derived:com.google.cycling.wheel_revolution.cumulative:com.google.android.gms:merged':     'bikeDistane' //bike distance
    };


}