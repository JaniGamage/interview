import 'package:flutter/material.dart';
import 'package:mypos/delete_employee/delete_employee.dart';
import 'package:mypos/employee_list/employee_list.dart';
import 'package:mypos/search_employee/search_employee.dart';
import 'package:mypos/update_employee/update_employee.dart';
import 'add_employee/add_employee.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const AddEmployee();
            }));
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius:BorderRadius.all(Radius.circular(20)),
              color: Colors.pink,
            ),
            child: const Center(
                child: Text('Add new employee' , style: TextStyle(fontSize: 15.0 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
          ),
        ),
        TextButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const UpdateEmployee();
            }));
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius:BorderRadius.all(Radius.circular(20)),
              color: Colors.pink,
            ),
            child: const Center(
                child: Text('Update employee' , style: TextStyle(fontSize: 15.0 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
          ),
        ),
        TextButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const DeleteEmployee();
            }));
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius:BorderRadius.all(Radius.circular(20)),
              color: Colors.pink,
            ),
            child: const Center(
                child: Text('Delete employee' , style: TextStyle(fontSize: 15.0 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
          ),
        ),
        TextButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const SearchEmployee();
            }));
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius:BorderRadius.all(Radius.circular(20)),
              color: Colors.pink,
            ),
            child: const Center(
                child: Text('Search employee details' , style: TextStyle(fontSize: 15.0 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
          ),
        ),
        TextButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const EmployeeList();
            }));
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius:BorderRadius.all(Radius.circular(20)),
              color: Colors.pink,
            ),
            child: const Center(
                child: Text('Display employee list' , style: TextStyle(fontSize: 15.0 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
          ),
        )
      ],
    );
  }
}
