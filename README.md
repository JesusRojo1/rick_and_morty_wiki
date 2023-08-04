# rick_and_morty_show

This is a project oriented to the integration of plugins such as Dio and Bloc.
It makes use of an opensources API-rest. The purpose of this project is the correct
handling of tools, clean code, implementation of animations, query data to the api-rest
and print it in the view. It also makes use of best practices in flutter.

# Project Structure

The project as you can see below is planned to be done under a structure where each model
has its own:

   - Block directory (where are the events, states and calls to providers for query
    requests from services / endpoints).
   - Views (are those that represent the individual widgets UNIQUE to the model).
   - Screens (where all the local widgets of the model are put together to simplify the code
     and make it cleaner, giving a view with all the components together).
   - Model for data management (using quicktype for speed).
   - Provider (for requesting services with the dio plugin).

We also took into account a Common directory for:
   - Global widgets (Here you will see all the widgets that are common throughout the application.
     Example Inputs, TextViews, Loadings, etc..).
   - Constants File (Here are placed all the designs that will be implemented throughout the
     project in order that under any design changes are only made in one place for the rest of
     the application).

# Plugins used in the project
- flutter_bloc
- lottie
- local_auth
- dio
- cupertino_icons
- equatable
- flutter_native_splash

# Login

For the login view, we thought to implement a fictitious login in order to generate a
more immersive experience to a complete system, we also added biometric authentication
(only through fingerprint).

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


