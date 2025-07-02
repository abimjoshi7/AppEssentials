part of 'src.dart';

class CustomDropdownButtonForField<T> extends StatelessWidget {
  const CustomDropdownButtonForField({
    super.key,
    required this.onSelected,
    required this.getText,
    // this.asyncItems,
    this.enabled = true,
    this.list = const [],
    this.filterFn,
    this.compareFn,
    this.isRequired = false,
    this.labelText,
    this.value,
    this.showSearchBox = true,
    this.textAlign = TextAlign.end,
    this.constraints,
    this.isDrpdwnBtnVisible = true,
    this.scrollController,
    this.onPageScroll,
    this.onSearchChanged,
  });

  final List<T> list;
  final ValueChanged<T> onSelected;
  final String? labelText;
  final String Function(T) getText;
  final bool isRequired;
  final bool enabled;
  final T? value;
  final bool Function(T, String)? filterFn;
  final bool Function(T, T)? compareFn;
  // final Future<List<T>> Function(String)? asyncItems;
  final bool showSearchBox;
  final TextAlign textAlign;
  final BoxConstraints? constraints;
  final bool isDrpdwnBtnVisible;
  final ScrollController? scrollController;
  final VoidCallback? onPageScroll;
  final ValueChanged<String?>? onSearchChanged;
  @override
  Widget build(
    BuildContext context,
  ) {
    return CustomFormField(
      isRequired: isRequired,
      labelText: labelText,
      child: DropdownSearch<T>(
        enabled: enabled,
        decoratorProps: DropDownDecoratorProps(
          baseStyle: TextTheme.of(context).labelLarge,
          textAlignVertical: TextAlignVertical.center,
          textAlign: textAlign,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            constraints: constraints,
          ),
        ),
        itemAsString: getText,
        items: (a, s) async => list,
        popupProps: PopupProps.menu(
          fit: FlexFit.loose,
          constraints: BoxConstraints.loose(
            Size.fromHeight(
              MediaQuery.sizeOf(context).height * 0.5,
            ),
          ),
          showSearchBox: list.length > 8,
          listViewProps: ListViewProps(
            controller: scrollController
              ?..addPagination(
                onPageScroll ?? () {},
              ),
            shrinkWrap: true,
          ),
          searchFieldProps: TextFieldProps(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Tap to search",
            ),
          ),
        ),
        onChanged: (v) {
          if (v == null) return;
          onSelected(v);
        },
        selectedItem: value,
        filterFn: filterFn,
        compareFn: compareFn,
      ),
    );
  }
}

extension on ScrollController? {
  addPagination(void Function() param0) {
    param0();
  }
}
