import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/presentation/camera/information_page.dart';
import 'package:fruits_and_veggies/src/theme/theme_color.dart';
import 'package:fruits_and_veggies/src/widgets/elevated_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:tflite/tflite.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  String? imageUrl;
  String? myImage;
  String? myName;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UploadTask? uploadTask;
  bool isImageLoaded = false;
  final imagePicker = ImagePicker();
  ///List Tflite///
  late List _output;

  ///uploadImage in Firestore
  Future uploadImage() async {
    //final path = 'files/$file}';
    final file = File(_image!.path);

    final ref = FirebaseStorage.instance.ref().child('file/').child('${DateTime.now()}.jpg');
    await ref.putFile(file);
    imageUrl = await ref.getDownloadURL();
    FirebaseFirestore.instance.collection('scaner').doc(DateTime.now().toString()).set({
      'id' : _auth.currentUser!.uid,
      'userImage' : myImage,
      'name' : myName,
      'email' : _auth.currentUser!.email,
      'image' : imageUrl,
      'downloads' : 0,
      'createAt' : DateTime.now()
    });
    //
    //final snapshot = await uploadTask?.whenComplete(() {});

    //final urlDownload = await snapshot?.ref.getDownloadURL();
    print("Download Link : $imageUrl");
  }

  ///Read user info
  void read_userinfo() async {
    FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get().then<dynamic>((DocumentSnapshot snapshot) async {
          myImage = snapshot.get('userImage');
          myName = snapshot.get('name');
    });
  }

  getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
      isImageLoaded = false;
    });

    classifyImage(_image!);
  }

  getImageGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    // final imageTemporary = File(image.path);
    // _image = imageTemporary;

    setState(() {
      _image = File(image.path);
      isImageLoaded = false;
    });

    classifyImage(_image!);
  }

  /// Tflite ///
  ///
  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();

    loadModel().then((value) {
      setState(() {});
    });
    read_userinfo();
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  loadModel() async {
    //this function loads our model
    var resultant = await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );

    print("Result after loading model $resultant");
  }


  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 16, //the amount of categories our neural network can predict (here no. of animals)
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output!;
      isImageLoaded = true;
      uploadImage();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            isImageLoaded
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(File(_image!.path)),
                                fit: BoxFit.contain
                            )
                        ),
                      ),
                      _output != null
                          ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  //'The result is: ${_output[1]}',
                                'The result is: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${_output[0]['label']}',
                                  style: const TextStyle(
                                    color: ThemeColor.green,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ) : Text("No result. Please scan again"),
                      // const Text(
                      //   //"${_result['label']} - ${_result['confidence'].toStringAsFixed(2)}",
                      //   //"Name : $_result \nConfidence : $_confidence",
                      //   "Apple",
                      //   style: TextStyle(fontSize: 22),n
                      MyElevatedButton(
                          onPressed: () {
                            Get.to(
                              () => InformationPage(),
                              arguments: {
                                "image" : FileImage(File(_image!.path)),
                                "name" : _output[0]['label']
                              }
                            );

                          },
                          borderRadius: BorderRadius.circular(70),
                          child: const Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          )
                      ),
                    ],
                  )
                : const Center(
                  child: Text(
                    "No image",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      height: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: getImage,
                    child: Align(
                      child: button(
                          Icons.camera_alt_outlined, Alignment.bottomCenter),
                    ),
                  ),
                  GestureDetector(
                    onTap: getImageGallery,
                    child: Align(
                      child: button(Icons.photo, Alignment.bottomLeft),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(3, 3), blurRadius: 10)
            ]),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

