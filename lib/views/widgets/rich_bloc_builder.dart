import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RichBlocBuilder<Bloc extends StateStreamable<RootState>, RootState,
    ValidState extends RootState,
    InvalidState extends RootState,
    LoadingState extends ValidState> extends StatelessWidget {
  final Widget Function(BuildContext context, ValidState state) builder;
  final bool Function(RootState previous, RootState current)? buildWhen;
  final Widget Function(BuildContext context, InvalidState state)? invalidBuilder;

  const RichBlocBuilder(
      {super.key, required this.builder, this.buildWhen, this.invalidBuilder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bloc, RootState>(
      buildWhen: buildWhen,
      builder: (context, state) {
        if (state is ValidState){
          return Stack(
            children: [
              builder.call(context, state),
              if (state is LoadingState)
                const Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child:
                          ModalBarrier(dismissible: false, color: Colors.black),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
            ],
          );
          // return builder.call(context, state);
        }
        if (state is InvalidState){
          final invalidBuilder = this.invalidBuilder;
          if (invalidBuilder != null){
            return invalidBuilder.call(context, state);
          }else{
            return const Placeholder(child: Icon(Icons.dangerous_outlined),);
          }
        }
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}