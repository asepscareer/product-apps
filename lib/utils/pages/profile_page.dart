import 'package:flutter/material.dart';
import 'package:product_apps/const/text/lorem.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, Key? type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage("images/gojos.jpg"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Asep Saputra',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Middle Developer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    // Others
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Card(
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          txt,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
                    child: Card(
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          txt2,
                          textAlign: TextAlign.center,
                        ),
                      ),
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
}
