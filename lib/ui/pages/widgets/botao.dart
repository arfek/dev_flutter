import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Botao extends StatelessWidget {
  String titulo;
  Color? color;
  Function? onClick;
  bool? isLoading;
  IconData? iconData;
  Color? textColor;
  EdgeInsetsGeometry padding;
  double? altura;
  bool? disabled;

  Botao(
      {super.key,
      required this.titulo,
      required this.onClick,
      this.color,
      this.isLoading = false,
      this.iconData,
      this.textColor,
      this.altura,
      this.padding = const EdgeInsets.all(0),
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color ?? Colors.grey,
      height: altura ?? 42,
      disabledColor: Colors.grey,
      onPressed: (isLoading! || disabled!)
          ? null
          : () async {
              onClick?.call();
            },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading ?? false
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : (iconData == null
                  ? const SizedBox()
                  : Icon(
                      iconData,
                      color: textColor ?? Colors.white,
                    )),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              titulo,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: textColor ?? Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
