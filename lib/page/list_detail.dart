import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MyDetailPage extends StatefulWidget {
    const MyDetailPage({
      super.key,
      required this.watchList,
    });
    final MyWatchList watchList;
    @override
    State<MyDetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: myDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.watchList.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0
            ),
          ),
          Text("Release Date: ${DateFormat('MMM d, yyyy').format(widget.watchList.release_date)}"),
          Text("Rating: ${widget.watchList.rating}/5.0"),
          Text("Status: ${widget.watchList.watched? "Watched":"Not Watched"}"),
          Text(
            "Review",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(widget.watchList.review)
        ],
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Back",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}