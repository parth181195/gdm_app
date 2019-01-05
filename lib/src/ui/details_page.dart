import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:gdm/src/ui/drawer.dart';

class DetailsPage extends StatefulWidget {
  final String photoUrl;
  final String title;
  final String description;

  const DetailsPage({Key key, this.photoUrl, this.title, this.description})
      : super(key: key);

  @override
  DetailsPageState createState() {
    return new DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.share),
        onPressed: () async {
          await EsysFlutterShare.shareText(
              '${widget.photoUrl} ${widget.title}', '${widget.title}');
        },
      ),
      drawer: Drawer(child: GdmDrawer(route: 'details')),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("${widget.title}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    '${widget.photoUrl}',
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 10.0,
          ),
          child: Text('${widget.description}'),
        ),
      ),
    );
  }
}
