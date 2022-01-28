import 'package:flutter/material.dart';
import 'package:flutter_marvel/controller/characters_store.dart';
import 'package:get_it/get_it.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final charactersStore = GetIt.I.get<CharactersStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    charactersStore.getCharactersList();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
