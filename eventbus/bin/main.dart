import 'package:eventbus/eventbus.dart' as eventbus;
import 'package:event_bus/event_bus.dart';

class User {
  String name;
  User(name) {
    this.name = name;
  }
}

class UserLoggedEvent {
  User user;
  UserLoggedEvent(user) {
    this.user = user;
  }
}

void main(List<String> arguments) {
  var eventBus = EventBus();

  eventBus.on<UserLoggedEvent>().listen((event) {
    print('User ${event.user.name} logged in...');
  });

  print('Start...');
  var event = UserLoggedEvent(User('Tony'));
  eventBus.fire(event);
}
