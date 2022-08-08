import 'package:address_demo/model.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'objectbox.g.dart';

class Controller extends GetxController {
  final locations = <Location>[].obs;
  final panchayats = <String>{}.obs;
  final blocks = <String>{}.obs;
  final villages = <String>{}.obs;
  final areas = <String>{}.obs;
  late final Store store;
  late final Box<Location> locationBox;
  late final Box<Pincode> pincodeBox;
  final currentBlock = "".obs;
  final currentPanchayat = "".obs;
  final currentVillage = "".obs;
  final currentArea = "".obs;

  @override
  void onReady() async {
    super.onReady();
    final dir = await getApplicationSupportDirectory();
    final store = await openStore(directory: join(dir.path, 'objectbox'));
    locationBox = Box<Location>(store);
    pincodeBox = Box<Pincode>(store);
  }

  void fetchBlock(string) {
    QueryBuilder<Location> builder = locationBox.query();
    builder.link(Location_.pin, Pincode_.pincode.equals(string));
    Query<Location> query = builder.build();
    locations.value = query.find();
    currentBlock.value = locations[0].block ?? " ";
    final list = locations.toList().map((e) => e.block!).toList();
    list.sort();
    blocks.addAll(list);
  }

  void fetchPanchayats(string) {
    int i = 0;
    for (final location in locations) {
      if (location.block == string && i == 0) {
        i == 1;
        currentPanchayat.value = location.panchayat!;
      }
      if (location.block == string) {
        panchayats.add(location.panchayat!);
      }
    }
    panchayats.toList().sort();
  }

  void fetchVillages(string) {
    int i = 0;
    for (final location in locations) {
      if (location.panchayat == string && i == 0) {
        i == 1;
        currentVillage.value = location.village!;
      }
      if (location.panchayat == string) {
        villages.add(location.village!);
      }
    }
    villages.toList().sort();
  }

  void fetchAreas(string) {
    int i = 0;
    for (final location in locations) {
      if (location.village == string && i == 0 && location.area != null) {
        i == 1;
        currentArea.value = location.area!;
      }
      if (location.village == string && location.area != null) {
        areas.add(location.area!);
      }
    }
    areas.toList().sort();
  }
}
