import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snapchat_clone/models/images/profile_picture.dart';
import 'package:snapchat_clone/models/json/get_profile_pic.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  final GetProfilePic _getProfilePic = GetProfilePic();

  final _image = 'assets/images/profile_pic.jpg';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getProfilePic.loadProfilePicture(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            ;
            return GestureDetector(
              onTap: () {
                context.push('/profile');
              },
              child: CircleAvatar(
                backgroundImage:
                    //p.image != ''
                    //   ? NetworkImage(p.image)
                    //   :
                    Image.asset('${snapshot.data!.first}').image,
              ),
            );
          } else if (snapshot.data == null ||
              snapshot.connectionState == ConnectionState.none) {
            return GestureDetector(
              onTap: () {
                context.push('/profile');
              },
              child: CircleAvatar(
                backgroundImage:
                    //p.image != ''
                    //   ? NetworkImage(p.image)
                    //   :
                    Image.asset(_image).image,
              ),
            );
          }

          return const CircularProgressIndicator();
        });
  }
}
