import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denge/utils/appColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  var box = Hive.box("achievements");
  String name = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String photoURL = "";

  Future<void> getName() async {
    var snapshot =
        await firestore.collection("users").doc(auth.currentUser!.uid).get();
    Map<String, dynamic>? dataMap = snapshot.data();

    name = dataMap!["nameSurname"];
    var _profilePhotoRef =
        FirebaseStorage.instance.ref("users/${auth.currentUser!.uid}");
    photoURL = await _profilePhotoRef.getDownloadURL();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    int correct = box.get("correct");
    int total = box.get("total");

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: darkColor,
        ),
        centerTitle: true,
        title: const Text(
          "Başarılar",
          style: TextStyle(color: darkColor, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * 2 / 3,
          height: MediaQuery.of(context).size.width * 2 / 3,
          child: Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: photoURL == ""
                      ? Container(color: darkColor)
                      : Image(fit: BoxFit.cover, image: NetworkImage(photoURL)),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: getBottomSheet,
                  icon: const Icon(
                    Icons.edit,
                    color: lightColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: darkColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          margin: const EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: 12,
          ),
          decoration: BoxDecoration(
              color: darkColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  "Doğru Cevap Sayısı:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: lightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  correct.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: darkColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          margin: const EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: 12,
          ),
          decoration: BoxDecoration(
              color: darkColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  "Çözülen Soru Sayısı :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: lightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                width: 100,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  total.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: darkColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          margin: const EdgeInsets.only(
            left: 28,
            right: 28,
            bottom: 12,
          ),
          decoration: BoxDecoration(
              color: darkColor, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Başarı Yüzdesi : ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: darkColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      total != 0
                          ? "% ${((correct / total) * 100).toStringAsFixed(2)}"
                          : "0",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: darkColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Slider(
                activeColor: Colors.green,
                inactiveColor: lightColor,
                value: total != 0 ? ((correct / total) * 100) : 0,
                onChanged: (value) {},
                min: 0,
                max: 100,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void getBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: lightColor,
        builder: (context) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                          color: darkColor,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: const Text(
                        "Profil Fotoğrafı Değiştir",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkColor),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton.extended(
                          backgroundColor: darkColor,
                          onPressed: (() async {
                            final XFile? image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              await photoChange(File(image.path));
                              setState(() {});
                            }
                          }),
                          elevation: 0,
                          label: const Text(
                            "Galeriden Seç",
                            style: TextStyle(color: lightColor),
                          ),
                          icon: const Icon(
                            Icons.image,
                            color: lightColor,
                          ),
                        ),
                        FloatingActionButton.extended(
                          backgroundColor: darkColor,
                          onPressed: (() async {
                            final XFile? image = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (image != null) {
                              await photoChange(File(image.path));
                              setState(() {});
                            }
                          }),
                          elevation: 0,
                          label: const Text(
                            "Fotoğraf Çek",
                            style: TextStyle(color: lightColor),
                          ),
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            color: lightColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  Future<void> photoChange(File imageFile) async {
    var _profilePhotoRef =
        FirebaseStorage.instance.ref("users/${auth.currentUser!.uid}");
    _profilePhotoRef.putFile(imageFile).whenComplete(() async {
      photoURL = await _profilePhotoRef.getDownloadURL();
      print(photoURL + "***xxxxxxxx***");
      setState(() {});
    });
  }
}
