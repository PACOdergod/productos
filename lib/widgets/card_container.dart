import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/ui/input_decorations.dart';

class CardContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: boxDeco(),

      child: Column(
        children: [
          SizedBox(height: 10),

          Text('Login', style: Theme.of(context).textTheme.headline4,),

          SizedBox(height: 30,),

          ChangeNotifierProvider<LoginFormProvider>(
            create: (_)=> new LoginFormProvider(),
            child: _LoginForm(),
          )

        ],
      ),
    );
  }

  BoxDecoration boxDeco()=> BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5)
      )
    ]
  );

}

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        //TODO: mantener la referencia al key
        key: provider.globalKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.loginInputMail(),

              onChanged: ( value )=> provider.email= value,

              validator: ( value ){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch( value ?? '' )
                  ? null
                  : 'El correo no es valido';
              },
            ),

            SizedBox(height: 20),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: InputDecorations.loginInputPass(),
              onChanged: ( value )=> provider.password = value,

              validator: (value){

                if (value != null && value.length>=6 ) return null;
                else return 'Minimo 6 caracteres';
              },
            ),

            SizedBox(height: 20),

            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.purple,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                child: Text('Ingresar', style: TextStyle(color: Colors.white)),
              ),

              onPressed: (){

                FocusScope.of(context).unfocus();

                if (!provider.isValidForm()) return;

                Navigator.pushReplacementNamed(context, 'loading');
              } 
            )

          ],
        ),
      ),
    );
  }
}