part of 'page.dart';

class SignUpPage extends Page<SignUpBloc> {
  SignUpPage({Key key}) : super(key: key);

  final TextEditingController _nameText = TextEditingController();
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: TopLinearProgressIndicator(
          backgroundColor: mainColor,
          valueColor:accentColor,
          stream: bloc.loadingStream,
        ),
        body: SingleChildScrollView(
          padding: paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Let's start your\nexperience now",
                style: blueTitle,
              ),
              const SizedBox(height: 36,),
              XTextField(
                controller: _nameText,
                text: 'Name',
              ),
              const SizedBox(height: 36,),
              XTextField(
                controller: _emailText,
                text: 'Email',
              ),
              const SizedBox(height: 36,),
              XTextField(
                controller: _passwordText,
                text: 'Password',
              ),
              const SizedBox(height: 36,),
              BlueRectButton(
                text: "Let's start",
                onTap: () {
                  bloc.signUp(_nameText.text, _emailText.text, _passwordText.text);
                },
              ),
              const SizedBox(height: 36,),
              Row(
                children: [
                  Text('Already have account ? ',
                    style: blackSubtitle,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, '/signin'),
                    child: Text('Join now',
                      style: blueSubtitle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ) 
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
}