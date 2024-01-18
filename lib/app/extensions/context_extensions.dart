import 'package:reddit_clone/app/app_dependencies.dart';

extension ContextExtensions on BuildContext {

  TextTheme get _textThemeContext => Theme.of(this).textTheme;

  TextStyle? get headlineSmallStyle   => _textThemeContext.headlineSmall;
  TextStyle? get headlineMediumStyle  => _textThemeContext.headlineMedium;
  TextStyle? get headlineLargeStyle   => _textThemeContext.headlineLarge;

  TextStyle? get displaySmallStyle  => _textThemeContext.displaySmall;
  TextStyle? get displayMediumStyle => _textThemeContext.displayMedium;
  TextStyle? get displayLargeStyle  => _textThemeContext.displayLarge;

  TextStyle? get titleSmallStyle => _textThemeContext.titleSmall;
  TextStyle? get titleMediumStyle => _textThemeContext.titleMedium;
  TextStyle? get titleLargeStyle => _textThemeContext.titleLarge;

  TextStyle? get bodySmallStyle => _textThemeContext.bodySmall;
  TextStyle? get bodyMediumStyle => _textThemeContext.bodyMedium;
  TextStyle? get bodyLargeStyle => _textThemeContext.bodyLarge;

  TextStyle? get labelSmallStyle => _textThemeContext.labelSmall;
  TextStyle? get labelMediumStyle => _textThemeContext.labelMedium;
  TextStyle? get labelLargeStyle => _textThemeContext.labelLarge;

  ///Colors
  ThemeData get _theme => Theme.of(this);
  Color get primaryColor => _theme.colorScheme.primary;
  Color get primaryColorLight => _theme.primaryColorLight;
  Color get onPrimaryColor => _theme.colorScheme.onPrimary;
  Color get shadowColor => _theme.colorScheme.shadow;
  Color get errorColor => _theme.colorScheme.error;
  Color get cardColor => _theme.cardColor;
  Color get disabledColor => _theme.disabledColor;
  Color get dividerColor => _theme.dividerColor;
  Color get backgroundColor => _theme.colorScheme.background;
  Color get onBackgroundColor => _theme.colorScheme.onBackground;
  Color get surfaceColor => _theme.colorScheme.surface;
  Color get onSurfaceColor => _theme.colorScheme.onSurface;
  Color get onSurfaceVariantColor => _theme.colorScheme.onSurfaceVariant;
  Color get onSecondaryColor => _theme.colorScheme.onSecondary;

  //Layout
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;


}