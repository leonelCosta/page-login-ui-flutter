import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page_ui/util/constants.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _remeberMe = false;
  //? Todos os meus elementos do formulario
  Widget _buildEmailfield(){

          return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                            style: kLabelStyle,
                            ),
                          SizedBox(height: 10.0,),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: kBoxDecorationStyle,
                            height: 60.0,
                            child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.white,fontFamily: 'OpenSans'),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter you Email',
                                  hintStyle: kHintTextStyle,
                                ),
                            ),

                          ),

                        ],

                      ) ;
}

  Widget _buildSenhafield(){

          return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Senha',
                            style: kLabelStyle,
                            
                            ),
                          SizedBox(height: 10.0,),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: kBoxDecorationStyle,
                            height: 60.0,
                            child: TextField(
                                obscureText: true,
                                style: TextStyle(color: Colors.white,fontFamily: 'OpenSans'),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter you Senha',
                                  hintStyle: kHintTextStyle,
                                ),
                            ),

                          ),

                        ],

                      ) ;
}

  Widget _buildForgetPasswordBtn(){

  
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
      onPressed: ()=> print('Forgot Password Button Pressed'),
      padding: EdgeInsets.only(right: 0.0),
      child: Text(
        'Equeceu a Senha ?',
        style: kLabelStyle,
        ),

    ),

  );

}

  Widget _buildRemenberMecheckBox(){
    return Container(
      height: 20.0, 
                        child: Row(
                          children: <Widget>[
                            Theme(
                              data: ThemeData(unselectedWidgetColor: Colors.white),
                              child: Checkbox(
                                value: _remeberMe,
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                onChanged: (value){
                                  setState(() {
                                  _remeberMe = value;
                                  });
                                  //print('estou na checkedBox');
                                },

                              ),
                            ),
                            Text(
                              'Remember me',
                              style: kLabelStyle,)

                          ],

                        ),


                      );
  }

  Widget _buildBtnLogin(){
    return Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: ()=> print('Login Button'),
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Color(0xFF527DAA),
                                      letterSpacing: 2.0,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'
                                    ),),

                        ),
                      );
  }

  Widget _buildSignWithText(){
    return Column(
                        children: <Widget>[
                          Text(
                            '- OR -',
                            style: kLabelStyle, ),
                            SizedBox(height: 20.0,),
                            Text(
                            'Sign in with',
                            style: kLabelStyle, ),
                        ],


                      );
  }

    Widget _buildSocialBtn(Function onTap, AssetImage logo){

       return GestureDetector(
                                    onTap: onTap,
                                    child: Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0,2),
                                        blurRadius: 6.0,
                                      ),
                                      ],
                                      image: DecorationImage(
                                        image: logo,
                                      ),
                                    ),
                                  ),
                                );
    }
  Widget _buildSocialBtnRow(){

      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildSocialBtn(()=> print('Login with FaceBook'), AssetImage('assets/logos/facebook.jpg')),
                            _buildSocialBtn(()=> print('Login with Gooogle'), AssetImage('assets/logos/google.jpg')),

                          ],
                        ),
      );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
                 child: GestureDetector(
                    onTap: ()=> FocusScope.of(context),
         child: Stack(
          children: <Widget>[
            Container( // Container usado para definir a cor do fundo
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1,0.4,0.7,0.9],
                  )
            ),
            ),
            Container(
                height: double.infinity,
                child: SingleChildScrollView( //a view aonde vamos desenhar os INPut elementos
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric( // adicionando os padding necessario e ajustar aonde vai começar os elementos adiconado na tela
                    horizontal: 40.0,
                    vertical: 60.0
                  ),
                  child: Column( // filho do container Acima e alinhador dos INPUTs
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                          style: TextStyle(
                          color: Colors.white,
                          fontFamily:'OpenSans',
                          fontSize:30.0,
                          fontWeight: FontWeight.bold, ),
                         ),
                          SizedBox(
                            height: 30.0,
                            ),
                          _buildEmailfield(),
                          SizedBox(height: 30.0,),
                          _buildSenhafield(),
                          _buildForgetPasswordBtn(),
                          _buildRemenberMecheckBox(),
                          _buildBtnLogin(),
                          _buildSignWithText(),
                          _buildSocialBtnRow(),



                    ],

                  ),
                ),
            )

          ],

        ),
              ),
      ),
    );
  }
}