
import 'package:flutter/material.dart';
import 'package:mypos/search_employee/result.dart';
import 'package:mypos/startup_screen.dart';

class SearchEmployee extends StatefulWidget {
  const SearchEmployee({Key? key}) : super(key: key);

  @override
  State<SearchEmployee> createState() => _SearchEmployeeState();
}

class _SearchEmployeeState extends State<SearchEmployee> {
  final _formKey = GlobalKey<FormState>();
  var empNo = '' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Search employee' , style: TextStyle(fontSize: 20 , color: Colors.black), textAlign: TextAlign.left),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 100 , top: 200),
            child: Container(
              height: 95,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: Text('Employee Number' , style: TextStyle(fontSize: 20 , color: Colors.black),)),
                  TextFormField(
                    onChanged: (value) {
                      empNo = value;
                    },
                    validator: (value){
                      if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)){
                        return 'Please Enter correct Number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "Enter Employee Number",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Container(
              width: 300,
              height: 50,
              color: Colors.pink,
              child: TextButton(onPressed: (){
                if (_formKey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const Result()));
                }
              },
                  child: const Text('Search' , style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold),)
              ),
            ),
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}
