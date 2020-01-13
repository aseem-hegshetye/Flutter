import 'package:flutter/material.dart';
import 'package:dwun/widgets/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchCardsPage extends StatefulWidget {
  final String collectionName;
  final String cardTitleKey; // in BusinessCategory collection - title = name, subtitle=desc
  final String cardSubTitleKey;
  final String searchBarHintText;

  SearchCardsPage({
    @required this.collectionName,
    @required this.cardTitleKey,
    @required this.cardSubTitleKey,
    this.searchBarHintText = 'Search',
  });

  @override
  _SearchCardsPageState createState() => _SearchCardsPageState();
}

class _SearchCardsPageState extends State<SearchCardsPage> {
  List tasksList = [];
  List<DocumentSnapshot> allDocuments;

  // we need to show title and subtitle with capitalizations as it is in nosql db.
  // hence for now comment this func out
//  convertAllTitlesAndSubtitlesInDocSnapshotToLowerCase(List<DocumentSnapshot> ipList, String title, String subtitle) {
//    // takes a list and itereates over it. converts titles and subtitles to lowecase
//    int index = 0;
//    for (var doc in ipList) {
//      ipList[index].data[title] = doc.data[title].toString().toLowerCase();
//      ipList[index].data[subtitle] = doc.data[subtitle].toString().toLowerCase();
//      index++;
//    }
//  }

  getAllDocumentsInACollection() async {
    // retrieve all documents once in the beginning and store them in class variable.
    print('getAllDocumentsInACollection');
    QuerySnapshot doc = await Firestore.instance.collection(widget.collectionName).getDocuments();
    setState(() {
      this.allDocuments = doc.documents;
    });
//    convertAllTitlesAndSubtitlesInDocSnapshotToLowerCase(this.allDocuments, widget.cardTitleKey, widget.cardSubTitleKey);
  }

  filterListViewData({searchText}) {
    // filter based on title and subtitle
    print('filterListViewData');
    if (this.allDocuments != null) {
      // iterating on null gives error in flutter
      setState(() {
        this.tasksList.clear();
      });
      for (var doc in this.allDocuments) {
        print(doc.documentID);
        if (doc.data[widget.cardTitleKey].toString().toLowerCase().contains(searchText.toLowerCase()) ||
            doc.data[widget.cardSubTitleKey].toString().toLowerCase().contains(searchText.toLowerCase())) {
//        if (doc.data[widget.cardTitleKey].contains(searchText.toLowerCase())) {
          setState(() {
            this.tasksList.add(
                  CardInListView(
                    title: doc.data[widget.cardTitleKey],
                    subTitle: doc.data[widget.cardSubTitleKey],
                    id: doc.documentID,
                  ),
                );
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAllDocumentsInACollection();
    filterListViewData(searchText: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        appBar: AppBar(),
        showSignOutBtn: true,
      ),
      body: Container(
        color: Colors.blueGrey[300],
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: widget.searchBarHintText,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: EdgeInsets.all(16),
              ),
              onChanged: (value) {
                print(value);
                filterListViewData(searchText: value);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return tasksList[index];
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CardInListView extends StatelessWidget {
  final String title;
  final String id;
  final String subTitle;
  CardInListView({@required this.title, @required this.subTitle, @required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: () {
          print(this.id);
        },
        title: Text(this.title),
        subtitle: Text(this.subTitle),
      ),
    );
  }
}
