import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:provider/provider.dart';
import 'package:shopgood/provider/auth_provider.dart';
import 'package:shopgood/provider/cart_provider.dart';

import '../../provider/product_provider.dart';

class Payment extends StatefulWidget {
  const Payment({
    super.key,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? userLocation;
  BitmapDescriptor? icon;
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false)..getCarts();
    _getUserLocation();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(28, 28)), 'assets/icons/pin.png')
        .then((onValue) {
      icon = onValue;
    });
  }
  // This function will get user location

  Future<void> _getUserLocation() async {
    Location location = Location();
    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await location.getLocation();
    setState(() {
      userLocation = locationData;
    });
  }

  Set<Marker> myMarKer() {
    return <Marker>[
      Marker(
        markerId: MarkerId('MarkerId'),
        position: LatLng(userLocation!.latitude!, userLocation!.longitude!),
        icon: icon!,
        infoWindow:
            InfoWindow(title: 'This is a Title', snippet: 'this is a snippet'),
      ),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (_, productProvider, __) {
      if (productProvider.loading == true) {
        return CircularProgressIndicator();
      }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            'payment',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text('ຊ່ອງທາງຕິດຕໍ່',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.green),
                  ],
                ),
                SizedBox(height: 10),
                Consumer<AuthProvider>(builder: (_, authProvider, __) {
                  if (authProvider.loading == true) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ຊື່ ແລະ ນາມສະກຸນ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text(
                                '${authProvider.userData['firstName']} ${authProvider.userData['lastName']}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ເບີໂທຕິດຕໍ່',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text(
                                '+856 ${authProvider.userData['phoneNumber'].toString()}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(height: 10),
                Container(
                  height: 10,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.time_to_leave, color: Colors.black),
                    SizedBox(width: 5),
                    Text('ເວລາຈັດສົ່ງສິນຄ້າ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.green),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ວັນທີ່ຈັດສົ່ງ',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                      Text('10-01-2023',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ເວລາຈັດສົ່ງ',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                      Text('10:00 - 20:00',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  height: 10,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.map,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text('ສະຖານທີ່ຈັດສົ່ງສິນຄ້າ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        //  Navigator.pushNamed(context, RouterAPI.address);
                      },
                      icon: Icon(Icons.edit, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Consumer<AddressProvider>(
                //     builder: (context, addressProvider, child) {
                //   if (addressProvider.loading == true) {
                //     return Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   }
                //return
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ບ້ານ ເມືອງ ແຂວງ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          Text('ຫ້ວຍຫົງ ຈັນທະບູລີ ນະຄອນຫຼວງວຽງຈັນ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    userLocation == null
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            height: 120,
                            decoration: BoxDecoration(color: Colors.amber),
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: LatLng(userLocation!.latitude!,
                                    userLocation!.longitude!),
                                zoom: 14,
                              ),
                              markers: myMarKer(),
                              myLocationEnabled: true,
                              myLocationButtonEnabled: true,
                            ),
                          )
                    // Container(
                    //   height: 120,
                    //   decoration: BoxDecoration(color: primaryColors),
                    //   child: GoogleMap(
                    //     initialCameraPosition: CameraPosition(
                    //       target: LatLng(
                    //         double.parse(
                    //           addressProvider.address.latitude!,
                    //         ),
                    //         double.parse(
                    //           addressProvider.address.longtitude!,
                    //         ),
                    //       ),
                    //       zoom: 14,
                    //     ),
                    //     markers: <Marker>[
                    //       Marker(
                    //         markerId: MarkerId('MarkerId'),
                    //         position: LatLng(
                    //           double.parse(
                    //             addressProvider.address.latitude!,
                    //           ),
                    //           double.parse(
                    //             addressProvider.address.longtitude!,
                    //           ),
                    //         ),
                    //         icon: icon!,
                    //         infoWindow: InfoWindow(
                    //             title: 'This is a Title',
                    //             snippet: 'this is a snippet'),
                    //       ),
                    //     ].toSet(),
                    //   ),
                    // ),

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 5),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text('ປະເພດທີ່ຢູ່ອາໄສ',
                    //           style: TextStyle(
                    //               fontSize: 12, color: Colors.black)),
                    //       Text('ບ້ານ',
                    //           style: TextStyle(
                    //               fontSize: 12, color: Colors.black)),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),

                SizedBox(height: 10),
                Container(
                  height: 10,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text('ລາຍລະອຽດສິນຄ້າ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.green),
                  ],
                ),

                Consumer<CartProvider>(builder: (_, cartProvider, __) {
                  if (cartProvider.loading == true) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: cartProvider.carts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ຮູບສິນຄ້າ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  Text('ຊື່',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  Text('ຈຳນວນ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  Text('ລາຄາ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    cartProvider.carts[index]['image']
                                        .toString(),
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                  Text('${cartProvider.carts[index]['name']}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  Text('${cartProvider.carts[index]['qty']}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.green)),
                                  Text(
                                      '${cartProvider.carts[index]['price']} LAK',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ລາຄາລວມ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  // Text('${widget.productModel.price} Kip',
                                  //     style:
                                  //         TextStyle(fontSize: 15, color: Colors.red)),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                })
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Center(
              child: Text(
                'ຊຳລະເງີນ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
