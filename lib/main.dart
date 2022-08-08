import 'package:address_demo/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:collection';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends GetView<Controller> {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  // List<List<String>> data = [];

  // Future<void> readFileByLines() async {
  //   final rawData = await rootBundle.loadString("assets/data.csv");
  //   List<String> lines = rawData.split("\n");

  //   for (final line in lines) {
  //     setState(() {
  //       data.add(line.split(','));
  //       // print(line.split(','));
  //     });
  //   }
  //   data = data.sublist(0, data.length - 1);
  //   pincodeBox.putMany(data.map((e) {
  //     if (e.length == 6) {
  //       return Pincode(
  //           pincode: e[5].trim().replaceAll(",", ""),
  //           district: "Jamui",
  //           state: "Bihar",
  //           country: "India");
  //     } else {
  //       return Pincode(
  //           pincode: e[4].trim().replaceAll(",", ""),
  //           district: "Jamui",
  //           state: "Bihar",
  //           country: "India");
  //     }
  //   }).toList());
  //   locationBox.putMany(data.map((e) {
  //     if (e.length == 6) {
  //       final p = pincodeBox
  //           .query(Pincode_.pincode.equals(e[5].trim()))
  //           .build()
  //           .findFirst();
  //       return Location(
  //         area: e[0].trim(),
  //         village: e[1].trim(),
  //         panchayat: e[2].trim(),
  //         block: e[3].trim(),
  //       )..pin.target = p;
  //     } else if (e.length == 5) {
  //       final p = pincodeBox
  //           .query(Pincode_.pincode.equals(e[4].trim()))
  //           .build()
  //           .findFirst();
  //       return Location(
  //         village: e[0].trim(),
  //         panchayat: e[1].trim(),
  //         block: e[2].trim(),
  //       )..pin.target = p;
  //     } else {
  //       print(e);
  //       print("Sachin Tichkule");
  //       return Location();
  //     }
  //   }).toList());
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onSubmitted: (string) {
                controller.fetchBlock(string);
              },
            ),
            Obx(() => controller.blocks.isEmpty
                ? const SizedBox()
                : DropdownButton(
                    value: controller.currentBlock.value,
                    onChanged: (String? newValue) {
                      controller.currentBlock.value = newValue!;
                      controller.panchayats.clear();
                      controller.villages.clear();
                      controller.areas.clear();
                      controller.fetchPanchayats(newValue);
                    },
                    items: controller.blocks.map((selectedType) {
                      return DropdownMenuItem(
                        child: Text(selectedType,
                            style: const TextStyle(fontSize: 16)),
                        value: selectedType,
                      );
                    }).toList(),
                  )),
            Obx(() => controller.panchayats.isEmpty
                ? const SizedBox()
                : DropdownButton(
                    value: controller.currentPanchayat.value,
                    onChanged: (String? newValue) {
                      controller.currentPanchayat.value = newValue!;
                      controller.villages.clear();
                      controller.areas.clear();
                      controller.fetchVillages(newValue);
                    },
                    items: controller.panchayats.map((selectedType) {
                      return DropdownMenuItem(
                        child: Text(selectedType,
                            style: const TextStyle(fontSize: 16)),
                        value: selectedType,
                      );
                    }).toList(),
                  )),
            Obx(() => controller.villages.isEmpty
                ? const SizedBox()
                : DropdownButton(
                    value: controller.currentVillage.value,
                    onChanged: (String? newValue) {
                      controller.currentVillage.value = newValue!;
                      controller.areas.clear();
                      controller.fetchAreas(newValue);
                    },
                    items: controller.villages.map((selectedType) {
                      return DropdownMenuItem(
                        child: Text(selectedType,
                            style: const TextStyle(fontSize: 16)),
                        value: selectedType,
                      );
                    }).toList(),
                  )),
            Obx(() => controller.areas.isEmpty
                ? const SizedBox()
                : DropdownButton(
                    value: controller.currentArea.value,
                    onChanged: (String? newValue) {
                      controller.currentArea.value = newValue!;
                    },
                    items: controller.areas.map((selectedType) {
                      return DropdownMenuItem(
                        child: Text(selectedType,
                            style: const TextStyle(fontSize: 16)),
                        value: selectedType,
                      );
                    }).toList(),
                  )),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await readFileByLines();
      //   },
      //   tooltip: 'Load csv',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
