import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled28/pages/internet_page/internet_data.dart';
import 'package:untitled28/pages/model_page/model_class.dart';

class GetOnleOneData extends StatefulWidget {
  int dataId;
  bool t;
  GetOnleOneData({super.key, required this.dataId, required this.t});

  @override
  State<GetOnleOneData> createState() => _GetOnleOneDataState();
}

class _GetOnleOneDataState extends State<GetOnleOneData> {
  Internetdata internetdata = Internetdata();
  late ModelDataPosts modelDataPosts;
  int errorData = 0;
  bool boolGetData = false;
  @override
  void initState() {
    widget.t ? getDataInternet() : getDataInternetError();
    super.initState();
  }

  getDataInternet() async {
    try {
      boolGetData = false;
      modelDataPosts = await internetdata.getOnlePost(widget.dataId);
    } on DioException catch (e) {
      errorData = e.response!.statusCode!;
    }
    boolGetData = true;
    setState(() {});
  }

  getDataInternetError() async {
    try {
      boolGetData = false;
      modelDataPosts = await internetdata.getOnlePostError(widget.dataId);
    } on DioException catch (e) {
      errorData = e.response!.statusCode!;
    }
    boolGetData = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: boolGetData
                ? errorData == 0
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(modelDataPosts.id.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(modelDataPosts.userId.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(modelDataPosts.title.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(modelDataPosts.body.toString()),
                          ],
                        ),
                      )
                    : Center(
                        child: Text(errorData.toString()),
                      )
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
