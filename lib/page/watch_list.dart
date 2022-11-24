import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/list_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyWatchListPage extends StatefulWidget {
    const MyWatchListPage({super.key});

    @override
    State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  Future<List<MyWatchList>> fetchWatchList() async {
    var url = Uri.parse('https://pbp-2006489634.herokuapp.com/mywatchlist/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<MyWatchList> watchList = [];
    for (var d in data) {
      if (d != null) {
        watchList.add(MyWatchList.fromJson(d));
      }
    }
    return watchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: myDrawer(context),
      body: FutureBuilder(
        future:  fetchWatchList(),
        builder: ((context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    'Watch list Is empty',
                    style: TextStyle(
                      color: Color(0xff59A5D8),
                      fontSize: 20
                      ),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index)=> Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyDetailPage(watchList: snapshot.data![index],))
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "${snapshot.data![index].title}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        }),
      )
    );
  }
}

