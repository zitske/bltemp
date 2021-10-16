import 'package:esptouch_flutter/esptouch_flutter.dart';

// Somewhere in your widget...
final ESPTouchTask task = ESPTouchTask(
  ssid: 'My WiFi network',
  bssid: 'ab:cd:ef:12:23:34',
  password: 'I love SMAHO',
);
final Stream<ESPTouchResult> stream = task.execute();
final printResult = (ESPTouchResult result) {
 print('IP: ${result.ip} MAC: ${result.bssid}');
};
StreamSubscription<ESPTouchResult> streamSubscription = stream.listen(printResult);

// Don't forget to cancel your stream subscription.
// You might cancel after the UDP wait+send time has passed (default 1 min)
// or you could cancel when the user asked to cancel
// for example, either via X button, or popping a route off the stack.
streamSubscription.cancel();