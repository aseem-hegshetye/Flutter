import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// create a class to store our provider data
class CardInListViewModel with ChangeNotifier {
  Function onTapFunc;

  CardInListViewModel({this.onTapFunc});

  // this func calls onTapFunc which was passed while creating obj of this class
  providerFunc(String id) {
    this.onTapFunc(id);
  }
}

// main stateless widget. Here we declare the ChangeNotifierProvider widget for class CardInListViewModel
// this data is accessible in any of its child widget using provider.
class BusinessSearchProfessions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // creating change notifier widget
      create: (_) => CardInListViewModel(
        onTapFunc: (id) {
          // passing a func for model class constructor
          print('provider yay $id');
        },
      ),
      child: SearchCardsPage(),
    );
  }
}

class SearchCardsPage extends StatefulWidget {
  @override
  _SearchCardsPageState createState() => _SearchCardsPageState();
}

class _SearchCardsPageState extends State<SearchCardsPage> {
  List ids = [1, 123, 32132];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(
          child: ListTile(
            onTap: () {
              // if we pass this func through BusinessSearchProfessions without using provider class
              // we wont be able to pass ids[1].
              // by using provider we are able to pass ids[1] back to parent func. its awesome !
              Provider.of<CardInListViewModel>(context).providerFunc(ids[1]);
            },
            title: Text('Title'),
            subtitle: Text('Subtitle'),
          ),
        ),
      ),
    );
  }
}
