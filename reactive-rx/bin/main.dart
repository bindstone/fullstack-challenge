import 'package:reactive_rx/reactive_rx.dart' as reactive_rx;
import 'package:rxdart/rxdart.dart';

void main(List<String> arguments) {

  var behaviorSubject = BehaviorSubject<String>();
  behaviorSubject.add('Hello');

  behaviorSubject.stream.listen(print);
  behaviorSubject.stream.listen(print);

  behaviorSubject.add('World');

  behaviorSubject.stream.listen(print);
  behaviorSubject.stream.listen(print);
}
