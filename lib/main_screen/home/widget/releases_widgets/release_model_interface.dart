import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';

abstract class ReleaseModelInterface{
  int get id;
  DateTime get lastUpdate;

  ReleaseType get releaseType;
}