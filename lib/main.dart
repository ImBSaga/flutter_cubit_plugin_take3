import 'package:contact/UI/home.dart';
import 'package:contact/cubit/contact_cubit.dart';
import 'package:contact/models/contactData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ContactCubit(ContactData()),
        child: Home(),
      ),
    );
  }
}
