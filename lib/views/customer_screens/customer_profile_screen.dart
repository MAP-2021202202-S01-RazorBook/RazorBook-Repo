// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:razor_book/app/service_locator/service_locator.dart';
// import 'package:razor_book/helpers/assets.dart';
// import 'package:razor_book/helpers/colors.dart';
// import 'package:razor_book/models/customerUserSide/customer_profile_model.dart';


// import '../common_widgets/editable_textfields.dart';
// import '../common_widgets/info_form_textfield.dart';
// import '../common_widgets/pages_appbar.dart';
// import '../common_widgets/save_cancel_buttons_.dart';

// class ProfileView extends StatelessWidget {
//   const ProfileView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // _customerProfileModel =
//     //     Provider.of<AuthViewModelProvider>(context, listen: true).cusProfile;
//     final String? uid = Provider.of<LocalStorageServiceProvider>(context).uid;
//     final CustomerProfileModel? customerProfileModel =
//         Provider.of<LocalStorageServiceProvider>(context, listen: false)
//             .cusProfile;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: appBar(bartitle: 
//           Text("Profile"),
//         onPressedFunction:   () {},
//        appBarRightIcon:    Icon(
//             Icons.shopping_cart,
//             color: Helper.kTitleTextColor,
//           )),
//       body: Consumer<ProfileViewModelProvider>(
//           builder: (context, ProfileViewModelProvider x, __) {
//         if (x.emailController.text.isEmpty) {
//           x.emailController.text = customerProfileModel!.email;
//           x.nameController.text = customerProfileModel.name;
//           x.phoneController.text = customerProfileModel.contactNumber;
//           x.addressController.text = customerProfileModel.address;
//         }
//         return SingleChildScrollView(
//           // ignore: sized_box_for_whitespace
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               children: [
//                 ProfileViewAppBar(
//                   editMode: x.editMode,
//                 ),
//                 Stack(
//                   children: [
//                     Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 52,
//                           backgroundColor: Helper.kFABColor.withOpacity(0.4),
//                           backgroundImage:
//                               AssetImage(AssetHelper.assetProfilePic),
//                         ),
//                       ],
//                     ),
//                     Positioned(
//                         top: 3,
//                         right: 10,
//                         child: InkWell(
//                             customBorder: CircleBorder(),
//                             onTap: () {
//                               x.editMode = !x.editMode;
//                             },
//                             child: Container(
//                               padding: EdgeInsets.all(2),
//                               decoration: BoxDecoration(
//                                 color: Helper.kFABColor,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Icon(
//                                 Icons.edit,
//                                 size: 17,
//                                 color: Colors.white,
//                               ),
//                             ))),
//                     Positioned(
//                         bottom: 3,
//                         left: 0,
//                         right: 0,
//                         child: InkWell(
//                             customBorder: CircleBorder(),
//                             onTap: () {},
//                             child: Icon(
//                               Icons.camera_alt,
//                               size: 17,
//                               color: Helper.kButtonColor,
//                             ))),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 32,
//                 ),
//                 textfieldLable(Text("Name")),
//                 InfoFormTextField(
//                   controller: x.nameController,
//                   editMode: !x.editMode,
//                   hintText: "Name",
//                   initValue: customerProfileModel!.name,
//                   onChange: (v) => print,
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 textfieldLable(Text("Email")),
//                 InfoFormTextField(
//                   controller: x.emailController,
//                   editMode: !x.editMode,
//                   hintText: "Email",
//                   initValue: customerProfileModel.email,
//                   onChange: (v) => print,
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 textfieldLable(Text("Mobile No")),
//                 InfoFormTextField(
//                   controller: x.phoneController,
//                   editMode: !x.editMode,
//                   hintText: "Mobile No",
//                   initValue: customerProfileModel.contactNumber,
//                   onChange: (v) => print,
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 textfieldLable(Text("Address")),
//                 InfoFormTextField(
//                   controller: x.addressController,
//                   editMode: !x.editMode,
//                   hintText: "Address",
//                   //   initValue: customerProfileModel.address,
//                   onChange: (v) => print,
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 x.editMode
//                     ? SaveCancelButtons(
//                         onCanclePressed: () {
//                           x.editMode = !x.editMode;
//                           // setState(() {

//                           // });
//                         },
//                         onSavePressed: () {
//                           // CustomerProfileModel cust = CustomerProfileModel(
//                           //   name: x.nameController.text,
//                           //   age: 11,
//                           //   email: x.emailController.text,
//                           //   contactNumber: x.phoneController.text,
//                           //   address: x.addressController.text,
//                           //   customerImage: customerProfileModel.customerImage,
//                           //   uid: customerProfileModel.uid,
//                           //   gender: customerProfileModel.gender,
//                           //   docId: customerProfileModel.docId,
//                           // );
//                           // customerServiceFirebase.updateCustomerProfile(
//                           //     cust, context);
//                         },
//                       )
//                     : Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 21, vertical: 8),
//                         child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 shape: StadiumBorder(),
//                                 primary: Helper.kFABColor,
//                                 fixedSize: Size(
//                                     MediaQuery.of(context).size.width, 56)),
//                             onPressed: () async {
//                               // await authenticationServiceFirebase
//                               //     .signOut()
//                               //     .then((value) => Navigator.of(context)
//                               //         .pushReplacement(MaterialPageRoute(
//                               //             builder: (ctx) => RootView())));
//                             },
//                             child: Text(
//                               'Logout',
//                               style: TextStyle(
//                                 fontFamily: 'Metropolis',
//                                 fontSize: 16,
//                                 color: const Color(0xffffffff),
//                                 fontWeight: FontWeight.w700,
//                               ),
//                               textAlign: TextAlign.center,
//                               softWrap: false,
//                             )),
//                       )
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }

// //this
//   Align textfieldLable(Text text) {
//     return Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 52.0),
//           child: text,
//         ));
//   }
// }

// class TextFieldTitle extends StatelessWidget {
//   const TextFieldTitle({Key? key, required this.text}) : super(key: key);
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 52.0),
//           child: Text(text),
//         ));
//   }
// }

// class ProfileViewAppBar extends StatelessWidget {
//   final bool editMode;
//   const ProfileViewAppBar({
//     Key? key,
//     required this.editMode,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             editMode ? "Edit Profile" : "Profile",
//             style: TextStyle(
//                 fontFamily: 'Metropolis',
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Helper.kTitleTextColor),
//           ),
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.shopping_cart,
//                 color: Helper.kTitleTextColor,
//               )),
//         ],
//       ),
//     );
//   }
// }