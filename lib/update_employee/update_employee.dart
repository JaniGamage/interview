import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mypos/startup_screen.dart';

class UpdateEmployee extends StatefulWidget {
  const UpdateEmployee({Key? key}) : super(key: key);

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

class _UpdateEmployeeState extends State<UpdateEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Update employee' , style: TextStyle(fontSize: 20 , color: Colors.black), textAlign: TextAlign.left),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const Start();
            }));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.only(left: 130),
                child: Text('Update employee' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: MyCustomForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  void _UpdateEmployee() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  var empNo = '';
  var empName = '';
  var empAddressLine1 = '';
  var empAddressLine2 = '';
  var empAddressLine3 = '';
  var departmentCode = '';
  var dateOfJoin = '';
  var dateOfBirth = '';
  var basicSalary = '';

  updateEmployee() async {
    var response = await http.put(
      Uri.parse('/api/v1.0/Employee'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "empNo": empNo,
        "empName": empName,
        "empAddressLine1": empAddressLine1,
        "empAddressLine2": empAddressLine2,
        "empAddressLine3": empAddressLine3,
        "departmentCode": departmentCode,
        "dateOfJoin" : dateOfJoin,
        "dateOfBirth" : dateOfBirth,
        "basicSalary" : basicSalary,
      }),
    );

    if (response.statusCode == 200) {
      print('Success' + response.body.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const Start()));
    } else {
      print('Failed' + response.body.toString());
      print('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Employee Number' , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  TextFormField(
                    onChanged: (value) {
                      empNo = value;
                    },
                    validator: (value){
                      if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)){
                        return 'Please Enter correct Number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      // ),
                      hintText: "Employee Number",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      icon: Icon(Icons.numbers , color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Employee Name' , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  TextFormField(
                    onChanged: (value) {
                      empName = value;
                    },
                    validator: (value){
                      if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                        return 'Please Enter Correct Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      // ),
                      hintText: "Employee Name",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      icon: Icon(Icons.person , color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Employee Address Line 1' , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  TextFormField(
                    onChanged: (value) {
                      empAddressLine1 = value;
                    },
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your addressline 1';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      // ),
                      hintText: "Employee Address Line 1",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      icon: Icon(Icons.home , color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Employee Address Line 2' , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  TextFormField(
                    onChanged: (value) {
                      empAddressLine2 = value;
                    },
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your addressline 2';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      // ),
                      hintText: "Employee Address Line 2",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      icon: Icon(Icons.home , color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Employee Address Line 3' , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  TextFormField(
                    onChanged: (value) {
                      empAddressLine3 = value;
                    },
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your addressline 3';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      // ),
                      hintText: "Employee Address Line 3",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      icon: Icon(Icons.home , color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Department Code' , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  TextFormField(
                    onChanged: (value) {
                      departmentCode = value;
                    },
                    validator: (value){
                      if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)){
                        return 'Please Enter correct code';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      // ),
                      hintText: "Department Code",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      icon: Icon(Icons.work , color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Date Of Join' , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  TextFormField(
                    onChanged: (value) {
                      dateOfJoin = value;
                    },
                    validator: (value){
                      if (value!.isEmpty || value.length < 10 ||!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                        return 'Please enter your Join day(YYYY/MM/DD)';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      // ),
                      hintText: "Date Of Join",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      icon: Icon(Icons.date_range_sharp , color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Date Of Birth' , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  TextFormField(
                    onChanged: (value) {
                      dateOfBirth = value;
                    },
                    validator: (value){
                      if (value!.isEmpty || value.length < 10 ||!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                        return 'Please enter your birthday(YYYY/MM/DD)';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      // ),
                      hintText: "Date Of Birth",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      icon: Icon(Icons.date_range_sharp , color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Basic Salary' , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  TextFormField(
                    onChanged: (value) {
                      basicSalary = value;
                    },
                    validator: (value){
                      if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)){
                        return 'Please Enter correct Salary';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                      // ),
                      hintText: "Basic Salary",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      icon: Icon(Icons.attach_money , color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              width: 300,
              height: 50,
              color: Colors.pink,
              child: TextButton(onPressed: (){
                if (_formKey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const Start()));
                }
              },
                  child: const Text('Update' , style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold),)
              ),
            ),
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}
