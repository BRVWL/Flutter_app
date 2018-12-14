// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_app/model/model.dart';
import 'package:my_app/redux/actions.dart';
import 'package:my_app/redux/reducer.dart';

// You can use a relative import, i.e. `import 'category.dart;'` or
// a package import, as shown below.
// More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html

/// The function that is called when main.dart is run.
void main() {
  runApp(MyApp());
}

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add 'appStateReducer' reduser from store to root widget
    final Store<AppState> store = Store<AppState>(
      appStateReducer(),
      initialState: AppState.initialState(),
    );

    // Pass provider with store to widget
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Redux',
        theme: ThemeData.dark(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Redux Items'),
          ),
          body: StoreConnector<AppState, _ViewModel>(
            converter: (Store<AppState> store) => _ViewModel.create(store),
            builder: (BuildContext context, _ViewModel viewModel) => Column(
                  children: <Widget>[
                    AddItemWidget(viewModel),
                    Expanded(child: ItemListWidget(viewModel)),
                    RemoveItemsButton(viewModel),
                  ],
                ),
          )),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  final _ViewModel model;
  ItemListWidget(this.model);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: model.items.map((Item item) => ListTile(
        title: Text(item.body),
        leading: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => model.onRemoveItem(item),
        ),
      )).toList(),
    );
  }
}

class AddItemWidget extends StatefulWidget {
  final _ViewModel model;
  AddItemWidget(this.model);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Add an Item',
      ),
      onSubmitted: (String s) {
        widget.model.onAddItem(s);
        controller.text = '';
      },
    );
  }
}

class RemoveItemsButton extends StatelessWidget {
  final _ViewModel model;

  RemoveItemsButton(this.model);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Delete all items'),
      onPressed: () => model.onRemoveAllItems(),
    );
  }

}

class _ViewModel {
  // Created action events for view
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveAllItems;

  // constructor
  _ViewModel({
    this.items,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveAllItems,
  });

  // Map funcs to ViewMode
  factory _ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveAllItems() {
      store.dispatch(RemoveAllItemsAction());
    }

    return _ViewModel(
      items: store.state.items,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveAllItems: _onRemoveAllItems,
    );
  }
}
