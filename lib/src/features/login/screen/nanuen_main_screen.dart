// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class NanuenMainScreen extends StatefulWidget {
//   const NanuenMainScreen({super.key});

//   @override
//   _NanuenMainScreenState createState() => _NanuenMainScreenState();
// }

// class _NanuenMainScreenState extends State<NanuenMainScreen> {
//   final _authentication = FirebaseAuth.instance;
//   User? loggedUser;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCurrentUser();
//   }

//   void getCurrentUser() {
//     try {
//       final user = _authentication.currentUser;
//       if (user != null) {
//         loggedUser = user;
//         print(loggedUser!.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: const Text('Nanuen main screen'),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.exit_to_app_sharp,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               _authentication.signOut();
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//       body: const Center(
//         child: Text('Nanuen main page'),
//       ),
//     );
//   }
// }
