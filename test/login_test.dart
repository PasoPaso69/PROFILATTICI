

import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/login/accesso/login.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/fakeLoginPageViewModel.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';



void main() {
  //tutta questa prima parte serve per creare un fakeViewModel che simula il comportamento del LoginPageViewModel
  // in modo da poter testare la pagina di login senza dipendere da Firebase o altri servizi esterni.
  late FakeLoginPageViewModel fakeViewModel;

  setUp(() {
    fakeViewModel = FakeLoginPageViewModel();
  });

  testWidgets("Button disabled when email and password are empty", (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<LoginPageViewModel>.value(
        value: fakeViewModel,
        child: const MaterialApp(
          home: LoginPage(),
        ),
      ),
    );

    final loginButton = find.byKey(const Key("loginButton"));
    final usernameField = find.byKey(const Key("usernameField"));
    final passwordField = find.byKey(const Key("passwordField"));

    // Bottone inizialmente disabilitato (onPressed == null)
    expect(tester.widget<ElevatedButton>(loginButton).onPressed, isNull);

    // Inserisci username
    await tester.enterText(usernameField, "user");
    await tester.pump();

    // Bottone ancora disabilitato
    expect(tester.widget<ElevatedButton>(loginButton).onPressed, isNull);

    // Inserisci password
    await tester.enterText(passwordField, "password");
    await tester.pump();

    // Bottone ora abilitato (onPressed != null)
    expect(tester.widget<ElevatedButton>(loginButton).onPressed, isNotNull);
  });
}

