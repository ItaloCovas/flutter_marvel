import 'package:flutter_marvel/api/events_api.dart';
import 'package:flutter_marvel/models/events_model.dart';
import 'package:mobx/mobx.dart';
part 'events_store.g.dart';

class EventsStore = _EventsStoreBase with _$EventsStore;

abstract class _EventsStoreBase with Store {
  EventsApi api = EventsApi();

  @observable
  ObservableList<EventsModel>? eventsModel;

  @observable
  int selectedIndex = 0;

  @observable
  bool isSearching = false;

  @observable
  String searchText = '';

  @action
  setSearchText(String value) {
    searchText = value;
  }

  @action
  toggleIsSearching() {
    isSearching = !isSearching;
  }

  @action
  getEventsList() {
    api.getEvents(name: searchText).then((eventsList) {
      eventsModel = eventsList;
      print('comics list changed');
      print(eventsList);
    });
  }
}
