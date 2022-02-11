import 'package:flutter/material.dart';
import 'package:flutter_get/pages/about_page.dart';
import 'package:get/get.dart';

class Api extends GetConnect {
  void fetchTodo() async {
    var response = await get("https://jsonplaceholder.typicode.com/todos/1");
    var todo = response.body;
  }
}

class controller extends GetxController {
  RxMap todo = {}.obs;
  void fetchTodo() => Api().fetchTodo();
}

class HomePage extends GetWidget {
  HomePage({Key? key}) : super(key: key);
  var _counter = 0.obs;

  void increrment() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
                onPressed: () => Get.to(AboutPage()),
                child: Text("Goo to about")),
            Obx(
              () => Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            GestureDetector(
              child: Card(
                child: Image.network(
                    "https://media.istockphoto.com/photos/set-of-sushi-and-rolls-with-salmon-and-tuna-avocado-california-maki-picture-id1066110176?k=20&m=1066110176&s=612x612&w=0&h=3GGm_0TalPE_WDnn08IGB142HRKRrvSAgaSazHXibto="),
              ),
              onTap: () {
                Get.to(AboutPage());
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increrment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
