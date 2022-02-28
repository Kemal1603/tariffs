import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task2/catalog/models/catalog.dart';
import 'package:test_task2/catalog/models/tariff.dart';
import 'package:test_task2/tariff_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({required this.tariffRepository}) : super(CatalogLoading()) {
    on<CatalogStarted>(_onStarted);
  }

  final TariffRepository tariffRepository;

  void _onStarted(CatalogStarted event, Emitter<CatalogState> emit) async {
    emit(CatalogLoading());
    try {
      final List<Tariff> catalog = await tariffRepository.loadCatalog();
      emit(CatalogLoaded(Catalog(itemNames: catalog)));
    } catch (_) {
      emit(CatalogError());
    }
  }
}
