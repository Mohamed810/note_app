import 'dart:async';
import 'package:flutter/material.dart';
import 'package:note_app/modal_class/testNotes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int axisCount = 2;
  int count = 0;
  List<Note> noteList =[
    Note(title: 'Note1',date: '8/10/1999',description: 'dhjvsbdfjh'),
    Note(title: 'Note2',date: '8/10/1999',description: 'dhjvsbdfjh'),
    Note(title: 'Note3',date: '8/10/1999',description: 'dhjvsbdfjh'),
    Note(title: 'Note4',date: '8/10/1999',description: 'dhjvsbdfjh'),
    Note(title: 'Note5',date: '8/10/1999',description: 'dhjvsbdfjh'),
    Note(title: 'Note6',date: '8/10/1999',description: 'dhjvsbdfjh'),
    Note(title: 'Note7',date: '8/10/1999',description: 'dhjvsbdfjh'),
    Note(title: 'Note8',date: '8/10/1999',description: 'dhjvsbdfjh'),
    Note(title: 'Note9',date: '8/10/1999',description: 'dhjvsbdfjh'),

  ];

  @override
  Widget build(BuildContext context) {

    Widget myAppBar() {
      return AppBar(
        title: Text('My Notes',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () async {
              // final Note result = await showSearch(
              //     context: context, delegate: NotesSearch(notes: noteList));
              // if (result != null) {
              //   navigateToDetail(result, 'Edit Note');
              // }
            },
          ),
          IconButton(
            icon: Icon(
              axisCount == 2 ? Icons.more_vert : Icons.grid_on,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                axisCount = axisCount == 2 ? 4 : 2;
              });
            },
          ),
        ],
      );
    }

    Widget SideMenu(){
      return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: myAppBar(),

      drawer: SideMenu(),

      body: noteList.length == 0
          ? Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Click on the add button to add a new note!',
            ),
          ),
        ),
      )
          : Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: getNotesList(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Add Note',
        shape: CircleBorder(side: BorderSide(color: Colors.black, width: 2.0)),
        child: Icon(Icons.add, color: Colors.white,size: 50,),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );

  }
  Widget getNotesList() {
    return StaggeredGridView.countBuilder(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 4,
      itemCount: noteList.length,
      itemBuilder: (BuildContext context, int index) => Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          this.noteList[index].title,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        setState(() {

                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            this.noteList[index].description == null
                                ? ''
                                : this.noteList[index].description,
                            style: TextStyle(fontSize: 12)
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(this.noteList[index].date,
                          style: TextStyle(fontSize: 10)
                      ),
                    ]
                )
              ],
            ),
          ),
        ),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(axisCount),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
