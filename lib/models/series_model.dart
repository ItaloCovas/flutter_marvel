class SeriesModel {
  SeriesModel({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceURI,
    required this.urls,
    required this.startYear,
    required this.endYear,
    required this.rating,
    required this.type,
    required this.modified,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.comics,
    required this.events,
  });
  late final int id;
  late final String title;
  late final String description;
  late final String resourceURI;
  late final List<Urls> urls;
  late final int startYear;
  late final int endYear;
  late final String rating;
  late final String type;
  late final String modified;
  late final Thumbnail thumbnail;
  late final Creators creators;
  late final Characters characters;
  late final Stories stories;
  late final Comics comics;
  late final Events events;

  SeriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'] ?? 'Description not given :(';
    resourceURI = json['resourceURI'];
    urls = List.from(json['urls']).map((e) => Urls.fromJson(e)).toList();
    startYear = json['startYear'];
    endYear = json['endYear'];
    rating = json['rating'];
    type = json['type'];
    modified = json['modified'];
    thumbnail = Thumbnail.fromJson(json['thumbnail']);
    creators = Creators.fromJson(json['creators']);
    characters = Characters.fromJson(json['characters']);
    stories = Stories.fromJson(json['stories']);
    comics = Comics.fromJson(json['comics']);
    events = Events.fromJson(json['events']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['resourceURI'] = resourceURI;
    _data['urls'] = urls.map((e) => e.toJson()).toList();
    _data['startYear'] = startYear;
    _data['endYear'] = endYear;
    _data['rating'] = rating;
    _data['type'] = type;
    _data['modified'] = modified;
    _data['thumbnail'] = thumbnail.toJson();
    _data['creators'] = creators.toJson();
    _data['characters'] = characters.toJson();
    _data['stories'] = stories.toJson();
    _data['comics'] = comics.toJson();
    _data['events'] = events.toJson();
    return _data;
  }
}

class Urls {
  Urls({
    required this.type,
    required this.url,
  });
  late final String type;
  late final String url;

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['url'] = url;
    return _data;
  }
}

class Thumbnail {
  Thumbnail({
    required this.path,
    required this.extension,
  });
  late final String path;
  late final String extension;

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['path'] = path;
    _data['extension'] = extension;
    return _data;
  }
}

class Creators {
  Creators({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });
  late final int available;
  late final String collectionURI;
  late final List<Items> items;
  late final int returned;

  Creators.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['returned'] = returned;
    return _data;
  }
}

class Items {
  Items({
    required this.resourceURI,
    required this.name,
    required this.role,
  });
  late final String resourceURI;
  late final String name;
  late final String role;

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['resourceURI'] = resourceURI;
    _data['name'] = name;
    _data['role'] = role;
    return _data;
  }
}

class Characters {
  Characters({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });
  late final int available;
  late final String collectionURI;
  late final List<Items> items;
  late final int returned;

  Characters.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['returned'] = returned;
    return _data;
  }
}

class Stories {
  Stories({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });
  late final int available;
  late final String collectionURI;
  late final List<Items> items;
  late final int returned;

  Stories.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['returned'] = returned;
    return _data;
  }
}

class Comics {
  Comics({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });
  late final int available;
  late final String collectionURI;
  late final List<Items> items;
  late final int returned;

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['returned'] = returned;
    return _data;
  }
}

class Events {
  Events({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });
  late final int available;
  late final String collectionURI;
  late final List<dynamic> items;
  late final int returned;

  Events.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = List.castFrom<dynamic, dynamic>(json['items']);
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items;
    _data['returned'] = returned;
    return _data;
  }
}
