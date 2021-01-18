import 'dart:async';

import 'package:contact/models/contact.dart';

class ContactData {
  List<Contact> _contactList = [
    Contact('Cheese', 'assets/cheese.jpg', 'Sweet ~'),
    Contact('Chocolate', 'assets/choco.jpg', 'More than cheese'),
    Contact('Mango', 'assets/mango.jpg', 'Swwweeeetttt'),
    Contact('Ice Cream', 'assets/ice.jpg', 'Colderr'),
    Contact('Smartphone', 'assets/phone.jpg', 'Techs'),
  ];

  final _listData = List<Contact>();

  get _list => _listData;

  fetchContact() {
    return _list.add(_contactList);
  }
}
