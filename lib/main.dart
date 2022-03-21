import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyPageState createState() => new _MyPageState();
}

class _MyPageState extends State<MyApp> {
  late TextEditingController controller;
  bool isButtonActive = true;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;

      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App",
          style: TextStyle(fontFamily: 'RaleWay',
              fontSize: 22.0
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 35, top: 30),
            child: Center(
              child: Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 33,
                  fontFamily: 'RaleWay',
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.blue,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.5,
              right: 35,
              left: 35),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "(201) 555-0123",
                    suffixIcon: IconButton(
                      onPressed: controller.clear,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text("Enter your phone number",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: isButtonActive
                          ? () {
                            setState(() => isButtonActive = false);
                            controller.clear();
                            }
                          : null,
                        icon: Icon(Icons.arrow_forward),
                      ),),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
