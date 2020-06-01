import 'dart:convert';
import 'dart:io';

import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/shared/funcoes.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
part 'AdicionarEmpresaCtrl.g.dart';

class AdicionarEmpresaCtrl = _AdicionarEmpresaCtrlBase with _$AdicionarEmpresaCtrl;

abstract class _AdicionarEmpresaCtrlBase with Store {
  
ObservableList categorias = ObservableList.of([]);

String base64Image = '';
String fileName = '';

@observable
String nomeEmpresa = '';
@action
void setEmpresa(String valor) => nomeEmpresa = valor; 

@observable
String categoria;
@action
void setCategoria(String valor) => categoria = valor; 

@observable
String descricao = '';
@action
void setDescricao(String valor) => descricao = valor; 

@observable
String horarioFuncionamento = '';
@action
void setHorario(String valor) => horarioFuncionamento = valor; 

@observable
List contatos = [['whatsapp',''],['whatsapp',''],['whatsapp','']];
@action
void setContato(int index, int tipo, String valor){
  if(tipo == 0){
    if(valor == 'site')
      maskFormatter[index] = null;
    else
      maskFormatter[index] = [new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') })];

  }
  contatos[index][tipo] = valor;
}
ObservableList maskFormatter =  ObservableList.of([[new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') })],[new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') })],[new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') })]]);



@observable
String nomeResponsavel = '';
@action
void setResponsavel(String valor) => nomeResponsavel = valor; 

@observable
String telefoneResponsavel = ''; 
@action
void setTelefoneResponsavel(String valor) => telefoneResponsavel = valor; 

@observable
bool carregando = false;

@observable
File file;

 
@action
Future<void> escolher() async{
 file = await ImagePicker.pickImage(source: ImageSource.gallery);
}


@action 
Future<void> salvar(GlobalKey<ScaffoldState> scaffodkey, BuildContext context) async {

  if(nomeEmpresa == ''){
    Funcoes.msgError(scaffodkey, 'Por favor coloque o nome da empresa');
    return;
  }
  if(categoria == null){
    Funcoes.msgError(scaffodkey, 'Por favor Selecione uma categoria da sua empresa');
    return;
  }
  if(nomeResponsavel == ''){
    Funcoes.msgError(scaffodkey, 'Por favor coloque o nome do responsavel');
    return;
  }
  if(telefoneResponsavel == ''){
    Funcoes.msgError(scaffodkey, 'Por favor coloque o telefone do responsavel');
    return;
  }  

  if (file != null){
    base64Image = base64Encode(file.readAsBytesSync());
    fileName = file.path.split("/").last;
  }  
   var resposta = await http.post(Constantes.gerarURL('empresas'), body: {
     'nome': nomeEmpresa,
     'categoria': categoria,
     'descricao': descricao,
     'horario_funcionamento': horarioFuncionamento,
     'nome_responsavel': nomeResponsavel,
     'telefone_responsavel': telefoneResponsavel,
     'contatos': json.encode(contatos),
     "image": base64Image,
     "name_image": fileName,
   }
   
   );
 
   if(resposta.statusCode == 200){
      Navigator.pushReplacementNamed(context, '/cadastrarFeito');
   }else{
     Funcoes.msgError(scaffodkey, 'Ops! Ocorreu um erro tente mais tarde');
   }
   
}
@action
Future<void> carregar() async {
  carregando = true;
  var resposta = await http.get(Constantes.gerarURL('categorias/get') );
  if (resposta.statusCode == 200) {
     carregando = false;
    return json.decode(resposta.body);
  }
 
}



}