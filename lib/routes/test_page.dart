// //test
// import 'package:eyepetizer_flutter/viewmodels/test_model.dart';
// import 'package:eyepetizer_flutter/widget/provider_widget.dart';
// import 'package:flutter/material.dart';

// class TestPage extends StatefulWidget {
//   @override
//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: ProviderWidget<TestModel>(
//           model: TestModel(),
//           onModelReady: (model) => model.initData(),
//           builder: (context, model, child) => _buildText("data"),
//         ),
//       ),
//     );
//   }

//   Widget _buildText(var data) {
//     return Container(
//       child: Center(
//         child: Text(
//           //  一定要判空
//           data == null
//               ? "weather page result is null"
//               : data.result.daily.temperature[0].date,
//         ),
//       ),
//     );
//   }
// }
