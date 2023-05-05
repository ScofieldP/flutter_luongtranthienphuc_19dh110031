import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/order.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class ShippingDetail extends StatefulWidget {
  final Order order;
  static const String routeName = "/shipping-detail";

  const ShippingDetail({Key? key, required this.order}) : super(key: key);

  @override
  State<ShippingDetail> createState() => _ShippingDetailState();
}

class _ShippingDetailState extends State<ShippingDetail> {
  final mapController = MapController();
  FollowOnLocationUpdate followOnLocationUpdate = FollowOnLocationUpdate.never;
  LatLng _location = LatLng(10.762622, 106.660172); //tphcm mặc định

  @override
  void initState() {
    super.initState();
    _onGetLocationPressed();
  }

  void _onGetLocationPressed() async {
    // Use the Geocoding API to get the latitude and longitude for the entered location
    final location = await GeocodingPlatform.instance
        .locationFromAddress(widget.order.shipping['address'].toString());

    if (location.isNotEmpty) {
      final lat = location.first.latitude;
      final lon = location.first.longitude;
      setState(() {
        // Set the location to the entered location
        _location = LatLng(lat, lon);
        mapController.move(_location, 15.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.order.shipping['address']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order ${widget.order.id}',
          style: const TextStyle(
            color: Colors.white,
          ),
          overflow: TextOverflow.visible,
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Foods',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.order.products.length,
              itemBuilder: (context, index) {
                final product = widget.order.products[index];
                return ListTile(
                  title: Text(product['title']),
                  trailing: Text('${product['price']}'),
                );
              },
            ),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Shipping Details',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${widget.order.shipping['name']}'),
                  SizedBox(height: 8.0),
                  Text('Address: ${widget.order.shipping['address']}'),
                  SizedBox(height: 8.0),
                  Text('Phone: ${widget.order.shipping['phone']}'),
                ],
              ),
            ),
            if (_location != null)
              Container(
                height: 300,
                child: FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    center: _location,
                    zoom: 14.0,
                    onPositionChanged: (MapPosition position, bool hasGesture) {
                      if (hasGesture) {
                        setState(
                              () => followOnLocationUpdate =
                              FollowOnLocationUpdate.always,
                        );
                      }
                    },
                    // minZoom: 0,
                    // maxZoom: 19,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                      userAgentPackageName: "com.example.flutter_sneaker",
                      // maxZoom: 19.0,
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: _location,
                          builder: (ctx) => Container(
                            child: Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
