import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/DropDownProvider/drop_down_provider.dart';

class DropdownWidget<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final String hintText;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintTextColor;

  const DropdownWidget({
    super.key,
    required this.items,
    required this.hintText,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.borderRadius,
    this.borderColor,
    this.fillColor,
    this.hintTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // 👇 Provider automatically creates a fresh instance for this dropdown
      create: (_) => DropdownProvider<T>(),
      child: Consumer<DropdownProvider<T>>(
        builder: (context, provider, _) {
          return SizedBox(
            width: width,
            child: DropdownButtonFormField<T>(
              value: provider.selectedValue,
              items: items,
              validator: validator,
              onChanged: (val) {
                provider.setValue(val);
                if (onChanged != null) {
                  onChanged!(val);
                }
              },
              onTap: () => provider.toggleOpen(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                hintText: hintText,

                hintStyle: TextStyle(
                  color:
                      hintTextColor ??
                      Theme.of(context).inputDecorationTheme.hintStyle?.color,
                  fontSize:
                      Theme.of(
                        context,
                      ).inputDecorationTheme.hintStyle?.fontSize,
                ),

                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                fillColor:
                    fillColor ??
                    Theme.of(context).inputDecorationTheme.fillColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color:
                        borderColor ??
                        (Theme.of(context).inputDecorationTheme.border
                                is OutlineInputBorder
                            ? (Theme.of(context).inputDecorationTheme.border
                                    as OutlineInputBorder)
                                .borderSide
                                .color
                            : Colors.grey),
                  ),
                ),
              ),
              icon: AnimatedRotation(
                duration: const Duration(milliseconds: 200),
                turns: provider.isOpen ? 0.5 : 0.0,
                child: const Icon(Icons.arrow_drop_down, size: 28),
              ),
              dropdownColor: fillColor ?? Theme.of(context).cardColor,
              borderRadius: borderRadius ?? BorderRadius.circular(12),
              menuMaxHeight: 250,
            ),
          );
        },
      ),
    );
  }
}
