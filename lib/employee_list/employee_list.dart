import 'package:flutter/material.dart';
import 'package:mypos/services/remote_services.dart';
import 'package:mypos/startup_screen.dart';
import '../model/post.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List<Post>? posts;
  var isloaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async{
    posts =  await RemoteService().getPosts();
    if (posts != null){
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Employee List' , style: TextStyle(fontSize: 20 , color: Colors.black), textAlign: TextAlign.left),
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
      body: Visibility(
        visible: isloaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: posts?.length,
            itemBuilder: (context, index){
          return Container(
            child: Text(posts![index].empName),
          );
        }),
      )
    );
  }
}

