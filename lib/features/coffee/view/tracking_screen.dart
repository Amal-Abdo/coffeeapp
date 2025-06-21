import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import '../viewmodel/tracking_viewmodel.dart';
import '../widgets/courier_info_card.dart';
import '../widgets/delivery_status_bar.dart';
import '../widgets/route_map_widget.dart';

class TrackingScreen extends HookWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = useListenable(Provider.of<TrackingViewModel>(context));

    useEffect(() {
      vm.init();
      return null;
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          RouteMapWidget(routePoints: vm.routePoints),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DeliveryStatusBar(eta: vm.eta, address: vm.deliveryAddress),
                CourierInfoCard(courier: vm.courier),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
