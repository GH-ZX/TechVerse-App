import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/language_provider.dart';
import 'providers/order_provider.dart';
import 'providers/product_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/user_provider.dart';

import 'screens/login_screen.dart';
import 'screens/main_navigation.dart';

import 'services/app_localizations.dart';
import 'services/app_theme.dart';

void main() async {
  // Ensure that the Flutter binding is initialized before calling any Flutter APIs.
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase with the default options for the current platform.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Create instances of the providers that need to load data asynchronously.
  final themeProvider = ThemeProvider();
  final languageProvider = LanguageProvider();
  final userProvider = UserProvider();

  // Load the theme and language preferences from persistent storage.
  await themeProvider.loadThemeMode();
  await languageProvider.loadLanguage();

  // Run the app by wrapping it with a MultiProvider to make the providers available to the entire widget tree.
  runApp(
    MultiProvider(
      providers: [
        // Use ChangeNotifierProvider.value for existing provider instances.
        ChangeNotifierProvider.value(value: themeProvider),
        ChangeNotifierProvider.value(value: languageProvider),
        ChangeNotifierProvider.value(value: userProvider),
        
        // Use the .create constructor for new provider instances.
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch for changes in the providers to rebuild the UI accordingly.
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return MaterialApp(
      // Hide the debug banner in the top-right corner of the screen.
      debugShowCheckedModeBanner: false,
      
      // Set the title of the app, which is used by the operating system to identify the app.
      title: 'TechVerse',
      
      // Define the light and dark themes for the app.
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      
      // Set the current theme mode based on the user's preference.
      themeMode: themeProvider.themeMode,
      
      // Set the locale for the app's internationalization.
      locale: Locale(languageProvider.currentLanguage),
      
      // Define the locales that the app supports.
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ar', ''),  // Arabic
      ],
      
      // Set up the delegates for localization.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      
      // Define the initial route of the app based on the user's login status.
      initialRoute: userProvider.isLoggedIn ? '/home' : '/login',
      
      // Define the routes for the app's navigation.
      routes: {
        '/home': (context) => const MainNavigation(),
        '/login': (context) => const LoginScreen(),
        
      },
    );
  }
}
