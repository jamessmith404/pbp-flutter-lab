import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/my_watchlist_details.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/utils/fetch_data.dart';


class MyWatchlistPage extends StatefulWidget {
    const MyWatchlistPage({Key? key}) : super(key: key);

    @override
    _MyWatchlistPageState createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
    appBar: AppBar(
        title: const Text('My Watch List'),
    ),
    drawer: const LabDrawer(),
    body: FutureBuilder(
        future: fetchMyWatchlist(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } else {
            if (!snapshot.hasData) {
                return Column(
                children: const [
                    Text(
                    "Watch list kosong :(",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: (snapshot.data![index].fields.watched)
                                ? Border.all(width: 2.0, color: Colors.lightBlue)
                                : Border.all(width: 2.0, color: Colors.deepOrange)
                    ),
                    child: ListTile(
                        title: Text(
                          "${snapshot.data![index].fields.title}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Route menu ke halaman form
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyWatchlistRincianPage(
                                movie: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                );
            }
          }
        }
      )
    );
  }
}