import 'package:flutter/material.dart';
import 'package:freefire/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  List<String> diamond = [
    '1500',
    '1400',
    '1300',
    '1200',
    '1100',
    '1000',
    '900',
    '800',
    '700',
    '600',
    '500',
  ];

  List<String> name = [
    'HIPHOP',
    'BLCK SHADE',
    'ANGELIC',
    'ARCTIC BLUE',
    'IRON BLADE',
    'BREAK DANCER',
    'BUNNY WARRIOR',
    'PURPLE SHADE',
    'RED SHADOW',
    'ZOMBIE SAMURAI',
  ];
  List<String> image = [
    'https://i.pinimg.com/736x/3e/cf/a3/3ecfa3b06dc9241c2c2c6142c6b66967.jpg',
    'https://i.pinimg.com/236x/f2/09/c0/f209c09c3a8344f9421a5de6d4b43894.jpg',
    'https://assets.pikiran-rakyat.com/crop/14x1:687x719/x/photo/2021/10/13/2229967357.jpg',
    'https://firstsportz.com/wp-content/uploads/2021/10/Arctic-Blue-Bundle-in-Free-Fire-3.jpg',
    'https://oneesports.azureedge.net/cdn-data/sites/2/2021/05/Free-Fire_Bundle-Iron-Blade-450x253.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFWncz10gcGE0Uidq0BAfLGF4Ly12nAXtD_g&usqp=CAU',
    'https://e0.pxfuel.com/wallpapers/548/95/desktop-wallpaper-fire-fire-fire-fire-fire-bunny-thumbnail.jpg',
    'https://i.pinimg.com/564x/31/d6/c2/31d6c269550bf962e197265047b6fafd.jpg',
    'https://hi-static.z-dn.net/files/d8d/51f81e91b5ba1d9fb63dbd052596a6d3.jpg',
    'https://i.pinimg.com/originals/8b/21/1d/8b211de14250c264ec59b2163de7b8dd.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('HOME'),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                        'https://www.91-cdn.com/hub/wp-content/uploads/2021/07/Free-Fire-wallpaper.png'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          title: Text(name[index]),
                          leading: index % 3 == 0
                              ? CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(image[index]),
                                )
                              : SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.network(image[index])),
                                ),
                          subtitle: Text('${diamond[index]} DMND'),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.next_week_outlined)),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const Divider();
                      },
                      itemCount: 10),
                ),
              ],
            ),
          ),
        ));
  }

  logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('LogOut'),
            content: const Text('Do You Want To logout'),
            actions: [
              TextButton(
                  onPressed: () {
                    sighnout(context);
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  Future<void> sighnout(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => LoginScreen()), (route) => false);
  }
}
