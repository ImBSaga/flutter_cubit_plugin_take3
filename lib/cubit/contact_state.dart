part of 'contact_cubit.dart';

@immutable
abstract class ContactState {
  const ContactState();
}

class ContactInitial extends ContactState {
  const ContactInitial();
}

class ContactLoaded extends ContactState {
  final List<ContactData> contact;
  const ContactLoaded(this.contact);
}
