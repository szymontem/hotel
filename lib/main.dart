import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var hotelController='Hotel Gołębiewski Warszawa';
  var doubleBedsController = '1';
  var singleBedsController = '1';
  var floorController = '0';
  var vipController = false;
  var miniBarController = false;
  var privateKitchenController = false;
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(0),
                      height: 565,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.all(7),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Hotel",style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'trebuchet ms',
                                fontSize: 30
                            )),
                            DropdownButton<String>(
                              value: hotelController,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  hotelController = newValue!;
                                });
                              },
                              items: <String>['Hotel Gołębiewski Warszawa','Hotel Gołębiewski Kraków',
                                'Hotel Gołębiewski Gdańsk','Hotel Gołębiewski Poznań',
                                'Hotel Gołębiewski Wrocław','Hotel Gołębiewski Szczecin']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'trebuchet ms',
                                      fontSize: 20
                                  )),
                                );
                              }).toList(),
                            ),
                            const Text("Ilość łóżek podwójnych",style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'trebuchet ms',
                                fontSize: 30
                            )),
                            DropdownButton<String>(
                              value: doubleBedsController,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  doubleBedsController = newValue!;
                                });
                              },
                              items: <String>['0','1','2','3']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'trebuchet ms',
                                      fontSize: 20
                                  )),
                                );
                              }).toList(),
                            ),
                            const Text("Ilość łóżek pojedyńczych",style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'trebuchet ms',
                                fontSize: 30
                            )),//lozka podwojne
                            DropdownButton<String>(
                              value: singleBedsController,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  singleBedsController = newValue!;
                                });
                              },
                              items: <String>['0','1','2', '3']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'trebuchet ms',
                                      fontSize: 20
                                  )),
                                );
                              }).toList(),
                            ),
                            const Text("Piętro",style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'trebuchet ms',
                                fontSize: 30
                            )),//pojedyncze
                            DropdownButton<String>(
                              value: floorController,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  floorController = newValue!;
                                });
                              },
                              items: <String>['0','1', '2','3', '4','5']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'trebuchet ms',
                                      fontSize: 20
                                  )),
                                );
                              }).toList(),
                            ), //floor
                            CheckboxListTile(
                              title: const Text("Pokój VIP",style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'trebuchet ms',
                                  fontSize: 30
                              )),
                              onChanged: (bool? value) { setState(() {
                                vipController = value!;
                              }); },
                              value: vipController,
                            ), //vip
                            CheckboxListTile(
                              title: const Text("Minibar",style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'trebuchet ms',
                                  fontSize: 30
                              )),
                              onChanged: (bool? value) { setState(() {
                                miniBarController = value!;
                              }); },
                              value: miniBarController,
                            ),//minibar
                            CheckboxListTile(
                              title: const Text("Prywatna kuchnia",style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'trebuchet ms',
                                  fontSize: 30
                              )),
                              onChanged: (bool? value) { setState(() {
                                privateKitchenController = value!;
                              }); },
                              value: privateKitchenController,
                            ),//kitchen
                            TextButton(
                                onPressed: () {
                                  addRoom(hotelController, doubleBedsController, singleBedsController, floorController, vipController, miniBarController, privateKitchenController);
                                },
                                child: Text("Dodaj",style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'trebuchet ms',
                                    fontSize: 20
                                ))
                            )
                          ]
                      )
                  ),
                  Expanded(
                    child: StreamBuilder<List<Room>>(

                      stream: readRooms(),
                      builder: (context, snapshot) {

                        if(snapshot.hasData){
                          final rooms = snapshot.data!;
                          return (
                              ListView.builder(
                                  padding: const EdgeInsets.all(10),
                                  itemCount: rooms.length,
                                  itemBuilder: (BuildContext context, int index) {
                              return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              height: 208,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue,
                                ),
                              child: Column(
                                children: [
                                  Text(rooms[index].hotelController
                                      +"\n Łóżka podwójne: "+rooms[index].doubleBedsController
                                      +"\n Łóżka pojedyńcze: "+rooms[index].singleBedsController
                                      +"\n Piętro: "+rooms[index].floorController
                                      +"\n VIP: "+(rooms[index].vipController?"TAK":"NIE")
                                      +"\n Minibar: "+(rooms[index].miniBarController?"TAK":"NIE")
                                      +"\n Prywatna kuchnia: "+(rooms[index].privateKitchenController?"TAK":"NIE"),
                                      style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'trebuchet ms',
                                      fontSize: 18
                                  )),
                                  Row(
                                    children: [
                                      TextButton(onPressed: () {
                                      }, child: const Text("      EDYTUJ    ",style: TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'trebuchet ms',
                                          fontSize: 30
                                      ))),
                                      TextButton(onPressed: () {
                                          delRoom(rooms[index].id);
                                      }, child: const Text("USUŃ",style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'trebuchet ms',
                                          fontSize: 30
                                      ))),
                                    ],
                                  )
                                ],
                              ),
                              );
                              }
                              )
                          );}
                        else{
                          return Text("Brak danych!");
                        }
                      },
                    ),
                  )
                ],
              ),
            )
        )
    );
  }

  Future editRoom(id) async {

  }

  Future addRoom(hotelController,doubleBedsController,singleBedsController,floorController,
      vipController,miniBarController,privateKitchenController) async {

    var v1 = uuid.v1();

    final docCar = FirebaseFirestore.instance.collection("pokoje").doc(v1);

    final json = {
      "id": v1,
      "hotel": hotelController,
      "doubles": doubleBedsController,
      "singles": singleBedsController,
      "floor": floorController,
      "vip": vipController,
      "minibar": miniBarController,
      "kitchen": privateKitchenController
    };

    await docCar.set(json);
  }

  Future delRoom(String uuid) async {

    final docCar = FirebaseFirestore.instance.collection("pokoje").doc(uuid);

    await docCar.delete();
  }

  Stream<List<Room>> readRooms() => FirebaseFirestore
      .instance
      .collection("pokoje")
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Room.fromJson(doc.data())).toList());
}

class Room{
  String id,hotelController,doubleBedsController,singleBedsController,floorController;
      bool vipController,miniBarController,privateKitchenController;


  Room(
      this.id,
      this.hotelController,
      this.doubleBedsController,
      this.singleBedsController,
      this.floorController,
      this.vipController,
      this.miniBarController,
      this.privateKitchenController);

  static Room fromJson(Map<String, dynamic> json) => Room(
      json["id"],
      json["hotel"],
      json["doubles"],
      json["singles"],
      json["floor"],
      json["vip"],
      json["minibar"],
      json["kitchen"]
  );
}
