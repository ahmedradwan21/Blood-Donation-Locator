import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:bldapp/Colors.dart';
import 'package:bldapp/Provider/theme_provider.dart';
import 'package:bldapp/model/donar_model.dart';
import 'package:bldapp/view/updatessss/donar_details_info.dart';
import 'package:bldapp/view/updatessss/hospital.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bldapp/generated/l10n.dart';

class Remove extends StatefulWidget {
  const Remove({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<Remove> createState() => _RemoveState();
}

class _RemoveState extends State<Remove> {
  @override
  // ignore: override_on_non_overriding_member
  CollectionReference inventoryTable =
      FirebaseFirestore.instance.collection('inventoryTable');
  String searchQuery = '';
  void searchFunc(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  Widget build(BuildContext context) {
    var _theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Remove_Blood_Type, style: Style.style16),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) => searchFunc(query),
              decoration: InputDecoration(
                hintText: S.of(context).Search_by_Serial_Num,
                // hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    searchFunc('');
                  },
                ),
              ),
              // style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: StreamBuilder<List<QueryDocumentSnapshot>>(
                stream: FirebaseFirestore.instance
                    .collection('bloodTypeData')
                    .where('id', isEqualTo: widget.id)
                    .snapshots()
                    .map((snapshot) => snapshot.docs),
                builder: (BuildContext context,
                    AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
                  if (snapshot.hasError) {
                    return Text(S.of(context).Something_went_wrong);
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text(S.of(context).Loading);
                  }

                  List<QueryDocumentSnapshot> dataList = snapshot.data!;

                  if (searchQuery.isNotEmpty) {
                    dataList = dataList.where((document) {
                      Map<String, dynamic> dataItem =
                          document.data() as Map<String, dynamic>;
                      String serialNumber = dataItem['serialNumber'].toString();
                      return serialNumber
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase());
                    }).toList();
                  }

                  return DataTable(
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text(
                          S.of(context).blood_donate,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          S.of(context).Serial_Num,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          S.of(context).Details,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                    rows: dataList.map((DocumentSnapshot document) {
                      Map<String, dynamic> dataItem =
                          document.data() as Map<String, dynamic>;

                      return DataRow(
                        cells: [
                          DataCell(Text(dataItem['bloodType'].toString())),
                          DataCell(Text(dataItem['serialNumber'])),
                          DataCell(
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.info,
                                // color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DonarDetailsInfo(
                                        donar: Donar(
                                          createdDate: dataItem['createdDate']
                                              .toString(),
                                          donarName:
                                              dataItem['donateName'].toString(),
                                          donarId:
                                              dataItem['donateID'].toString(),
                                          serialNum: dataItem['serialNumber']
                                              .toString(),
                                          expiredDate: dataItem['expiredDate']
                                              .toString(),
                                          bloodType:
                                              dataItem['bloodType'].toString(),
                                          moreDetails: dataItem['moreDetails']
                                              .toString(),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _theme.isDarkMode ? Colors.amber : background,
        onPressed: scanQrCode,
        child: Icon(
          Icons.remove,
          size: 25,
          color: _theme.isDarkMode ? background : Colors.white,
        ),
      ),
    );
  }

  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> searchData = [];
  TextEditingController searchController =
      TextEditingController(); // Controller for the search query

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bloodTypeData')
        .where('id', isEqualTo: widget.id)
        .get();
    data.addAll(querySnapshot.docs);
    searchData.addAll(data);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> scanQrCode() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'Cancel', true, ScanMode.QR)
          .then(
        (value) {
          List dataList = value.split(' ');
          String moreData = '';
          for (var i = 7; i < dataList.length; i++) {
            moreData = moreData + ' ' + dataList[i];
          }
          String name = dataList[0].replaceAll('-', ' ');
          String hospital = dataList[6].replaceAll('-', ' ');

          addData(
            donarName: name,
            donarId: dataList[1],
            serialNumber: dataList[2],
            bloodType: dataList[3],
            uid: dataList[4],
            expiredDate: dataList[5],
            hospitalName: hospital,
            moreDetails: moreData,
          );
        },
      );
    } catch (e) {}
  }

  String title = 'Lets Scan QR Code';
  CollectionReference bloodTypeData =
      FirebaseFirestore.instance.collection('bloodTypeData');

  Future<void> addData({
    required String uid,
    required String donarName,
    required String bloodType,
    required String donarId,
    required String serialNumber,
    required String hospitalName,
    required String expiredDate,
    required String moreDetails,
  }) {
    return bloodTypeData.doc(uid).get().then((value) {
      FirebaseFirestore.instance
          .collection('bloodTypeData')
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection('HospitalRegisterData')
              .where('name', isEqualTo: hospitalName)
              .get();
          FirebaseFirestore.instance
              .collection('HospitalRegisterData')
              .doc(querySnapshot.docs[0]['uid'])
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              Map<String, dynamic> data =
                  documentSnapshot.data() as Map<String, dynamic>;

              int currentValue = data['bloodtype'][bloodType] ?? 0;
              FirebaseFirestore.instance
                  .collection('HospitalRegisterData')
                  .doc(querySnapshot.docs[0]['uid'])
                  .set({
                'bloodtype': {bloodType: currentValue - 1},
              }, SetOptions(merge: true));
            } else {
              print('Document does not exist on the database');
            }
          });
          // ignore: unused_local_variable
          final QuerySnapshot snapshot =
              await bloodTypeData.where('id', isEqualTo: uid).get();
          Map<String, dynamic> dataQuery =
              documentSnapshot.data() as Map<String, dynamic>;
          DateTime currentDate = DateTime.now();

          // Format the current date to "yyyy-MM-dd" format
          // ignore: unused_local_variable
          String formattedCurrentDate =
              '${currentDate.year}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}';

          String dateToCheck =
              dataQuery['expiredDate']; // Example date to check

          DateTime dateTimeToCheck = DateTime.parse(dateToCheck);

          // Compare the two dates
          bool isBeforeOrEqual = dateTimeToCheck.isBefore(currentDate) ||
              dateTimeToCheck.isAtSameMomentAs(currentDate);

          print('Is Before or Equal: $isBeforeOrEqual');
          ////////
          inventoryTable.doc(uid + 'updated').set({
            'donateName': donarName, // John Doe
            'bloodType': bloodType, // Stokes and Sons
            'donateID': donarId,
            'expiredDate': expiredDate, // John Doe
            'serialNumber': serialNumber,
            'moreDetails': moreDetails,
            'postId': uid,
            'UpdatedDate':
                DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
            'id': widget.id,
            'process': 'delete'

            ///
          });
          bloodTypeData.doc(uid).delete();

          if (isBeforeOrEqual == true) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              title: S.of(context).Warning,
              desc: S.of(context).Blood_Type_Expiry_Date,
              btnCancelOnPress: () {},
              btnOkOnPress: () async {
                setState(() {});
              },
            )..show();
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: S.of(context).successfull,
              desc: S.of(context).Blood_type_is_deleted,
              btnCancelOnPress: () {},
              btnOkOnPress: () async {
                setState(() {});
              },
            )..show();
          }
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: S.of(context).Failure,
            desc: S.of(context).Blood_type_isnt_exist,
            btnCancelOnPress: () {},
            btnOkOnPress: () async {
              setState(() {});
            },
          )..show();
        }
      });
    }).catchError((error) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: S.of(context).Error,
        desc: S.of(context).please_scan_a_correct_Qr,
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    });
  }
}
