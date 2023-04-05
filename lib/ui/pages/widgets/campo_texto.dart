// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dev_flutter/ui/pages/widgets/custom_campo_texto.dart';

import 'custom_campo_texto.dart';

// ignore: must_be_immutable
class CampoTexto extends MyCustomEditText {
  // ignore: use_key_in_widget_constructors
  CampoTexto({
    required TextEditingController controller,
    String titulo = '',
    String hint = '',
    String? labelBorda,
    TextInputType? keyboard,
    int? maximoCaracteres,
    List<TextInputFormatter>? inputFormatters,
    Function? onChanged,
    Function(String)? onSubmitted,
    BoxConstraints? boxConstraints,
    int? maxLines,
    int? minLines,
    FocusNode? focusNode,
    bool? obscureText = false,
    TextInputAction? textInputAction,
    bool? obrigatorio,
    bool? disabled = false,
    bool exibirWidgetTitulo = true,
    bool? alinharNaDireita,
    TextStyle? styleTitulo,
    TextStyle? styleTexto,
  }) : super(
          titulo: titulo,
          hint: hint,
          controller: controller,
          keyboard: keyboard,
          maximoCaracteres: maximoCaracteres,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          boxConstraints: boxConstraints,
          maxLines: maxLines,
          minLines: minLines ?? 1,
          focusNode: focusNode,
          textInputAction: textInputAction,
          obrigatorio: obrigatorio,
          enabled: disabled != null ? !disabled : true,
          styleTitulo: styleTitulo,
          exibirWidgetTitulo: exibirWidgetTitulo,
          labelBorda: labelBorda,
          alinharNaDireita: alinharNaDireita,
          styleTexto: styleTexto,
          obscureText: obscureText ?? false
        );

  @override
  Widget build(BuildContext context) {
    this.context = context;
    if (!exibirWidgetTitulo) {
      return montarEdit();
    }

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          montarTitulo(),
          const SizedBox(height: 5),
          montarEdit(),
        ],
      ),
    );
  }
}
