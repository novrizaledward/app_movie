import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../bloc/by-year/by_year_bloc.dart';
import '../../../bloc/year/year_bloc.dart';

class MenuYearDrop extends StatefulWidget {
  const MenuYearDrop({super.key});

  @override
  State<MenuYearDrop> createState() => _MenuYearDropState();
}

class _MenuYearDropState extends State<MenuYearDrop> {
  late ByYearBloc _bloc;
  String? _value = "Years";

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ByYearBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConfigSize.symetric(horizontal: 15),
      child: Center(
        child: BlocBuilder<YearBloc, YearState>(
          builder: (context, state) {
            if (state is YearLoaded) {
              var data = state.yearRespone.year;
              return DropdownButton<String>(
                icon: const Icon(Icons.keyboard_arrow_down, size: 26),
                iconEnabledColor: ConfigColor.light,
                iconSize: 25,
                hint: Text(
                  _value!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                alignment: Alignment.center,
                borderRadius: BorderRadius.circular(8),
                underline: Container(),
                style: Theme.of(context).textTheme.bodyText2,
                items: data.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                  _bloc.add(LoadByYear(_value!, "1"));
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
