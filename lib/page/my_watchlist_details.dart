import 'package:counter_7/model/my_watchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/my_watchlist_page.dart';
import 'package:intl/intl.dart';


class MyWatchlistRincianPage extends StatefulWidget {
  MyWatchlistRincianPage({Key? key, required this.movie})
      : super(key: key);

  MyWatchlist movie;

  @override
  State<MyWatchlistRincianPage> createState() =>
      _MyWatchlistRincianPageState(movie);
}

class _MyWatchlistRincianPageState extends State<MyWatchlistRincianPage> {
  MyWatchlist movie;
  _MyWatchlistRincianPageState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Wish List'),
        ),
        drawer: const LabDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movie.fields.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Released Date: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMMd('en_US').format(movie.fields.releaseDate),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Rating: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${movie.fields.rating}/10")
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Status: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((movie.fields.watched) ? 'watched' : 'not watched')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Review: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(movie.fields.review)
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Route menu ke halaman form
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyWatchlistPage(),
                      ),
                    );
                  },
                  child: const Text("Back"))
            ],
          ),
        ));
  }
}