import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  final transitionDuration = const Duration(seconds: 3);
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _lottieAnimation.addListener(() => setState(() {}));
    TickerFuture tickerFuture = _lottieAnimation.repeat();
    tickerFuture.timeout(Duration(seconds: 3 * 20), onTimeout: () {
      _lottieAnimation.forward(from: 0);
      _lottieAnimation.stop(canceled: true);
    });
  }

  void navigate() async {
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.75,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: LottieBuilder.asset(
                    'assets/lottie/sport-ball.json',
                    onLoaded: (composition) {
                      _lottieAnimation.duration = composition.duration;
                    },
                    frameRate: FrameRate.max,
                    repeat: true,
                    animate: true,
                    height: 400,
                    width: 400,
                    controller: _lottieAnimation,
                  ),
                ),
                // child: Image.asset('assets/images/profilesule.png', width: 200, height: 200,),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 1.9,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                      child: Text(
                        "Welcome Brother",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Brotherly FC App diperuntukan untuk managerial Jadwal Tanding, Kehadiran pemain & Statistik pemain. Keep it healthy and fun !",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width / 1.12,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          elevation: 3,
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                            });
                            navigate();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: _isLoading == true
                              ? progressIndicator()
                              : Text(
                                  'Lets Play',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  SizedBox progressIndicator() {
    return SizedBox(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
      ),
      height: 20.0,
      width: 20.0,
    );
  }
}
