import 'package:denge/optiyol/Layout.dart';
import 'package:denge/optiyol/Messages.dart';
import 'package:flutter/material.dart';

class MessageUsers extends StatefulWidget {
  const MessageUsers({Key? key}) : super(key: key);

  @override
  _MessageUsersState createState() => _MessageUsersState();
}

class _MessageUsersState extends State<MessageUsers> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Mesajlar",
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffffffff), borderRadius: BorderRadius.circular(6)),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.ac_unit_rounded,
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
          onPressed: () {},
          icon: Icon(
            Icons.ac_unit_rounded,
            color: Color(0xff8181A5),
            size: 16,
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(height: 13),
      //       Users(
      //         name: 'Anıl Özdem',
      //         companyName: 'MNG Kargo',
      //       ),
      //       Users(
      //         name: 'Murat Gürzumar',
      //         companyName: 'DHL',
      //       ),
      //     ],
      //   ),
      // ),

      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(height: 13),
              Users(
                name: 'Anıl Özdem',
                companyName: 'MNG Kargo',
              ),
              Users(
                name: 'Murat Gürzumar',
                companyName: 'DHL',
              ),
            ],
          );
        },
      ),
    );
  }
}

class Users extends StatelessWidget {
  final String name;
  final String companyName;
  final Image? companyLogo;

  const Users(
      {Key? key,
      required this.name,
      required this.companyName,
      this.companyLogo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Messages(
              name: this.name,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(13, 5, 13, 0),
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Color(0xffECECF2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          color: Color(0xffD8D8D8),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.circle_rounded,
                          color: Color(0xff6DD400),
                          size: 14,
                        ))
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.name,
                      style: TextStyle(
                          color: Color(0xff1C1D21),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    Text(
                      this.companyName,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: Color(0xff8181A5),
                      ),
                    ),
                  ],
                )
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.mail_outline_outlined,
                color: Color(0xff6DD400),
                size: 20,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Messages(
                      name: this.name,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
