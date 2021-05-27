import 'package:yessoft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:yessoft/module_theme/service/theme_service/theme_service.dart';

class EmailPasswordRegisterForm extends StatefulWidget {
  final Function(String, String, String) onRegisterRequest;

  EmailPasswordRegisterForm({
    this.onRegisterRequest,
  });

  @override
  State<StatefulWidget> createState() => _EmailPasswordRegisterFormState();
}

class _EmailPasswordRegisterFormState extends State<EmailPasswordRegisterForm> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerEmailController =
      TextEditingController();
  final TextEditingController _registerPasswordController =
      TextEditingController();

  bool loading = false;
  bool agreed = false;

  @override
  void initState() {
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    Future.delayed(Duration(seconds: 30), () {
      loading = false;
      if (mounted) setState(() {});
    });
    if (mounted) setState(() {});
    return SingleChildScrollView(
      child: Form(
        key: _registerFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AlertDialog(
              title: Center(child: Text('signup')),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (result) {
                        if (result.isEmpty) {
                          return S.of(context).emailAddressIsRequired;
                        }
                        return null;
                      },
                      controller: _registerEmailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      controller: _registerNameController,
                      validator: (result) {
                        if (result.isEmpty) {
                          return S.of(context).required;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.supervised_user_circle_rounded),
                        labelText: 'username',
                      ),
                    ),
                    TextFormField(
                      validator: (result) {
                        if (result.length < 5) {
                          return 'Password is too short';
                        }
                        return null;
                      },
                      controller: _registerPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: () {
                          if (_registerFormKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            widget.onRegisterRequest(
                             _registerEmailController.text,
                              _registerPasswordController.text,
                              _registerNameController.text
                            );
                          }
                        },
                        color: AppThemeDataService.PrimaryDarker,
                        child:loading ? Text(
                          'loading',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ): Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
//            loading == true
//                ? Text(S.of(context).loading)
//                : Flex(
//                    direction: Axis.vertical,
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: [
//                      Padding(
//                        padding: const EdgeInsets.all(16.0),
//                        child: GestureDetector(
//                          onTap: () {
//                            Navigator.of(context).pop();
//                          },
//                          child: Text(
//                            S.of(context).iHaveAnAccount,
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.all(16.0),
//                        child: FlatButton(
//                          padding: const EdgeInsets.all(16.0),
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(16)),
//                          color: Theme.of(context).primaryColor,
//                          onPressed: (!agreed)
//                              ? null
//                              : () {
//                                  if (_registerFormKey.currentState
//                                      .validate()) {
//                                    loading = true;
//                                    setState(() {});
//                                    widget.onRegisterRequest(
//                                      _registerEmailController.text.trim(),
//                                      _registerPasswordController.text.trim(),
//                                      _registerNameController.text.trim(),
//                                    );
//                                  }
//                                },
//                          child: Text(
//                            'Next',
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  )
          ],
        ),
      ),
    );
  }
}
