import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontFamily: "Rubik", fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 10),
              child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 55,
                    ),
                  )),
            ),
            const Center(
              child: Text("DEBMALYA SAHA",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w900)),
            ),
            const Center(
              child: Text("Flutter Developer",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic)),
            ),
            // Center()
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.call,
                  size: 28,
                  color: Colors.purple,
                ),
                Icon(
                  Icons.mail,
                  size: 28,
                  color: Colors.purple,
                ),
                Icon(
                  Icons.location_on,
                  size: 28,
                  color: Colors.purple,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: MyForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name = '';
  String? gender = '0';
  // var value = "0";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Your Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Name!';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                label: Text('Gender'),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.wc),
              ),
              items: [
                DropdownMenuItem(child: Text("Male"), value: "1"),
                DropdownMenuItem(child: Text("Female"), value: "2"),
                DropdownMenuItem(child: Text("Prefer Not To Say"), value: "3")
              ],
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Select Your Gender!';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 198, 90, 217),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return const Dialog(
                              insetPadding: const EdgeInsets.only(
                                  top: 250, bottom: 250, left: 70, right: 70),
                              backgroundColor:
                                  const Color.fromARGB(255, 192, 167, 197),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.verified,
                                    size: 50,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Profile Saved!",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            );
                          }));
                    }
                  },
                  child: const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
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
