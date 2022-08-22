import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/pages/set_location/components/set_location_card.dart';
import 'package:food_delivery/pages/upload_preview/upload_preview_screen.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../widgets/buttons/button_next_custom.dart';
import '../../success_screens/register_success.dart';

class BodySetLocation extends StatefulWidget {
  static String routeName = '/BodySetLocation';
  const BodySetLocation({Key? key}) : super(key: key);

  @override
  State<BodySetLocation> createState() => _BodySetLocationState();
}

class _BodySetLocationState extends State<BodySetLocation> {
  Future<Placemark> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location service is not enabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error("Location permission is denied forever");
      }
    }
    final position = await Geolocator.getCurrentPosition();
    final placeMarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placeMarks.isEmpty) {
      return Future.error("No place mark found");
    } else {
      return placeMarks.first;
    }
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.screenWidth! * 0.05,
              SizeConfig.screenHeight! * 0.05,
              SizeConfig.screenWidth! * 0.05,
              0),
          child: Column(
            children: [
              AppBarCustom(
                title: 'Set Your Location ',
                description:
                    'This data will be displayed in your account profile for security',
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UploadPreviewScreen()));
                },
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              SetLocationCard(
                onPress: () {
                  getCurrentLocation().then((value) {
                    var uid = FirebaseAuth.instance.currentUser;
                    CollectionReference users = FirebaseFirestore.instance.collection('user');
                    users.doc(uid?.uid).set(
                        {
                          'address': value.name,
                        },SetOptions(merge: true)
                    ).then((user){
                      Fluttertoast.showToast(
                          msg: "Location set successfully: ${value.name}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    })
                        .catchError((error){

                    });
                  });
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                    title: 'Next',
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SuccessRegister()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
