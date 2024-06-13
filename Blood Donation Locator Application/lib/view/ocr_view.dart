import 'dart:convert';
import 'dart:io';
import 'package:bldapp/model/hospitals_model.dart';
import 'package:bldapp/view/DonationView.dart';
import 'package:bldapp/view/chat_bot.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:bldapp/generated/l10n.dart';

class OCR_View extends StatefulWidget {
  const OCR_View({super.key});

  @override
  _OCR_ViewState createState() => _OCR_ViewState();
}

class _OCR_ViewState extends State<OCR_View>
    with SingleTickerProviderStateMixin {
  String? _result;
  final picker = ImagePicker();
  var hemoglobin;
  Future<void> _uploadImage() async {
    if (imageFile == null) {
      setState(() {
        _result = 'Please select an image first';
      });
      return;
    }

    var url = Uri.parse('https://blood-ocr.onrender.com');
    var request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile!.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        _result = jsonResponse['result'];
        hemoglobin = jsonResponse['Hemoglobin'];

        print('$_result '+ '---------resualt------');
                print('$HospitalModel '+ '---------homglibein------');

      });
      if (_result == 'NORMAL') {
        print('--------------------ahmed');
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: S.of(context).Good_analysis,
          desc: S.of(context).press_Ok_to_complete_your_donation_check +
              '',
          btnCancelOnPress: () {
            Navigator.pop(context);
          },
          btnOkOnPress: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DonationView(
                    HemoglobinLevel: hemoglobin,
                  ),
                ));
            setState(() {});
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: S.of(context).Sorry,
          desc:
              S.of(context).you_cant_donate_press_continue_to_check_the_reasons,
          btnCancelOnPress: () {
            Navigator.pop(context);
          },
          btnOkOnPress: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ));

            setState(() {});
          },
        ).show();
      }
    } else {
      setState(() {
        _result = 'Failed to upload image';
      });
    }
  }

  bool textScanning = false;

  File? imageFile;

  String scannedText = "";
  Future<void> getImage(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        _uploadImage();
      } else {
//
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).CBC_Test_Donation),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey[400],
            // ignore: sort_child_properties_last
            child: Center(
              child: imageFile == null
                  ? Text(S.of(context).No_image_selected)
                  : Image.file(
                      File(imageFile!.path),
                      fit: BoxFit.fill,
                    ),
            ),

            width: 200,
            height: 300,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey[400],
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.image,
                            size: 30,
                          ),
                          Text(
                            S.of(context).Gallery,
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey[400],
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                          Text(
                            S.of(context).Camera,
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
