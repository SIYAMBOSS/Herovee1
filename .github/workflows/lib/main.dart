import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math';

// সিয়াম বস্, আপনার AppID ও Secret এখানে বসানো হলো
const String appID = "1064412250";
const String appSign = "69886eaef48505340c59c2497ad0a679";

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final callIDController = TextEditingController();
  final String userID = Random().nextInt(10000).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HEROVEE ID: $userID", style: TextStyle(color: Colors.cyanAccent, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                controller: callIDController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Enter Friend's ID",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ZegoUIKitPrebuiltCall(
                      appID: int.parse(appID),
                      appSign: appSign,
                      userID: userID,
                      userName: "User_$userID",
                      callID: callIDController.text,
                      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
                    );
                  }));
                },
                child: const Text("START CALL"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
