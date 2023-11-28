import 'package:flutter/material.dart';
import 'package:pdv_teste1/Theme/color_schemes.dart';
import 'package:pdv_teste1/core/widgets/custom_app_bar.dart';
import 'package:pdv_teste1/screens/tela_aplicativo.dart';

class TelaNumerica extends StatefulWidget {
  const TelaNumerica({super.key});

  @override
  State<TelaNumerica> createState() => _TelaNumericaState();
}

class _TelaNumericaState extends State<TelaNumerica> {
  bool _obscureText = true;
  String _password = '';
  String? _selectedOperation;

  IconButton buildVisibilityIcon() {
    return IconButton(
      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }

  List<String> listaUsuario = ["Garçom", "Supervisor", "Atendende", "Administrador"];

  @override
  Widget build(BuildContext context) {
    // final isMobile = MediaQuery.of(context).size.width < 400;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: SafeArea(
          child: SizedBox(
            width: 370,
            height: 620, // Use altura total em telas menores
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                  width: 1.0,
                                  color: ColorSchemes.darkColorScheme.surfaceVariant,
                                ),
                              ),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 11.0),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: ColorSchemes.darkColorScheme.surfaceVariant,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: ColorSchemes.darkColorScheme.surfaceVariant,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.headlineMedium,
                                value: _selectedOperation,
                                items: listaUsuario.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedOperation = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                  width: 1.0,
                                  color: ColorSchemes.darkColorScheme.surfaceVariant,
                                ),
                              ),
                              child: TextFormField(
                                controller: TextEditingController(text: _password),
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  suffixIcon: buildVisibilityIcon(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: ColorSchemes.darkColorScheme.surfaceVariant,
                                      width: 1.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: ColorSchemes.darkColorScheme.surfaceVariant,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: ColorSchemes.darkColorScheme.surfaceVariant,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                obscureText: _obscureText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 12.0,
                              children: List.generate(
                                9,
                                (index) => buildNumberButton('${index + 1}'),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            SizedBox(
                              height: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 102,
                                    height: 100,
                                    child: buildSpecialButton('Voltar'),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Expanded(
                                    flex: 2,
                                    child: buildSpecialButton('Enter'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Copyright © 2.018 - Softcom Informática.',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'R: Toshinobu Katayama, 63 A - Kd Camaru',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '79.806-030 - Dourados - MS (67) 3423-8233',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNumberButton(String label) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          setState(() {
            _password += label;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          child: Text(label),
        ),
      ),
    );
  }

  Widget buildSpecialButton(String label) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      color: label == 'Enter' ? const Color.fromARGB(255, 165, 36, 27) : null,
      child: InkWell(
        onTap: () {
          if (label == 'Voltar') {
            setState(() {
              if (_password.isNotEmpty) {
                _password = _password.substring(0, _password.length - 1);
              }
            });
          } else if (label == 'Enter') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaAplicativo()));
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 50,
          width: label == 'Enter' ? 106 * 2 + 8 : 50,
          alignment: Alignment.center,
          child: label == 'Enter'
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Text(
                        label,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              : Text(label),
        ),
      ),
    );
  }
}
