import 'package:desafio_mobile_dev/app/data/models/photo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDB {
  var _events;

  HiveDB._create() {}

  static Future<HiveDB> create() async {
    final component = HiveDB._create();
    await component._init();
    return component;
  }

  _init() async {
    Hive.registerAdapter(PhotoModelAdapter());
    this._events = await Hive.openBox<PhotoModel>('events');
  }

  storeEvent(PhotoModel eventsMap) {
    this._events.put('events', eventsMap);
  }

  PhotoModel getEvents() {
    return this._events.get('events');
  }
}