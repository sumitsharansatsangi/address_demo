import 'package:objectbox/objectbox.dart';

@Entity()
class Pincode {
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  String? pincode;
  String? district;
  String? state;
  String? country;
  Pincode({
    this.id = 0,
    this.pincode,
    this.district,
    this.state,
    this.country,
  });
  @Backlink("pin")
  final locations = ToMany<Location>();
}

@Entity()
class Location {
  int id;
  String? area;
  String? village;
  String? panchayat;
  String? block;
  Location({
    this.id = 0,
    this.area,
    this.village,
    this.panchayat,
    this.block,
  });
  final pin = ToOne<Pincode>();
}
