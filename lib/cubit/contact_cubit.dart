import 'package:bloc/bloc.dart';
import 'package:contact/models/contact.dart';
import 'package:contact/models/contactData.dart';
import 'package:meta/meta.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactData _contactList;
  ContactCubit(this._contactList) : super(ContactInitial());

  void getContact(Contact contact) {
    final contact = _contactList.fetchContact();
    emit(ContactLoaded(contact));
  }
}
