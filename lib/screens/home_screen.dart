import 'package:bloc_practise/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: BlocConsumer<InternetCubit, InternetState>(
                builder: (context,state){
                  if(state == InternetState.Gained){
                    return Text("Connected");
                  }
                  else if(state == InternetState.Lost){
                    return Text("Disconnected");
                  }else{
                    return Text("Loading");
                  }
                },
                listener: (context,state){
                  if(state == InternetState.Gained){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Connected'),backgroundColor: Colors.green,)
                    );
                  }
                  else if(state == InternetState.Lost){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Disconnect'),backgroundColor: Colors.red,)
                    );
                  }
                }
            ),
          ),
      ),
    );
  }
}
