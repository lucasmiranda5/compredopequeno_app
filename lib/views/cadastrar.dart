import 'package:compredopequeno/controllers/AdicionarEmpresaCtrl.dart';
import 'package:compredopequeno/controllers/CategoriasCtrl.dart';
import 'package:compredopequeno/controllers/DashboardCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/widgets/carregando.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastrarEmpresa extends StatefulWidget {
  CadastrarEmpresa({Key key}) : super(key: key);

  @override
  _CadastrarEmpresaState createState() => _CadastrarEmpresaState();
}

class _CadastrarEmpresaState extends State<CadastrarEmpresa> {
  AdicionarEmpresaCtrl controller = AdicionarEmpresaCtrl();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    controller.carregar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        bottomNavigationBar: Rodape(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(210.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Topo(barraPesquisa: true),
            )),
        body: Observer(builder: (_) {
          return SingleChildScrollView(
              child: controller.carregando
                  ? Carregando()
                  : Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Cadastre sua Empresa", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                            TextField(
                              decoration: InputDecoration(labelText: 'Nome da empresa'),
                              onChanged: controller.setEmpresa,
                            ),
                            controller.categorias.length > 0
                                ? DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        helperText: "Caso não tenha a categoria da sua empresa, favor  \nmandar uma mensagem para o \nWhatsApp - (38) 99269-9192 - Lucas Miranda",
                                        labelText: 'Categoria da empresa'),
                                    items: controller.categorias.map<DropdownMenuItem<String>>((valor) {
                                      return DropdownMenuItem(
                                        child: Text(valor['nome']),
                                        value: valor['id'].toString(),
                                      );
                                    }).toList(),
                                    onChanged: controller.setCategoria,
                                    value: controller.categoria)
                                : SizedBox(),
                            TextField(
                              decoration: InputDecoration(labelText: 'Descrição da empresa'),
                              maxLines: 5,
                              onChanged: controller.setDescricao,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: 'Hórario de Funcionamento'),
                              maxLines: 2,
                              onChanged: controller.setHorario,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: controller.escolher,
                                  child: Text('Marca da Empresa'),
                                ),
                                Observer(builder: (_) {
                                  return controller.file == null
                                      ? Text('Nenhum imagem selecionada')
                                      : (kIsWeb
                                          ? Image.network(
                                              controller.file2,
                                              width: 100,
                                            )
                                          : Image.file(
                                              controller.file,
                                              width: 100,
                                            ));
                                }),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(labelText: 'Tipo do contato'),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('WhatsApp'),
                                        value: 'whatsapp',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Telefone'),
                                        value: 'telefone',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('IG/Face/Site'),
                                        value: 'site',
                                      )
                                    ],
                                    onChanged: (value) {
                                      controller.setContato(0, 0, value);
                                    },
                                    value: controller.contatos[0][0],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Observer(builder: (_) {
                                    return TextField(
                                      decoration: InputDecoration(labelText: 'Contato'),
                                      inputFormatters: controller.maskFormatter[0],
                                      onChanged: (value) {
                                        controller.setContato(0, 1, value);
                                      },
                                    );
                                  }),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(labelText: 'Tipo do contato'),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('WhatsApp'),
                                        value: 'whatsapp',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Telefone'),
                                        value: 'telefone',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('IG/Face/Site'),
                                        value: 'site',
                                      )
                                    ],
                                    onChanged: (value) {
                                      controller.setContato(1, 0, value);
                                    },
                                    value: controller.contatos[1][0],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: InputDecoration(labelText: 'Contato'),
                                    inputFormatters: controller.maskFormatter[1],
                                    onChanged: (value) {
                                      controller.setContato(1, 1, value);
                                    },
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(labelText: 'Tipo do contato'),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('WhatsApp'),
                                        value: 'whatsapp',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Telefone'),
                                        value: 'telefone',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('IG/Face/Site'),
                                        value: 'site',
                                      )
                                    ],
                                    onChanged: (value) {
                                      controller.setContato(2, 0, value);
                                    },
                                    value: controller.contatos[2][0],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: InputDecoration(labelText: 'Contato'),
                                    inputFormatters: controller.maskFormatter[2],
                                    onChanged: (value) {
                                      controller.setContato(2, 1, value);
                                    },
                                  ),
                                )
                              ],
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: 'Nome do Responsável'),
                              onChanged: controller.setResponsavel,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: 'Telefone da empresa'),
                              onChanged: controller.setTelefoneResponsavel,
                              inputFormatters: [
                                new MaskTextInputFormatter(mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')})
                              ],
                            ),
                            RaisedButton.icon(
                              onPressed: () {
                                controller.salvar(_scaffoldkey, context);
                              },
                              icon: Icon(Icons.save),
                              label: Text("Cadastrar"),
                              color: Colors.green,
                              textColor: Colors.white,
                            )
                          ],
                        ),
                      )
                    ]));
        }));
  }
}
