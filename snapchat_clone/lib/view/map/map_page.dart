import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snapchat_clone/models/json/get_chat_data.dart';
import 'package:snapchat_clone/view/profile/avatar/avatar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GetChatData _getChatData = GetChatData();

  Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  Position? _position;
  LatLng? _currentLatLng;

  Set<Marker> _markers = <Marker>{};

  LocationSettings _locationSettings() {
    if (Platform.isAndroid) {
      return AndroidSettings();
    } else {
      return AppleSettings();
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  void _getCurrentLocation() async {
    _position = await Geolocator.getCurrentPosition(
      locationSettings: _locationSettings(),
    );
    LatLng location = LatLng(_position!.latitude, _position!.longitude);

    setState(() {
      _currentLatLng = location;
    });
  }

  _showNearbyFriendsAvatars() async {
    final data = await _getChatData.loadUsers();
  }

  _handlePermissions() async {
    var status = await Permission.location.status;
    if (Platform.isAndroid) {}
  }

  _checkPermissions() async {
    var locationStatus = Permission.location.status;
    if (await Permission.location.request().isGranted) {
      _getCurrentLocation();
    } else {
      await Permission.location.request();
      //  _handlePermissions();
    }
  }

  @override
  void initState() {
    _checkPermissions();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.camera),
        ),
        actions: const [ProfileAvatar()],
      ),
      body: _currentLatLng == null
          ? const CircularProgressIndicator.adaptive()
          : SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width - 1,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: false,
                initialCameraPosition:
                    CameraPosition(target: _currentLatLng!, zoom: 16),
                onMapCreated: _onMapCreated,
                markers: _markers,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                mapToolbarEnabled: true,
              ),
            ),

      // floatingActionButton: ,
    );
  }
}
