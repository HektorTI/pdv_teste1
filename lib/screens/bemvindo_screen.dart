// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pdv_teste1/Theme/color_schemes.dart';
import 'package:pdv_teste1/controller/senha_visibilidade.dart';
import 'package:pdv_teste1/core/widgets/custom_app_bar.dart';
import 'package:pdv_teste1/screens/tela_numerica.dart';
import 'package:provider/provider.dart';

class BemVindo extends StatelessWidget {
  const BemVindo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          // Fondo con gradiente
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.amber],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          // Contenido de la pantalla (encima del fondo)
          SafeArea(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/audaz.png",
                  height: 450,
                  width: 450,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 10),

                //CNPJ
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorSchemes.darkColorScheme.outline,
                      border: Border.all(
                        color: ColorSchemes.darkColorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.headlineMedium ?? const TextStyle(), // Check for null and provide a default style
                        decoration: const InputDecoration(
                          labelText: 'CNPJ',
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //SENHA
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorSchemes.darkColorScheme.outline,
                      border: Border.all(
                        color: ColorSchemes.darkColorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.headlineMedium ?? const TextStyle(),
                        obscureText: Provider.of<SenhaVisibilidade>(context).isObscured,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          enabledBorder: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              Provider.of<SenhaVisibilidade>(context, listen: false).toggleVisibility();
                            },
                            child: Consumer<SenhaVisibilidade>(
                              builder: (context, senhaVisibility, _) => Icon(
                                senhaVisibility.isObscured ? Icons.visibility : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //BOTAO downloading
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 300, // largura desejada
                            child: MaterialButton(
                              color: const Color(0xFF1E232C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaNumerica()));
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "PDV download",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Todos os direitos reservados SoftCom ®",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
