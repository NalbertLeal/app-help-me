import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import '../providers/project_provider.dart';
import '../../../utils/navigation.dart';
import '../../../domain/use_cases/logout.dart';
import '../../../data/repositories/user_repository.dart';
import './projetc_profile.dart';

class FindProjectPage extends HookWidget {
  static final String route = '/find-project';

  @override
  Widget build(BuildContext context) {
    final project = useProvider(projectProvider);

    final appBar = AppBar(
      leading: Text(''),
      actions: [
        FlatButton(
          color: Colors.white,
          child: Text('Project Profile'),
          onPressed: () {
            Navigation().navigatoTo(ProjectProfilePage.route);
          },
        ),
        project.usuarioLogado ? FlatButton(
          color: Colors.white,
          child: Text(
            'Logout',
          ),
          onPressed: () {
            Logout(UserRepository()).execute();
            project.usuarioLogado = false;
            Navigation().navigatoTo('/');
          },
        ) : Text(''),
      ],
    );

    final double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            child: Column(
              children: [
                Container(
                  width: width * .8,
                  height: height * .2,
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Buscar projetos por nome',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Buscar projetos por categoria',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: height * .8,
                  child: FlutterMap(
                    options: new MapOptions(
                      center: new LatLng(51.5, -0.09),
                      zoom: 13.0,
                    ),
                    layers: [
                      new TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                      new MarkerLayerOptions(
                        markers: [
                          new Marker(
                            width: 80.0,
                            height: 80.0,
                            point: new LatLng(51.5, -0.09),
                            builder: (ctx) => new Container(
                              child: new FlutterLogo(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
