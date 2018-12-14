import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String body;

  // constructor
  Item({
    @required this.id,
    @required this.body
  });

  // For imuttable
  Item copyWith({ int id, String body }) {
    return Item(
      id: id ?? this.id,
      body: body ?? this.body,
    );
  }

}

class AppState {
  final List<Item> items;
  // constructor
  AppState({
    @required this.items,
  });

  // INITIAL STATE
  AppState.initialState() : items = List.unmodifiable(<Item>[]);

}