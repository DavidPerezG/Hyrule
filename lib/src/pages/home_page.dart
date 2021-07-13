import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyrule_application/src/model/hyrule_model.dart';
import 'package:hyrule_application/src/provider/hyrule_state.dart';
import 'package:get/get.dart';
import 'package:flip_card/flip_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  @override
  void initState() {
    final _herramientaState = Get.put(HyruleState());
    _herramientaState.obtenerHerramientas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_mediaSize.height * 1),
        child: _TopImage(),
      ),
      body: SafeArea(
        child: _Menu(),
      ),
    );
  }
}

class _TopImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;

    return Container(
        child: Stack(
      children: [
        Image.asset('assets/fondohyrule.jpg', fit: BoxFit.contain),
        Positioned(
            bottom: _mediaSize.width * 0.05,
            left: _mediaSize.width * 0.05,
            child: Column(children: [
              Text(
                "Equipment",
                style: TextStyle(
                    fontFamily: 'Zelda',
                    fontSize: _mediaSize.width * 0.13,
                    color: Colors.white),
              ),
              Text(
                "Breath of the Wild",
                style: TextStyle(
                    fontFamily: 'Zelda',
                    fontSize: _mediaSize.width * 0.07,
                    color: Colors.white),
              ),
            ]))
      ],
    ));
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<HyruleState>(builder: (HyruleState hyruleState) {
        hyruleState.herramientas.sort((a, b) => a.id.compareTo(b.id));
        return GridView.builder(
          itemCount: hyruleState.herramientas.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int i) {
            final _herramienta = hyruleState.herramientas[i];
            return _Cards(_herramienta);
            // return Text(_herramienta.attack.toString());
          },
        );
      }),
    );
  }
}

class _Cards extends StatelessWidget {
  final HyruleModel _herramienta;
  _Cards(this._herramienta);

  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;
    return Container(
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: _FrontFaceCard(_herramienta),
        back: _BackFaceCard(_herramienta),
      ),
    );
  }
}

class _FrontFaceCard extends StatelessWidget {
  final HyruleModel _herramienta;
  _FrontFaceCard(this._herramienta);
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      child: Stack(
        children: [
          Image.network(_herramienta.image,
              width: double.infinity, fit: BoxFit.contain),
          Container(
              width: double.infinity,
              child: Card(
                child: Text(
                  _herramienta.name.capitalize,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Zelda',
                    fontSize: _mediaSize.width * 0.04,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _BackFaceCard extends StatelessWidget {
  final HyruleModel _herramienta;
  _BackFaceCard(this._herramienta);
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      child: Column(
        children: [
          SizedBox(height: _mediaSize.width * 0.02),
          //Nombre
          Container(
            width: double.infinity,
            child: Text(
              _herramienta.name.capitalize,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Calamity',
                fontSize: _mediaSize.width * 0.04,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Ataque
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/sword.svg',
                      color: Colors.red,
                      width: _mediaSize.width * 0.07,
                    ),
                    onPressed: () => {},
                  ),
                  Container(
                    child: Text(
                      _herramienta.attack.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Calamity',
                        fontSize: _mediaSize.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              //Defensa
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/security.svg',
                      color: Colors.blue,
                      width: _mediaSize.width * 0.07,
                    ),
                    onPressed: () => {},
                  ),
                  Container(
                    child: Text(
                      _herramienta.defense.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Calamity',
                        fontSize: _mediaSize.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _mediaSize.height * 0.04,
              ),
            ],
          ),
          //Descripcion
          Text(
            _herramienta.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Calamity',
              fontSize: _mediaSize.width * 0.035,
            ),
          ),
        ],
      ),
    );
  }
}
