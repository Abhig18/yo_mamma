import 'package:flutter/material.dart';

class JokesScreen extends StatefulWidget {
  final List<dynamic> jokeList;
  const JokesScreen({Key? key, required this.jokeList}) : super(key: key);

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  final Color _buttonColor = const Color(0xfffecd00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.jokeList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 10,
                  color: _buttonColor,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  child: ListTile(
                    title: Text(
                      widget.jokeList[index],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.home,
          color: _buttonColor,
        ),
      ),
    );
  }
}
