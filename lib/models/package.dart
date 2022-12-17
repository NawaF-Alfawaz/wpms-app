import 'package:cloud_firestore/cloud_firestore.dart';

class PackageData {
  String cost;
  String customerEmail;
  String destination;
  String dimension;
  String fDD;
  String insurance;
  int packageID;
  String status;
  String type;
  String weight;
  String LocatedAt;
  Timestamp arrivalDate;

  PackageData(
      this.cost,
      this.customerEmail,
      this.destination,
      this.dimension,
      this.fDD,
      this.insurance,
      this.packageID,
      this.status,
      this.type,
      this.weight,
      this.LocatedAt,
      this.arrivalDate);

  String get getCost {
    return cost;
  }

  String get getCustomerEmail {
    return customerEmail;
  }

  String get getArrivalDate {
    DateTime tsdate =
        DateTime.fromMicrosecondsSinceEpoch(arrivalDate.microsecondsSinceEpoch);
    String datetime = "${tsdate.year}/${tsdate.month}/${tsdate.day}";
    return datetime;
  }

  String get getLocatedAt {
    return LocatedAt;
  }

  String get getDestination {
    return destination;
  }

  String get getDimension {
    return dimension;
  }

  String get getFDD {
    return fDD;
  }

  String get grtInsurance {
    return insurance;
  }

  int get getPackageID {
    return packageID;
  }

  String get getStatus {
    return status;
  }

  String get getType {
    return type;
  }

  String get getWeight {
    return weight;
  }
}
