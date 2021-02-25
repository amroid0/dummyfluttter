import 'package:dummyfluttter/data/repository.dart';
import 'package:dummyfluttter/model/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class WeatherState{
  const WeatherState();
}

class  WeatherStateLoading extends WeatherState{
  const WeatherStateLoading();

}
class  WeatherStateLoaded extends WeatherState{
  final Weather weather;

  const WeatherStateLoaded(this.weather);

  @override
  int get hashCode {
   return weather.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WeatherStateLoaded && other.weather == weather;
  }
}
class  WeatherStateError extends WeatherState{
  final String message;
  const WeatherStateError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherStateError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
class  WeatherStateIdle extends WeatherState{
  const WeatherStateIdle();

}

class WeatherViewModel extends StateNotifier<WeatherState>{
  final WeatherRepository _weatherRepository;
  WeatherViewModel(this._weatherRepository) : super(WeatherStateIdle());
  Future<void> getWeather(String name)async{
     try{
       state=WeatherStateLoading();
       final weather= await _weatherRepository.fetchWeather(name);
       state=WeatherStateLoaded(weather);

     }catch(e){
       state=WeatherStateError('erorr');
       
     }
  }

}














