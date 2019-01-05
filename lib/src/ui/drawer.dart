import 'package:flutter/material.dart';
import 'package:gdm/src/ui/home_page.dart';

class GdmDrawer extends StatelessWidget{
  final String route;

  const GdmDrawer({Key key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 30.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        Divider(),
        ListTile(
          title: Text('Home'),
          onTap: (){
            if(route != 'home'){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GdmHome()));
            }
          },
          selected: route == 'home',
        ),
        ListTile(
          title: Text('FeedBack'),
          onTap: (){},
          enabled: false,
          selected: route == 'feedback',
        ),
        ListTile(
          title: Text('AboutUs'),
          onTap: (){},
          enabled: false,
          selected: route == 'aboutus',
        ),
        ListTile(
          title: Text('Share App'),
          onTap: (){},
          enabled: false,
          selected: route == 'shareapp',
        ),
      ],
    );
  }
}
