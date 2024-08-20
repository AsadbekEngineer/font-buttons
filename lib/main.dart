import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//! BUTTONS and FONTS
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          FontScreen(),
          DropDownScreen(),
          InkWellScreen(),
          IconButtonn(),
          PickTheColor(),
        ],
      ),
    );
  }
}

//! Change the color
class PickTheColor extends StatefulWidget {
  const PickTheColor({super.key});

  @override
  State<PickTheColor> createState() => _PickTheColorState();
}

Color color = Colors.black;

class _PickTheColorState extends State<PickTheColor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick The Color"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  color = Colors.black;
                });
              },
              child: Container(
                height: 300,
                width: 300,
                color: color,
              ),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        color = Colors.red;
                      });
                    },
                    child: const Text(
                      "Red",
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      color = Colors.yellow;
                      setState(() {});
                    },
                    child: const Text(
                      "Yellow",
                      style: TextStyle(color: Colors.yellow),
                    )),
                TextButton(
                    onPressed: () {
                      color = Colors.green;
                      setState(() {});
                    },
                    child: const Text(
                      "Green",
                      style: TextStyle(color: Colors.green),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//! Icon Button
class IconButtonn extends StatefulWidget {
  const IconButtonn({super.key});

  @override
  State<IconButtonn> createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButtonn> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon Button Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                tapped ? Icons.check : Icons.star,
                size: 60,
              ),
              onPressed: () {
                setState(() {
                  tapped = !tapped;
                });
              },
            ),
            if (tapped)
              const Text(
                "Checked",
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}

//! Ink and InkWell Screen
class InkWellScreen extends StatefulWidget {
  const InkWellScreen({super.key});

  @override
  State<InkWellScreen> createState() => _InkWellScreenState();
}

class _InkWellScreenState extends State<InkWellScreen> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ink Well Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Ink(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              child: InkWell(
                onLongPress: () => setState(() {
                  text = "Long Press Detected";
                }),
                onDoubleTap: () => setState(() {
                  text = "Double Tapped";
                }),
                onTap: () {
                  text = "Tapped";
                  setState(() {});
                },
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//! DropDownButton
class DropDownScreen extends StatefulWidget {
  const DropDownScreen({super.key});

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  bool tapped = false;
  Color rang = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDownButton"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: rang),
            ),
            DropdownButton(
              hint: const Text("Ranglar"),
              items: const [
                DropdownMenuItem(value: 'Red', child: Text("Red")),
                DropdownMenuItem(value: 'Blue', child: Text("Blue")),
                DropdownMenuItem(value: 'Yellow', child: Text("Yellow")),
              ],
              onChanged: (value) {
                if (value == "Red") {
                  setState(() {
                    rang = Colors.red;
                  });
                } else if (value == "Blue") {
                  setState(() {
                    rang = Colors.blue;
                  });
                } else {
                  setState(() {
                    rang = Colors.yellow;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

//! Font Screen
class FontScreen extends StatefulWidget {
  const FontScreen({super.key});

  @override
  State<FontScreen> createState() => _FontScreenState();
}

class _FontScreenState extends State<FontScreen> {
  String item1 = 'Profile';
  String item2 = 'Logout';
  String item3 = 'About';
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pop up Menu Button",
          style: TextStyle(fontFamily: "Inspiration"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PopupMenuButton(
              icon: Icon(Icons.settings),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Profile"),
                  value: item1,
                ),
                PopupMenuItem(
                  child: Text("LogOut"),
                  value: item1,
                ),
                PopupMenuItem(
                  child: Text("About"),
                  value: item1,
                ),
              ],
              onSelected: (value) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Profile"),
                          content: Text("Profile is uploading..."),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("close"))
                          ],
                        ));
                if (value == item1) {
                  setState(() {
                    text = item1;
                  });
                }
              },
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
