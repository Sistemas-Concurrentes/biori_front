import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4283655460),
      surfaceTint: Color(4283655460),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292275100),
      onPrimaryContainer: Color(4279639808),
      secondary: Color(4284178759),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292863684),
      onSecondaryContainer: Color(4279770633),
      tertiary: Color(4281951839),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290571490),
      onTertiaryContainer: Color(4278198300),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(-1376298),
      onBackground: Color(4279966741),
      surface: Color(4294638318),
      onSurface: Color(4279966741),
      surfaceVariant: Color(4293125332),
      onSurfaceVariant: Color(4282796092),
      outline: Color(4285954155),
      outlineVariant: Color(4291217592),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348393),
      inverseOnSurface: Color(4294111717),
      inversePrimary: Color(4290432898),
      primaryFixed: Color(4292275100),
      onPrimaryFixed: Color(4279639808),
      primaryFixedDim: Color(4290432898),
      onPrimaryFixedVariant: Color(4282141710),
      secondaryFixed: Color(4292863684),
      onSecondaryFixed: Color(4279770633),
      secondaryFixedDim: Color(4291021482),
      onSecondaryFixedVariant: Color(4282599729),
      tertiaryFixed: Color(4290571490),
      onTertiaryFixed: Color(4278198300),
      tertiaryFixedDim: Color(4288794823),
      onTertiaryFixedVariant: Color(4280307271),
      surfaceDim: Color(4292598735),
      surfaceBright: Color(4294638318),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294309096),
      surfaceContainer: Color(4293914594),
      surfaceContainerHigh: Color(4293519837),
      surfaceContainerHighest: Color(4293125079),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281878537),
      surfaceTint: Color(4283655460),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285102905),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282336557),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285626460),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280044099),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283465077),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294638318),
      onBackground: Color(4279966741),
      surface: Color(4294638318),
      onSurface: Color(4279966741),
      surfaceVariant: Color(4293125332),
      onSurfaceVariant: Color(4282532920),
      outline: Color(4284375124),
      outlineVariant: Color(4286217326),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348393),
      inverseOnSurface: Color(4294111717),
      inversePrimary: Color(4290432898),
      primaryFixed: Color(4285102905),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283523618),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285626460),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283981637),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283465077),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281820252),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598735),
      surfaceBright: Color(4294638318),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294309096),
      surfaceContainer: Color(4293914594),
      surfaceContainerHigh: Color(4293519837),
      surfaceContainerHighest: Color(4293125079),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279969280),
      surfaceTint: Color(4283655460),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281878537),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280230927),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282336557),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200355),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280044099),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294638318),
      onBackground: Color(4279966741),
      surface: Color(4294638318),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293125332),
      onSurfaceVariant: Color(4280427803),
      outline: Color(4282532920),
      outlineVariant: Color(4282532920),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348393),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4292933028),
      primaryFixed: Color(4281878537),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280561920),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282336557),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280889113),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280044099),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203181),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598735),
      surfaceBright: Color(4294638318),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294309096),
      surfaceContainer: Color(4293914594),
      surfaceContainerHigh: Color(4293519837),
      surfaceContainerHighest: Color(4293125079),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4290432898),
      surfaceTint: Color(4290432898),
      onPrimary: Color(4280759552),
      primaryContainer: Color(4282141710),
      onPrimaryContainer: Color(4292275100),
      secondary: Color(4291021482),
      onSecondary: Color(4281152284),
      secondaryContainer: Color(4282599729),
      onSecondaryContainer: Color(4292863684),
      tertiary: Color(4288794823),
      onTertiary: Color(4278335281),
      tertiaryContainer: Color(4280307271),
      onTertiaryContainer: Color(4290571490),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279374861),
      onBackground: Color(4293125079),
      surface: Color(4279374861),
      onSurface: Color(4293125079),
      surfaceVariant: Color(4282796092),
      onSurfaceVariant: Color(4291217592),
      outline: Color(4287664772),
      outlineVariant: Color(4282796092),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293125079),
      inverseOnSurface: Color(4281348393),
      inversePrimary: Color(4283655460),
      primaryFixed: Color(4292275100),
      onPrimaryFixed: Color(4279639808),
      primaryFixedDim: Color(4290432898),
      onPrimaryFixedVariant: Color(4282141710),
      secondaryFixed: Color(4292863684),
      onSecondaryFixed: Color(4279770633),
      secondaryFixedDim: Color(4291021482),
      onSecondaryFixedVariant: Color(4282599729),
      tertiaryFixed: Color(4290571490),
      onTertiaryFixed: Color(4278198300),
      tertiaryFixedDim: Color(4288794823),
      onTertiaryFixedVariant: Color(4280307271),
      surfaceDim: Color(4279374861),
      surfaceBright: Color(4281874994),
      surfaceContainerLowest: Color(4279045896),
      surfaceContainerLow: Color(4279966741),
      surfaceContainer: Color(4280229913),
      surfaceContainerHigh: Color(4280888099),
      surfaceContainerHighest: Color(4281611821),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4290696070),
      surfaceTint: Color(4290432898),
      onPrimary: Color(4279310592),
      primaryContainer: Color(4286945362),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291284654),
      onSecondary: Color(4279441413),
      secondaryContainer: Color(4287468662),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289057995),
      onTertiary: Color(4278196759),
      tertiaryContainer: Color(4285307281),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279374861),
      onBackground: Color(4293125079),
      surface: Color(4279374861),
      onSurface: Color(4294769647),
      surfaceVariant: Color(4282796092),
      onSurfaceVariant: Color(4291546300),
      outline: Color(4288849045),
      outlineVariant: Color(4286743671),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293125079),
      inverseOnSurface: Color(4280888099),
      inversePrimary: Color(4282207759),
      primaryFixed: Color(4292275100),
      onPrimaryFixed: Color(4279046912),
      primaryFixedDim: Color(4290432898),
      onPrimaryFixedVariant: Color(4281088768),
      secondaryFixed: Color(4292863684),
      onSecondaryFixed: Color(4279112450),
      secondaryFixedDim: Color(4291021482),
      onSecondaryFixedVariant: Color(4281481505),
      tertiaryFixed: Color(4290571490),
      onTertiaryFixed: Color(4278195473),
      tertiaryFixedDim: Color(4288794823),
      onTertiaryFixedVariant: Color(4278926647),
      surfaceDim: Color(4279374861),
      surfaceBright: Color(4281874994),
      surfaceContainerLowest: Color(4279045896),
      surfaceContainerLow: Color(4279966741),
      surfaceContainer: Color(4280229913),
      surfaceContainerHigh: Color(4280888099),
      surfaceContainerHighest: Color(4281611821),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294377431),
      surfaceTint: Color(4290432898),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290696070),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294442716),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291284654),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293656570),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289057995),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279374861),
      onBackground: Color(4293125079),
      surface: Color(4279374861),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282796092),
      onSurfaceVariant: Color(4294704363),
      outline: Color(4291546300),
      outlineVariant: Color(4291546300),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293125079),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4280430080),
      primaryFixed: Color(4292538528),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290696070),
      onPrimaryFixedVariant: Color(4279310592),
      secondaryFixed: Color(4293126857),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291284654),
      onSecondaryFixedVariant: Color(4279441413),
      tertiaryFixed: Color(4290834919),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289057995),
      onTertiaryFixedVariant: Color(4278196759),
      surfaceDim: Color(4279374861),
      surfaceBright: Color(4281874994),
      surfaceContainerLowest: Color(4279045896),
      surfaceContainerLow: Color(4279966741),
      surfaceContainer: Color(4280229913),
      surfaceContainerHigh: Color(4280888099),
      surfaceContainerHighest: Color(4281611821),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
