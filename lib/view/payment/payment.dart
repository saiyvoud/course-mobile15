import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/provider/auth_provider.dart';

import '../../provider/product_provider.dart';

class Payment extends StatefulWidget {
  const Payment({
    super.key,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  //BitmapDescriptor? icon;
  @override
  void initState() {
    super.initState();
    // Provider.of<AuthProvider>(context, listen: false)..getProfile();
    // Provider.of<AddressProvider>(context, listen: false)..getAddressByUser();
    // BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration(size: Size(48, 48)), 'assets/icons/pin.png')
    //     .then((onValue) {
    //   icon = onValue;
    // });
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
                            // Text(
                            //     '${authProvider.userModel.firstName} ${authProvider.userModel.lastName}',
                            //     style: TextStyle(
                            //         fontSize: 12, color: Colors.black)),
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
                            //  Text('+856 ${authProvider.userModel.phoneNumber}',
                            // style: TextStyle(
                            //     fontSize: 12, color: Colors.black)),
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
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('ວັນທີ່ຈັດສົ່ງ',
                //           style: TextStyle(fontSize: 12, color: Colors.black)),
                //       Text('10-01-2023',
                //           style: TextStyle(fontSize: 12, color: Colors.black)),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('ເວລາຈັດສົ່ງ',
                //           style: TextStyle(fontSize: 12, color: Colors.black)),
                //       Text('10:00 - 20:00',
                //           style: TextStyle(fontSize: 12, color: Colors.black)),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 10),

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
                    Container(
                      height: 120,
                      decoration: BoxDecoration(color: Colors.amber),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(17.972582497953702, 102.60786588686393),
                          zoom: 14.4746,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
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
                Consumer<ProductProvider>(builder: (_, productProvider, __) {
                  if (productProvider.loading == true) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ຮູບສິນຄ້າ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('ຊື່',
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
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image.network(
                            //   widget.productModel.image!,
                            //   height: 20,
                            //   fit: BoxFit.cover,
                            // ),
                            // Text('${widget.productModel.name}',
                            //     style: TextStyle(
                            //         fontSize: 12, color: Colors.black)),
                            // Text('${widget.productModel.price} LAK',
                            //     style: TextStyle(
                            //         fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
