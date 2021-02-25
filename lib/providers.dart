




import 'package:dummyfluttter/data/repository.dart';
import 'package:dummyfluttter/viewmodel/weather_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherRepoProvider= Provider((ref)=>FakeWeatherRepository());
final weatherStateProvider= StateNotifierProvider((ref)=> WeatherViewModel(ref.watch(weatherRepoProvider)
));
