import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/model/courier_model.dart';

class TrackingViewModel extends ChangeNotifier {
  List<LatLng> routePoints = [];
  String deliveryAddress = "Jl. Kpg Sutoyo";
  String eta = "10 minutes";
  CourierModel courier = CourierModel(
    name: "Brooklyn Simmons",
    imageUrl: "https://i.pravatar.cc/150?img=3",
  );

  void init() {
    routePoints = [
      LatLng(37.42796133580664, -122.085749655962),
      LatLng(37.42496133180663, -122.081749655962),
    ];
    notifyListeners();
  }
}
