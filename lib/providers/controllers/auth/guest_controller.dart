import 'package:flutter_riverpod/flutter_riverpod.dart';



class GuestController extends StateNotifier<bool> {
  GuestController() : super(false); // false = not guest (default)

  void enableGuest() {
    state = true;
  }

  void disableGuest() {
    state = false;
  }

  void setGuest(bool value) {
    state = value;
  }
}
