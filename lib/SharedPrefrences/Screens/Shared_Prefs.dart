
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends StatefulWidget {
  const SharedPrefs({super.key});

  @override
  State<SharedPrefs> createState() => _SharedPrefsState();
}

class _SharedPrefsState extends State<SharedPrefs> {
  String getdata='hii';
  var namecontroller=TextEditingController();
  var agecontroller=TextEditingController();
  var salarycontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: namecontroller,

                decoration: InputDecoration(labelText: "Enter Name"),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: agecontroller,
                decoration: InputDecoration(labelText: "Enter Age"),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(controller: salarycontroller,
                decoration: InputDecoration(labelText: "Enter Salary"),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child:
                        ElevatedButton(onPressed: () {
                          String name=namecontroller.text.trim().toString();
                          int age=int.parse(agecontroller.text.toString().trim());
                          double salary=double.parse(salarycontroller.text.toString().trim());
                          save(name,age,salary);


                        }, child: Text("Save")),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          read();
                        },
                        child: Text(
                          "Read",
                        )),
                  )
                ],
              ),
              SizedBox(height: 16),
              Text(getdata)
            ],
          ),
        ),
      ),
    );
  }

 save(String name, int age, double salary) async {
    final SharedPreferences prefs=await SharedPreferences.getInstance();
  await prefs.setString('NAME', name);
  await prefs.setInt('AGE', age);
  await prefs.setDouble('SALARY', salary);
  }

   read() async {
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    String name= prefs.getString("NAME")??'';
    int age= prefs.getInt('AGE')??0;
    double salary=prefs.getDouble('SALARY')??0.0;
    setState(() {
      getdata = '''
      name : $name
      age : $age
      salary : $salary
      ''';
    });

  }
}
