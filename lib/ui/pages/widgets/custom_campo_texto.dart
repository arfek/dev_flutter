import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MyCustomEditText<T> extends StatelessWidget {
  String titulo;
  String hint;
  TextEditingController controller;
  String? labelBorda;
  int? maximoCaracteres;
  BoxConstraints? boxConstraints;
  List<TextInputFormatter>? inputFormatters;
  Function? onChanged;
  Function(String)? onSubmitted;
  int? maxLines;
  int minLines;
  TextInputType? keyboard;
  bool? obrigatorio;
  bool? enabled;
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  bool exibirWidgetTitulo;
  bool? alinharNaDireita;
  TextStyle? styleTitulo;
  TextStyle? styleTexto;

  MyCustomEditText(
      {Key? key,
      required this.titulo,
      required this.hint,
      required this.controller,
      this.keyboard,
      this.maximoCaracteres,
      this.inputFormatters,
      this.onChanged,
      this.onSubmitted,
      this.boxConstraints,
      this.maxLines = 1,
      this.minLines = 1,
      this.focusNode,
      this.textInputAction,
      this.enabled = true,
      this.obrigatorio,
      this.labelBorda,
      this.exibirWidgetTitulo = true,
      this.alinharNaDireita,
      this.styleTitulo,
      this.styleTexto})
      : super(key: key);

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

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

  Widget montarTitulo() {
    if (exibirWidgetTitulo) {
      return RichText(
        text: TextSpan(
          text: titulo,
          style: styleTitulo ?? Theme.of(context).textTheme.titleMedium,
          children: [
            exibirAsterisco(obrigatorio ?? false),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  TextSpan exibirAsterisco(bool obrigatorio) {
    if (!obrigatorio) {
      return const TextSpan(text: '');
    }

    return TextSpan(
      text: " *",
      style: Theme.of(context)
          .textTheme
          .displayMedium!
          .copyWith(color: Colors.red),
    );
  }

  Widget montarEdit() {
    return Container(
      constraints: boxConstraints,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        inputFormatters: inputFormatters,
        style: styleTexto,
        textAlign: alinharNaDireita ?? false ? TextAlign.end : TextAlign.start,
        minLines: maxLines == null
            ? minLines
            : maxLines! > 1
                ? maxLines
                : minLines,
        //Isso faz o campo ficar maior
        maxLines: maxLines,
        maxLength: maximoCaracteres,
        keyboardType: keyboard,
        textInputAction: (maxLines != null && maxLines! > 1)
            ? TextInputAction.newline
            : textInputAction ?? TextInputAction.unspecified,
        onChanged: (value) {
          onChanged?.call(value);
        },
        onFieldSubmitted: (value) {
          onSubmitted?.call(value);
        },
        enabled: enabled ?? true,
        decoration: InputDecoration(
          fillColor: enabled ?? true ? Colors.white : Colors.grey,
          label: labelBorda != null ? Text(labelBorda!) : null,
          floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          hintText: hint,
        ),
      ),
    );
  }
}
