import 'package:day_for_you/app/components/cards/TodoCard.dart';
import 'package:day_for_you/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TodosView extends GetView<HomeController> {
  TodosView({super.key});

  GlobalKey todosTitleKey = GlobalKey();
  GlobalKey addTodosKey = GlobalKey();
  bool addTodosCardVisible = false;


  Widget addTodoCard () {
    return Column(
      key: addTodosKey,
      children: [
        TodoCard(),
        TextButton(onPressed: () => Scrollable.ensureVisible(todosTitleKey.currentContext!), child: Text("취소"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            key: todosTitleKey,
            children: [
              const Text("TODO",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(0.0),
                  onPressed: () => Scrollable.ensureVisible(addTodosKey.currentContext!),
                  icon: Icon(Icons.add_circle_outline_sharp, color: Colors.black38,)
              )
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 100, child: Text('1'),),
                Container(height: 100, child: Text('5'),),
                Container(height: 100, child: Text('4'),),
                Container(height: 100, child: Text('3'),),
                Container(height: 100, child: Text('2'),),
                Container(height: 100, child: Text('1'),),
                Container(height: 100, child: Text('5'),),
                Container(height: 100, child: Text('4'),),
                Container(height: 100, child: Text('3'),),
                Container(height: 100, child: Text('2'),),
                addTodoCard()
              ],
            ),
          )
        ],
      ),
    );
  }

}