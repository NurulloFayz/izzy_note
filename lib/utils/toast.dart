




import '../export_libs/export_libs.dart';

void savedToast(BuildContext context) {
  FToast fToast;
  fToast = FToast();
  // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  fToast.init(context);
  fToast.showToast(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.green,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0,9),
                  blurRadius: 20,
                  blurStyle: BlurStyle.normal,
                  color: Colors.black.withOpacity(0.2),
                )
              ]
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/15,
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20,
          left: MediaQuery.of(context).size.width/20,
          ),
          child: Center(child: Text("Saved",style: TextStyle(fontSize: MediaQuery.of(context).size.height/40,color: Colors.white),)),),
      ),
      toastDuration: const Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height/20,
          left: MediaQuery.of(context).size.width/3-90,
          right: MediaQuery.of(context).size.width/3-90,
          child: child,
        );
      });
}