import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4287254562),
      surfaceTint: Color(4287254562),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294958278),
      onPrimaryContainer: Color(4281340928),
      secondary: Color(4283000622),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291489446),
      onSecondaryContainer: Color(4279050240),
      tertiary: Color(4284440885),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293256878),
      onTertiaryContainer: Color(4280032512),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294965493),
      onBackground: Color(4280424981),
      surface: Color(4294965493),
      onSurface: Color(4280424981),
      surfaceVariant: Color(4294172371),
      onSurfaceVariant: Color(4283581499),
      outline: Color(4286870634),
      outlineVariant: Color(4292330423),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871913),
      inverseOnSurface: Color(4294897124),
      inversePrimary: Color(4294948741),
      primaryFixed: Color(4294958278),
      onPrimaryFixed: Color(4281340928),
      primaryFixedDim: Color(4294948741),
      onPrimaryFixedVariant: Color(4285413644),
      secondaryFixed: Color(4291489446),
      onSecondaryFixed: Color(4279050240),
      secondaryFixedDim: Color(4289712524),
      onSecondaryFixedVariant: Color(4281486872),
      tertiaryFixed: Color(4293256878),
      onTertiaryFixed: Color(4280032512),
      tertiaryFixedDim: Color(4291349140),
      onTertiaryFixedVariant: Color(4282861855),
      surfaceDim: Color(4293384142),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963690),
      surfaceContainer: Color(4294700002),
      surfaceContainerHigh: Color(4294370780),
      surfaceContainerHighest: Color(4293976022),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4285084936),
      surfaceTint: Color(4287254562),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289029430),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281223700),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284448322),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282598684),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285888329),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294965493),
      onBackground: Color(4280424981),
      surface: Color(4294965493),
      onSurface: Color(4280424981),
      surfaceVariant: Color(4294172371),
      onSurfaceVariant: Color(4283318328),
      outline: Color(4285226067),
      outlineVariant: Color(4287133550),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871913),
      inverseOnSurface: Color(4294897124),
      inversePrimary: Color(4294948741),
      primaryFixed: Color(4289029430),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287057440),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284448322),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282868779),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285888329),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284309298),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293384142),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963690),
      surfaceContainer: Color(4294700002),
      surfaceContainerHigh: Color(4294370780),
      surfaceContainerHighest: Color(4293976022),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281997568),
      surfaceTint: Color(4287254562),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285084936),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279379712),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281223700),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280427521),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282598684),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294965493),
      onBackground: Color(4280424981),
      surface: Color(4294965493),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4294172371),
      onSurfaceVariant: Color(4281147930),
      outline: Color(4283318328),
      outlineVariant: Color(4283318328),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871913),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4294961370),
      primaryFixed: Color(4285084936),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283048448),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281223700),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279841537),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282598684),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281151239),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293384142),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963690),
      surfaceContainer: Color(4294700002),
      surfaceContainerHigh: Color(4294370780),
      surfaceContainerHighest: Color(4293976022),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294948741),
      surfaceTint: Color(4294948741),
      onPrimary: Color(4283442432),
      primaryContainer: Color(4285413644),
      onPrimaryContainer: Color(4294958278),
      secondary: Color(4289712524),
      onSecondary: Color(4280039171),
      secondaryContainer: Color(4281486872),
      onSecondaryContainer: Color(4291489446),
      tertiary: Color(4291349140),
      onTertiary: Color(4281414411),
      tertiaryContainer: Color(4282861855),
      onTertiaryContainer: Color(4293256878),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279833101),
      onBackground: Color(4293976022),
      surface: Color(4279833101),
      onSurface: Color(4293976022),
      surfaceVariant: Color(4283581499),
      onSurfaceVariant: Color(4292330423),
      outline: Color(4288646531),
      outlineVariant: Color(4283581499),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293976022),
      inverseOnSurface: Color(4281871913),
      inversePrimary: Color(4287254562),
      primaryFixed: Color(4294958278),
      onPrimaryFixed: Color(4281340928),
      primaryFixedDim: Color(4294948741),
      onPrimaryFixedVariant: Color(4285413644),
      secondaryFixed: Color(4291489446),
      onSecondaryFixed: Color(4279050240),
      secondaryFixedDim: Color(4289712524),
      onSecondaryFixedVariant: Color(4281486872),
      tertiaryFixed: Color(4293256878),
      onTertiaryFixed: Color(4280032512),
      tertiaryFixedDim: Color(4291349140),
      onTertiaryFixedVariant: Color(4282861855),
      surfaceDim: Color(4279833101),
      surfaceBright: Color(4282464049),
      surfaceContainerLowest: Color(4279504136),
      surfaceContainerLow: Color(4280424981),
      surfaceContainer: Color(4280688153),
      surfaceContainerHigh: Color(4281411618),
      surfaceContainerHighest: Color(4282135341),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294950287),
      surfaceTint: Color(4294948741),
      onPrimary: Color(4280815360),
      primaryContainer: Color(4291133775),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289975952),
      onSecondary: Color(4278852096),
      secondaryContainer: Color(4286224987),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4291677848),
      onTertiary: Color(4279638016),
      tertiaryContainer: Color(4287796322),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279833101),
      onBackground: Color(4293976022),
      surface: Color(4279833101),
      onSurface: Color(4294966008),
      surfaceVariant: Color(4283581499),
      onSurfaceVariant: Color(4292593595),
      outline: Color(4289896341),
      outlineVariant: Color(4287725686),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293976022),
      inverseOnSurface: Color(4281411619),
      inversePrimary: Color(4285479437),
      primaryFixed: Color(4294958278),
      onPrimaryFixed: Color(4280355584),
      primaryFixedDim: Color(4294948741),
      onPrimaryFixedVariant: Color(4283967744),
      secondaryFixed: Color(4291489446),
      onSecondaryFixed: Color(4278654208),
      secondaryFixedDim: Color(4289712524),
      onSecondaryFixedVariant: Color(4280433928),
      tertiaryFixed: Color(4293256878),
      onTertiaryFixed: Color(4279308800),
      tertiaryFixedDim: Color(4291349140),
      onTertiaryFixedVariant: Color(4281743376),
      surfaceDim: Color(4279833101),
      surfaceBright: Color(4282464049),
      surfaceContainerLowest: Color(4279504136),
      surfaceContainerLow: Color(4280424981),
      surfaceContainer: Color(4280688153),
      surfaceContainerHigh: Color(4281411618),
      surfaceContainerHighest: Color(4282135341),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294966008),
      surfaceTint: Color(4294948741),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294950287),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294180834),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289975952),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294835908),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291677848),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279833101),
      onBackground: Color(4293976022),
      surface: Color(4279833101),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4283581499),
      onSurfaceVariant: Color(4294966008),
      outline: Color(4292593595),
      outlineVariant: Color(4292593595),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293976022),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4282785536),
      primaryFixed: Color(4294959567),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294950287),
      onPrimaryFixedVariant: Color(4280815360),
      secondaryFixed: Color(4291752618),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289975952),
      onSecondaryFixedVariant: Color(4278852096),
      tertiaryFixed: Color(4293520050),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291677848),
      onTertiaryFixedVariant: Color(4279638016),
      surfaceDim: Color(4279833101),
      surfaceBright: Color(4282464049),
      surfaceContainerLowest: Color(4279504136),
      surfaceContainerLow: Color(4280424981),
      surfaceContainer: Color(4280688153),
      surfaceContainerHigh: Color(4281411618),
      surfaceContainerHighest: Color(4282135341),
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

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(4281423556),
    value: Color(4281423556),
    light: ColorFamily(
      color: Color(4283260050),
      onColor: Color(4294967295),
      colorContainer: Color(4292665855),
      onColorContainer: Color(4278392651),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4283260050),
      onColor: Color(4294967295),
      colorContainer: Color(4292665855),
      onColorContainer: Color(4278392651),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4283260050),
      onColor: Color(4294967295),
      colorContainer: Color(4292665855),
      onColorContainer: Color(4278392651),
    ),
    dark: ColorFamily(
      color: Color(4290168063),
      onColor: Color(4280102241),
      colorContainer: Color(4281681017),
      onColorContainer: Color(4292665855),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4290168063),
      onColor: Color(4280102241),
      colorContainer: Color(4281681017),
      onColorContainer: Color(4292665855),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4290168063),
      onColor: Color(4280102241),
      colorContainer: Color(4281681017),
      onColorContainer: Color(4292665855),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    customColor1,
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
