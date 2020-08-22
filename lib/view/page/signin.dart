part of 'page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/logo/flutix.png',
              width: 100,
            ),
            const SizedBox(height: 36,),
            Text('Exclusive movies are\n waiting for you',
              style: blueTitle,
            ),
            const SizedBox(height: 36,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: blackSubtitle,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: accentColor,
                    width: 3
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: mainColor,
                    width: 3
                  )
                ),
              ),
            ),
            const SizedBox(height: 36,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: blackSubtitle,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: accentColor,
                    width: 3
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: mainColor,
                    width: 3
                  )
                ),
              ),
            ),
            const SizedBox(height: 36,),
            XButton(
              width: 120,
              height: 42,
              color: mainColor,
              isBorder: true,
              onTap: () {},
              child: Text("Let's go",
                style: whiteSubtitle,
              ),
            ),
            const SizedBox(height: 36,),
            Row(
              children: [
                Text("Don't have account ? ",
                  style: blackSubtitle,
                ),
                GestureDetector(
                  onTap: () => print('tap'),
                  child: Text('Join now',
                    style: blueSubtitle,
                  ),
                ),
              ],
            )
          ],
        ),
      ) 
    );
  }
}