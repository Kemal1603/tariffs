import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task2/calculator/bloc/calculator_bloc.dart';
import 'package:test_task2/catalog/bloc/catalog_bloc.dart';
import 'package:test_task2/catalog/view/catalog_list_item.dart';
import 'package:test_task2/catalog/view/total_cost.dart';
import 'package:test_task2/counter/counter_cubit.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (BuildContext context, CatalogState state) {
          if (state is CatalogLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CatalogLoaded) {
            return ListView.builder(
              itemCount: state.catalog.itemNames.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < state.catalog.itemNames.length) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: BlocProvider(
                        create: (BuildContext context) => CounterCubit(),
                        child: CatalogListItem(state.catalog.getByPosition(index)),
                      ));
                } else {
                  return BlocBuilder<CalculatorBloc, CalculatorState>(
                    builder: (BuildContext context, CalculatorState state) {
                      if (state is CalculatorLoaded) {
                        if (state.calculator.items.isNotEmpty) {
                          return TotalCost(
                            totalPassengersQuantity: state.calculator.items.length,
                            totalAmount: state.calculator.totalPrice,
                          );
                        } else {
                          return Container();
                        }
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
