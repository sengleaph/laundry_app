import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Position? _currentPosition;
  final Set<Marker> _markers = {};

  // Default camera position (e.g., San Francisco) before we have the user's location
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    _requestPermissionAndGetLocation();
  }

  // Request permissions and get the current position
  Future<void> _requestPermissionAndGetLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          // Permission denied; handle it (e.g., show a dialog/snackbar)
          return;
        }
      }

      // If permissions are granted, fetch the current position
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = position;
        _markers.add(
          Marker(
            markerId: const MarkerId('current_location'),
            position: LatLng(position.latitude, position.longitude),
            infoWindow: const InfoWindow(title: "My Location"),
          ),
        );
      });

      // Move the camera to the user's current position
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      debugPrint('Error getting location: $e');
      // Optionally, show a UI message if fetching location fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _mapController = controller,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        compassEnabled: true,
        markers: _markers,
        onTap: (LatLng tappedPosition) {
          setState(() {
            // Clear existing markers and add a new one at the tapped position
            _markers.clear();
            _markers.add(
              Marker(
                markerId: const MarkerId('tapped_location'),
                position: tappedPosition,
                infoWindow: const InfoWindow(title: 'Selected Location'),
              ),
            );
          });
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Button to zoom in
          FloatingActionButton(
            onPressed: () {
              _mapController?.animateCamera(CameraUpdate.zoomIn());
            },
            child: const Icon(Icons.zoom_in),
            heroTag: 'zoom_in',
          ),
          const SizedBox(height: 8),
          // Button to zoom out
          FloatingActionButton(
            onPressed: () {
              _mapController?.animateCamera(CameraUpdate.zoomOut());
            },
            child: const Icon(Icons.zoom_out),
            heroTag: 'zoom_out',
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: _requestPermissionAndGetLocation,
            child: const Icon(Icons.my_location),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
