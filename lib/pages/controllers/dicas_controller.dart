import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';

import 'package:pressaoarterialapp/models/perfil_model.dart';
part 'dicas_controller.g.dart';

class DicaController = _DicaController
    with _$DicaController;

abstract class _DicaController with Store {


  @observable
  List<Map<String,String>> listaDicas = [
    {
      'tituloprincipal':'Mantenha uma alimentação saudável',
      'titulo':'Há uma gama de alimentos que podem desencadear ou agravar a doença. "O excesso de sal e de gorduras saturadas, assim como a ingestão de gorduras trans são amigos da hipertensão. Evitá-los é fundamental para manter a doença longe e ou para controlá-la", ressalta o médico.',
      'subtitulo':'',
      'foto':'apple.png'
    },
    {
      'tituloprincipal':'Evite o excesso de peso',
      'titulo':'A grande quantidade de gordura corporal também afeta o aumento da pressão arterial. Acabar com o excesso de peso é uma ótima sugestão para quem não deseja encarar riscos. "É como se o coração fosse obrigado a aumentar a força para bombear o sangue em direção aos outros órgãos. Quando o peso diminui, muitas vezes, também reduzimos a dose dos medicamentos", afirma o cardiologista.',
      'subtitulo':'',
      'foto':'obeso.png'
    },
    {
      'tituloprincipal':'Acalme os nervos',
      'titulo':'De forma isolada, o estresse não é capaz de causar a hipertensão, mas quando combinado com outros fatores de risco pode agravar o quadro. "Buscando alternativas para viver de maneira mais tranquila, o coração tende a trabalhar melhor e as doses dos medicamentos podem até diminuir", diz o cardiologista.',
      'subtitulo':'',
      'foto':'relief.png'
    },
    {
      'tituloprincipal':'Reduza o consumo de bebidas alcoólicas',
      'titulo':'De acordo com o especialista, consumir bebidas alcoólicas de forma moderada não é prejudicial para a pressão arterial, mas exagerar na dose pode causar estragos. "O consumo excessivo de álcool compromete todo o organismo, inclusive a pressão arterial", diz.',
      'subtitulo':'',
      'foto':'no-alcohol.png'
    },
    {
      'tituloprincipal':'Verifique a pressão arterial mensalmente',
      'titulo':'De acordo com o especialista, mesmo quem não sofre com a doença precisa ficar atento e medir a pressão ao menos uma vez por ano. "Cerca de 25% da população adulta é composta por hipertensos. Mas a maioria deles nem desconfia disso e ignora os cuidados, podendo sofrer com problemas mais sérios no futuro", diz o médico. Mas não vale medir a pressão de qualquer jeito:',
      'subtitulo':'- Repouse 15 minutos antes, em um lugar tranquilo\n'
          '- Caso tenha fumado, aguarde 30 minutos\n'
          '- Não fale durante o procedimento\n'
          '- Não fale durante o procedimento\n'
          '- Permaneça deitado ou sentado durante o processo\n'
          '- Esvazie a bexiga\n'
          '- Após exercícios físicos, aguarde 30 minutos\n'
          '- E não tome café 20 minutos antes da medição\n',
      'foto':'pa1.png'
    },
    {
      'tituloprincipal':'Abaixo a fumaça',
      'titulo':'O cigarro deve ser mantido apagado - e bem longe - se o desejo é permanecer distante dos riscos da hipertensão. O fumo é um dos principais fatores de risco para doença arterial coronariana. As substâncias tóxicas do cigarro provocam o enrijecimento das artérias, fato que compromete a passagem de fluxo sanguíneo e faz a pressão subir", afirma o cardiologista.',
      'subtitulo':'',
      'foto':'smoke.png'
    },
    {
      'tituloprincipal':'Não tome medicamentos sem prescrição médica',
      'titulo':'Nada de se automedicar e correr riscos. Os remédios de hipertensão devem ser prescritos após uma série de exames. "Cada pessoa apresenta um nível diferente de elevação da pressão arterial, por isso é importante ressaltar que o uso indevido desses medicamentos pode contribuir até para a piora do quadro. O remédio que funciona para uma amiga, certamente não funcionará para você", alerta o especialista.',
      'subtitulo':'',
      'foto':'sm.png'
    },
    {
      'tituloprincipal':'Hora de mexer o corpo',
      'titulo':'Pessoas sedentárias têm cinco vezes mais chance de desenvolver hipertensão arterial do que indivíduos fisicamente ativos. "A prática regular de exercícios ajuda no controle dos níveis da pressão arterial, porque melhora o condicionamento físico do coração, fazendo com que ele não fique sobrecarregado", diz.'
    'Alem disso, a prática regular de atividades provoca um efeito anti-hipertensivo por ajudar a queimar os quilos extras. "Não basta perder peso, é necessário reduzir essa massa gorda", explica. "A atividade física facilita a circulação sanguínea, melhora a oxigenação e automaticamente colabora para reduzir a pressão alta".',
      'subtitulo':'',
      'foto':'at.png'
    },


  ];




}
