// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kemal_tariffs/calculator/calculator.dart';
//
// class CalculatorPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Calculator')),
//       body: ColoredBox(
//         color: Colors.yellow,
//         child: Column(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(32),
//                 child: CalculatorList(),
//               ),
//             ),
//             const Divider(height: 4, color: Colors.black),
//             CalculatorTotal()
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CalculatorList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final itemNameStyle = Theme.of(context).textTheme.headline6;
//
//     return BlocBuilder<CalculatorBloc, CalculatorState>(
//       builder: (context, state) {
//         if (state is CalculatorLoading) {
//           return const CircularProgressIndicator();
//         }
//         if (state is CalculatorLoaded) {
//           return ListView.separated(
//             itemCount: state.calculator.items.length,
//             separatorBuilder: (_, __) => const SizedBox(height: 4),
//             itemBuilder: (context, index) {
//               final item = state.calculator.items[index];
//               return Material(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 clipBehavior: Clip.hardEdge,
//                 child: ListTile(
//                   leading: const Icon(Icons.done),
//                   title: Text(item.name, style: itemNameStyle),
//                   onLongPress: () {
//                     context
//                         .read<CalculatorBloc>()
//                         .add(CalculatorItemRemoved(item));
//                   },
//                 ),
//               );
//             },
//           );
//         }
//         return const Text('Something went wrong!');
//       },
//     );
//   }
// }
//
// class CalculatorTotal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final hugeStyle =
//         Theme.of(context).textTheme.headline1?.copyWith(fontSize: 48);
//
//     return SizedBox(
//       height: 200,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             BlocBuilder<CalculatorBloc, CalculatorState>(
//                 builder: (context, state) {
//               if (state is CalculatorLoading) {
//                 return const CircularProgressIndicator();
//               }
//               if (state is CalculatorLoaded) {
//                 return Text('\$${state.calculator.totalPrice}',
//                     style: hugeStyle);
//               }
//               return const Text('Something went wrong!');
//             }),
//             const SizedBox(width: 24),
//             ElevatedButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Buying not supported yet.')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(primary: Colors.black),
//               child: const Text('BUY'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
