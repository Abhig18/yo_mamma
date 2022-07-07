import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:yo_mamma/screens/jokes_screen.dart';
import 'package:yo_mamma/services/json_query.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color _buttonColor = const Color(0xfffecd00);

  final Json _json = Json();

  bool? _isLoading;

  int count = 1;

  List<dynamic> jokeList = [];

  @override
  void initState() {
    _isLoading = true;

    jokeList;

    _getAllJokes();
    super.initState();
  }

  _getAllJokes() async {
    await _json.initJokes();

    setState(() {
      _isLoading = false;
    });
  }

  _randomJoke(BuildContext context) async {
    int getCount = await _countDialogBox();

    count = getCount;

    jokeList = _json.queryRandomJoke(count);

    if (!mounted) return;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => JokesScreen(jokeList: jokeList)));
  }

  Future<dynamic> _countDialogBox() {
    int currValue = 1;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('How many jokes can you handle?'),
            content: SpinBox(
                min: 1.0,
                max: 500.0,
                value: 1.0,
                onChanged: (double val) => currValue = val.toInt()),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(currValue),
                  child: const Text('Done',
                      style: TextStyle(
                        color: Colors.amber,
                      )))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _isLoading! ? _loading() : _body(context),
    );
    // return Scaffold(
    //   body: _isLoading! ? _loading() : _body(context),
    // );
  }

  Center _loading() {
    return Center(
      child: CircularProgressIndicator(
        color: _buttonColor,
      ),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Button to generate random jokes
          _randomJokeBtn(context),
          Image.asset('assets/images/image.png'),
          // Button to search for specific type of jokes
          // _searchJokeBtn()
        ],
      ),
    );
  }

  ElevatedButton _searchJokeBtn() {
    return ElevatedButton.icon(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_buttonColor),
        ),
        icon: const Icon(Icons.search),
        label: const Text('Search for your fetish here'));
  }

  ElevatedButton _randomJokeBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _randomJoke(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(_buttonColor),
      ),
      child: const Text('Gimme gimme'),
    );
  }
}
