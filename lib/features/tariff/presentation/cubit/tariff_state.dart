part of 'tariff_cubit.dart';


abstract class TariffState extends Equatable {
  const TariffState();

  @override
  List<Object> get props => [];
}

class TariffInitialState extends TariffState{}

class TariffEmptyState extends TariffState{}

class TariffLoadingState extends TariffState{}

class TariffLoadedState extends TariffState{
  final List<TariffEntity> tariffList;
  const TariffLoadedState({required this.tariffList});

  @override
  List<Object> get props => tariffList;
}

class TariffErrorState extends TariffState{
  final String errorMessage;
  const TariffErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}