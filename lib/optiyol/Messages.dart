import 'package:denge/optiyol/Layout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatefulWidget {
  final String name;

  const Messages({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String message = "aaaaaaaaa";
  late List<Map> messageMap = [];
  late var messages;
  late var messagesListen;

  //Future<QuerySnapshot<Map<String, dynamic>>>

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    //  getMessages();
    super.initState();
  }

  Future getMessages() async {
    try {
      messages = await firestore
          .collection("mesajlar")
          .doc("userid")
          .collection("mesaj")
          .get();
      messageMap.clear();
      for (var item in messages.docs) {
        messageMap.add(item.data());
      }
      return messageMap;
    } on Exception catch (e) {
      print(e.toString() + "xxxxxxx");
    }
  }

  // Future listenMessages() async {
  //   try {
  //     messagesListen = await firestore
  //         .collection("mesajlar")
  //         .doc("userid")
  //         .collection("mesaj")
  //         .snapshots();
  //     messageMap.clear();
  //     messagesListen.listen((event) {
  //       for (var item in event.docChanges) {
  //         messageMap.add(item.data());
  //       }
  //     });

  //     return messageMap;
  //   } on Exception catch (e) {
  //     print(e.toString() + "xxxxxxx");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: widget.name,
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffffffff), borderRadius: BorderRadius.circular(6)),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.abc_outlined,
              color: Color(0xff8181A5),
              size: 16,
            ),
          ),
        ),
      ],
      leading: Container(
        margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xffffffff), borderRadius: BorderRadius.circular(6)),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.abc_outlined,
            color: Color(0xff8181A5),
            size: 16,
          ),
        ),
      ),
      body: Container(
        color: Color(0xffF5F5FA),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.add_box,
                          size: 50,
                        ),
                        title: Text("Rota İsmi 01"),
                        subtitle: Text("08:20 - 12:00"),
                        // trailing: Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Icon(
                        //           Icons.circle,
                        //           color: Colors.green,
                        //         ),
                        //         Text("18"),
                        //       ],
                        //     ),
                        //     Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Icon(
                        //           Icons.circle,
                        //           color: Colors.red,
                        //         ),
                        //         Text("11"),
                        //       ],
                        //     ),
                        //     Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Icon(
                        //           Icons.circle,
                        //           color: Colors.yellow,
                        //         ),
                        //         Text("20"),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xfF5F5FA),
                child: FutureBuilder(
                    future: getMessages(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          reverse: true,
                          itemCount: messageMap.length,
                          itemBuilder: (BuildContext context, int index) {
                            return messageMap[index]["kimden"] == "userid"
                                ? GidenMesaj(
                                    message: messageMap[index]["mesaj"])
                                : GelenMesaj(
                                    message: messageMap[index]["mesaj"]);
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ),
            Container(
              color: Color(0xffF0F0F3),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Mesajınız...",
                        ),
                        onChanged: (value) {
                          message = value;
                        },
                      ),
                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.all(5),
                    //margin: EdgeInsets.all(2),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.abc_outlined),
                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.all(5),
                    //margin: EdgeInsets.all(2),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.attachment),
                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Color(0xff185CF7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: IconButton(
                      onPressed: () {
                        addData();
                      },
                      icon: Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addData() {
    Map<String, dynamic> addMessage = Map();
    addMessage["mesaj"] = message;
    addMessage["kimden"] = "userid";
    addMessage["kime"] = "userid2";
    addMessage["tarih"] = DateTime.now();

    firestore
        .collection("mesajlar")
        .doc("userid")
        .collection("mesaj")
        .doc()
        .set(addMessage)
        .onError((error, stackTrace) => print("eklenmedi $error"))
        .whenComplete(
          () => print("eklendi+ $message "),
        );

    firestore
        .collection("mesajlar")
        .doc("userid2")
        .collection("mesaj")
        .doc()
        .set(addMessage)
        .onError((error, stackTrace) => print("eklenmedi $error"))
        .whenComplete(
          () => print("eklendi+ $message "),
        );
  }
}

class GelenMesaj extends StatelessWidget {
  final String message;

  const GelenMesaj({
    Key? key,
    required this.message,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            radius: 15, //child: Icon(Icons.),
            backgroundColor: Colors.grey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Text(this.message),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("20:42"),
            ),
          ],
        ),
      ],
    );
  }
}

class GidenMesaj extends StatelessWidget {
  final String message;

  const GidenMesaj({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              //margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xff185CF7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Text(
                this.message,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("20:42"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey,

            //child: Icon(Icons.),
          ),
        ),
      ],
    );
  }
}


/*

Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.add_box,
                  size: 50,
                ),
                title: Text("Rota İsmi 01"),
                subtitle: Text("08:20 - 12:00"),
              ),
            ),
            Column(
              children: <Widget>[
                GidenMesaj(),
                GidenMesaj(),
                GelenMesaj(),
                GidenMesaj(),
                GelenMesaj(),
                GelenMesaj(),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Mesajınız...",
                  ),
                ),
              ],
            ),
          ],
        ),





title: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Text(
          "gelen mesaj",
          style: TextStyle(color: Colors.black),
        ),
      ),
      subtitle: Text("20:42"),
    );


*/


/*
 return Container(
      //color: Color(0xff334155),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff334155),
          leading: InkWell(
            child: Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Icon(
                Icons.expand_less_outlined,
                color: Color(0xff334155),
              ),
            ),
          ),
          //leading: IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
          actions: <Widget>[
            InkWell(
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Icon(
                  Icons.expand_less_outlined,
                  color: Color(0xff334155),
                ),
              ),
            ),
          ],
          title: Center(child: Text("Anıl Özdem")),
        ),
        body: Container(
          color: Color(0xffF5F5FA),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.add_box,
                            size: 50,
                          ),
                          title: Text("Rota İsmi 01"),
                          subtitle: Text("08:20 - 12:00"),
                          // trailing: Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.circle,
                          //           color: Colors.green,
                          //         ),
                          //         Text("18"),
                          //       ],
                          //     ),
                          //     Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.circle,
                          //           color: Colors.red,
                          //         ),
                          //         Text("11"),
                          //       ],
                          //     ),
                          //     Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.circle,
                          //           color: Colors.yellow,
                          //         ),
                          //         Text("20"),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        GidenMesaj(),
                        GelenMesaj(),
                        GidenMesaj(),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Mesajınız...",
                        ),
                        onChanged: (value) => setState(() {
                          message = value;
                        }),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(2),
                    child: Icon(Icons.qr_code_outlined),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(2),
                    child: Icon(Icons.attachment),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Color(0xff185CF7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: IconButton(
                      onPressed: () {
                        addData();
                      },
                      icon: Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

*/