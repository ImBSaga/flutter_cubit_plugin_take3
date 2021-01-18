import 'package:contact/cubit/contact_cubit.dart';
import 'package:contact/models/contactData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Select Contact",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Text(
                    "5 Contacts",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () => print('Search'),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () => print('More'),
          ),
        ],
      ),
      body: Container(
        child: BlocBuilder<ContactCubit, ContactState>(
          builder: (context, cubitState) {
            return ListView.builder(
              itemCount: cubitState.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            child: ClipOval(
                              child: Image(
                                height: 50.0,
                                width: 50.0,
                                image: AssetImage(
                                    snapshot.data[index].contactImageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${snapshot.data[index].contactName}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${snapshot.data[index].contactStatus}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ],
                          )),
                          trailing: Container(
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _contactBloc.deleteTapSink
                                    .add(snapshot.data[index]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // Widget contact() {
  //   return BlocBuilder<>(
  //     builder: (context, snapshot) {
  //       return
  //     },
  //   );
  // }
}
