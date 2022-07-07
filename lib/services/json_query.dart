import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:yo_mamma/services/random_numbers.dart';

class Json {
  List<dynamic>? allJokes;
  List<dynamic> jokes = [];

  initJokes() async {
    String data = await rootBundle.loadString('assets/data/jokes.json');

    allJokes = List<dynamic>.from(json.decode(data));
  }

  List<dynamic> queryRandomJoke(int count) {
    int max = allJokes!.length;
    jokes.clear();

    Set<int> indices = generateRandomNumbers(count, max);

    for (int index in indices) {
      jokes.add(allJokes![index]);
    }

    return jokes;
  }
}
