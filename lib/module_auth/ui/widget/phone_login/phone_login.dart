import 'package:yessoft/generated/l10n.dart';
import 'package:flutter/material.dart';

class PhoneLoginWidget extends StatefulWidget {
  final Function(String) onLoginRequested;
  final bool isRegister;

  PhoneLoginWidget({
    this.onLoginRequested,
    this.isRegister = false,
  });

  @override
  State<StatefulWidget> createState() => _PhoneLoginWidgetState();
}

class _PhoneLoginWidgetState extends State<PhoneLoginWidget> {
  final GlobalKey _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  String countryCode = '+963';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _signUpFormKey,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: FlutterLogo(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DropdownButton(
                    onChanged: (v) {
                      countryCode = v;
                      if (mounted) setState(() {});
                    },
                    value: countryCode,
                    items: [
                      DropdownMenuItem(
                        value: '+966',
                        child: Text(S.of(context).saudiArabia),
                      ),
                      DropdownMenuItem(
                        value: '+961',
                        child: Text(S.of(context).lebanon),
                      ),
                      DropdownMenuItem(
                        value: '+963',
                        child: Text(S.of(context).syria),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                            labelText: S.of(context).phoneNumber,
                            hintText: '111 111 11111'),
                        validator: (v) {
                          if (v.isEmpty) {
                            return S.of(context).pleaseInputPhoneNumber;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: FlatButton(
                color: widget.isRegister
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColor,
                onPressed: () {
                  String phone = _phoneController.text;
                  if (phone[0] == '0') {
                    phone = phone.substring(1);
                  }
                  widget.onLoginRequested(countryCode + phone);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).sendMeCode,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
