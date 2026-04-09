import 'package:flutter/material.dart';
import 'package:labasDoctor/dummyData/constants.dart';
import 'package:labasDoctor/helper/apimodel.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/shared/theme.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  User.userData.userResult.image != null
                      ? Image.network(
                          "${API.API_URL}${User.userData.userResult.image}",
                          fit: BoxFit.fill,
                          height: height * .2)
                      : Image.asset("assets/images/dummy.png",
                          height: height * .2),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 222,
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${User.userData.userResult.name}",
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          "${User.userData.userResult.specilization}",
                          maxLines: 3,
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 19, color: Colors.grey),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: width * .35,
                                height: height * .03,
                                child: SmoothStarRating(
                                    allowHalfRating: false,
                                    // onRated: (v) {},
                                    // starCount: 5,
                                    rating: double.parse(User
                                        .userData.userResult.rating
                                        .toString()),
                                    size: height * .03,
                                    isReadOnly: true,
                                    color: Colors.yellow,
                                    borderColor: Colors.green,
                                    spacing: 0.0)),
                          ],
                        ),
                        // Row(
                        //   children: <Widget>[
                        //     IconTile(
                        //       backColor: Color(0xFF4894e9),
                        //       icon: Icons.email,
                        //       imgAssetPath: "assets/images/email.png",
                        //     ),
                        //     IconTile(
                        //       backColor: Color(0xFF4894e9),
                        //       icon: Icons.phone,
                        //       imgAssetPath: "assets/images/call.png",
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              ExpansionTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(.07),
                    child: Icon(
                      Icons.cast_for_education,
                      color: Theme.of(context).primaryColor,
                    )),
                title: heading("Education"),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  description("${User.userData.userResult.education}")
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              ExpansionTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(.07),
                    child: Icon(
                      Icons.work,
                      color: Theme.of(context).primaryColor,
                    )),
                title: heading("Experience"),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  description("${User.userData.userResult.experience}")
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              ExpansionTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(.07),
                    child: Icon(
                      Icons.work,
                      color: Theme.of(context).primaryColor,
                    )),
                title: heading("Services"),
                childrenPadding: EdgeInsets.all(10),
                children: [description("${User.userData.userResult.services}")],
              ),
              SizedBox(
                height: height * .02,
              ),
              ExpansionTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(.07),
                    child: Icon(
                      Icons.work,
                      color: Theme.of(context).primaryColor,
                    )),
                title: heading("Contact"),
                childrenPadding: EdgeInsets.all(10),
                children: [description("${User.userData.userResult.mobile}")],
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                getTranslated(context, 'About'),
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "${User.userData.userResult.longDes}",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget heading(String text) {
    return Text(
      "$text",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "cairo",
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }

  Widget description(String text) {
    return Text(
      "$text",
      style: TextStyle(
        color: Colors.grey,
        fontFamily: "cairo",
        fontSize: 17,
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;
  final IconData icon;

  IconTile({this.imgAssetPath, this.backColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
