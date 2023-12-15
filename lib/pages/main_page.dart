import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled28/pages/get_onle_one_data.dart';
import 'package:untitled28/pages/internet_page/internet_data.dart';
import 'package:untitled28/pages/model_page/model_class.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Internetdata internetdata = Internetdata();
  List<ModelDataPosts> modelPostsList = [];
  int checkData = 0;
  int errorData = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  getDataFromInterentError();
                },
                padding: EdgeInsets.all(10),
                minWidth: MediaQuery.of(context).size.width / 3,
                color: Colors.teal,
                child: Text("Get Error"),
              ),
              MaterialButton(
                onPressed: () {
                  errorData = 0;
                  getDataFromInterent();
                },
                padding: EdgeInsets.all(10),
                minWidth: MediaQuery.of(context).size.width / 3,
                color: Colors.teal,
                child: Text("Get data"),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
              child: checkData == 0
                  ? Container()
                  : checkData == 1
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : errorData == 0
                          ? ListView.builder(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          CupertinoPageRoute(
                                                              builder: (context) =>
                                                                  GetOnleOneData(
                                                                      dataId:
                                                                          modelPostsList[index]
                                                                              .id,
                                                                      t: false)));
                                                    },
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Container(
                                                      height: 50,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.blue,
                                                      ),
                                                      child: Center(
                                                        child:
                                                            Text("get error"),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          CupertinoPageRoute(
                                                              builder: (context) =>
                                                                  GetOnleOneData(
                                                                      dataId:
                                                                          modelPostsList[index]
                                                                              .id,
                                                                      t: true)));
                                                    },
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Container(
                                                      height: 50,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.blue,
                                                      ),
                                                      child: Center(
                                                        child: Text("get data"),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  leading: Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.12,
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    child: Center(
                                      child: Text(
                                          modelPostsList[index].id.toString()),
                                    ),
                                  ),
                                  title: Text(modelPostsList[index].title),
                                  trailing: Icon(Icons.navigate_next),
                                );
                              },
                              itemCount: modelPostsList.length,
                            )
                          : Center(
                              child: Text(errorData.toString()),
                            ))
        ],
      ),
    ));
  }

  getDataFromInterent() async {
    checkData = 1;
    setState(() {});
    try {
      modelPostsList = await internetdata.getPosts();
    } on DioException catch (e) {
      errorData = e.response!.statusCode!;
    }
    checkData = 2;
    setState(() {});
  }

  getDataFromInterentError() async {
    checkData = 1;
    setState(() {});
    try {
      modelPostsList = await internetdata.getPostsError();
    } on DioException catch (e) {
      errorData = e.response!.statusCode!;
    }
    checkData = 2;
    setState(() {});
  }
}
