import 'package:demo/services/services.dart';
import 'package:demo/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

//Location page using google map to show the location and local database to store Added locations.
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  GoogleMapController mapController;
  LatLng _center = LatLng(0.0, 0.0);
  Set<Marker> markers = Set();
  MarkerId selectedMarker;

  void _add(LatLng point) async {
    final int markerCount = markers.length;

    final String markerIdVal = 'marker_id_$markerCount';
    String placeName = await showDialog(
        context: context,
        builder: (context) => NewTaskInput(
              markerIdVal: markerIdVal,
              latitude: point.latitude,
              longitude: point.longitude,
            ));
    if (placeName == '' || placeName == null) {
      return;
    }

    final Marker marker = Marker(
      markerId: MarkerId(markerIdVal),
      position: point,
      infoWindow: InfoWindow(title: placeName, snippet: 'demo subtitle'),
    );

    setState(() {
      markers.add(marker);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    _center = LatLng(
        userLocation?.latitude ?? 23.3441, userLocation?.longitude ?? 85.3096);
    _buildTaskList(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Sample'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onLongPress: (LatLng point) {
          _add(point);
        },
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: markers,
      ),
    );
  }

  _buildTaskList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    database.watchAllTask().listen((snapshot) {
      final tasks = snapshot ?? List();
      for (var i = 0; i < tasks.length; i++) {
        final itemTask = tasks[i];
        _buildMarker(itemTask, database);
      }
    });
  }

  _buildMarker(Task itemTask, AppDatabase database) {
    final Marker marker = Marker(
      markerId: MarkerId(itemTask.markerId),
      position: LatLng(itemTask.lat, itemTask.lang),
      infoWindow: InfoWindow(title: itemTask.name, snippet: 'demo detail'),
    );

    setState(() {
      markers.add(marker);
    });
  }
}
