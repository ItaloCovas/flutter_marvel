class EventsModel {
  int? id;
  String? title;
  String? description;
  String? resourceURI;
  List<Urls>? urls;
  String? modified;
  String? start;
  String? end;
  Thumbnail? thumbnail;
  Creators? creators;
  Creators? characters;
  Creators? stories;
  Creators? comics;
  Creators? series;
  Items? next;
  Items? previous;
  EventsModel(
      {this.id,
      this.title,
      this.description,
      this.resourceURI,
      this.urls,
      this.modified,
      this.start,
      this.end,
      this.thumbnail,
      this.creators,
      this.characters,
      this.stories,
      this.comics,
      this.series,
      this.next,
      this.previous});
  EventsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(new Urls.fromJson(v));
      });
    }
    modified = json['modified'];
    start = json['start'];
    end = json['end'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    creators = json['creators'] != null
        ? new Creators.fromJson(json['creators'])
        : null;
    characters = json['characters'] != null
        ? new Creators.fromJson(json['characters'])
        : null;
    stories =
        json['stories'] != null ? new Creators.fromJson(json['stories']) : null;
    comics =
        json['comics'] != null ? new Creators.fromJson(json['comics']) : null;
    series =
        json['series'] != null ? new Creators.fromJson(json['series']) : null;
    next = json['next'] != null ? new Items.fromJson(json['next']) : null;
    previous =
        json['previous'] != null ? new Items.fromJson(json['previous']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['resourceURI'] = this.resourceURI;
    if (this.urls != null) {
      data['urls'] = this.urls!.map((v) => v.toJson()).toList();
    }
    data['modified'] = this.modified;
    data['start'] = this.start;
    data['end'] = this.end;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    if (this.creators != null) {
      data['creators'] = this.creators!.toJson();
    }
    if (this.characters != null) {
      data['characters'] = this.characters!.toJson();
    }
    if (this.stories != null) {
      data['stories'] = this.stories!.toJson();
    }
    if (this.comics != null) {
      data['comics'] = this.comics!.toJson();
    }
    if (this.series != null) {
      data['series'] = this.series!.toJson();
    }
    if (this.next != null) {
      data['next'] = this.next!.toJson();
    }
    if (this.previous != null) {
      data['previous'] = this.previous!.toJson();
    }
    return data;
  }
}

class Urls {
  String? type;
  String? url;
  Urls({this.type, this.url});
  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class Thumbnail {
  String? path;
  String? extension;
  Thumbnail({this.path, this.extension});
  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}

class Creators {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;
  Creators({this.available, this.collectionURI, this.items, this.returned});
  Creators.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = this.returned;
    return data;
  }
}

class Items {
  String? resourceURI;
  String? name;
  String? role;
  Items({this.resourceURI, this.name, this.role});
  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    role = json['role'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    data['role'] = this.role;
    return data;
  }
}
