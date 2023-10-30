import 'package:flutter/material.dart';

import 'package:weather_apps/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/repositories/weather_repository.dart';
import 'package:weather_apps/services/weather_api_services.dart';
import 'cubits/background_images/background_images_cubit.dart';
import 'cubits/temp_settings/temp_settings_cubit.dart';
import 'cubits/text_theme/text_theme_cubit.dart';
import 'cubits/weather/weather_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => WeatherRepository(
        weatherApiServices: WeatherApiServices(),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherCubit>(
            create: (context) => WeatherCubit(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          BlocProvider<TempSettingsCubit>(
            create: (context) => TempSettingsCubit(),
          ),
          BlocProvider<BackgroundImageCubit>(
            create: (context) => BackgroundImageCubit(),
          ),
          BlocProvider<TextThemeCubit>(
            create: (context) => TextThemeCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Weather Apps',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
