import 'package:bloc_practise/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_practise/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: BlocConsumer<InternetBloc, InternetState>(
                builder: (context,state){
                  if(state is InternetGainState){
                    return Text("Connected");
                  }
                  else if(state is InternetLostState){
                    return Text("Disconnected");
                  }else{
                    return Text("Loading");
                  }
                },
                listener: (context,state){
                  if(state is InternetGainState){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Connected'),backgroundColor: Colors.green,)
                    );
                  }
                  else if(state is InternetLostState){
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
