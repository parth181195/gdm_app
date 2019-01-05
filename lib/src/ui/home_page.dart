import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdm/src/ui/details_page.dart';
import 'package:gdm/src/ui/drawer.dart';

class GdmHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GDM'),
      ),
      drawer: Drawer(
        child: GdmDrawer(
          route: 'home',
        ),
      ),
      body: HomeGrid(),
    );
  }
}

class HomeGrid extends StatefulWidget {
  @override
  HomeGridState createState() {
    return new HomeGridState();
  }
}

class HomeGridState extends State<HomeGrid> {
  CollectionReference _colReference = Firestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _colReference.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data.documents;
          print(snapshot.data.documents[0].data);
          return CustomScrollView(
            slivers: <Widget>[
              SliverGrid.count(
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                crossAxisCount: 2,
                children: List.generate(data.length, (index) {
                  return Material(
                    elevation: 1.0,
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Material(
//                        elevation: 10.0,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal:15.0,vertical: 5.0),
                                color:Colors.white,
                                child: Center(child: Text('${data[index].data['title']}'),widthFactor: 0,),
                                height: 35.0,
                                width: double.maxFinite,
                              ),
                              alignment: Alignment.bottomLeft,
                            ),
                            Ink.image(
                              fit: BoxFit.cover,
                              image: NetworkImage('${data[index].data['photourl']}',),
                              child: InkWell(
                                onTap: () {
//                                  _colReference.add(data[data.length-1].data);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    photoUrl: data[index].data['photourl'],
                                    title: data[index].data['title'],
                                    description: data[index].data['description'],
                                  )));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
