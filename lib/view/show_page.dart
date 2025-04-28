import 'dart:ui';
import 'package:crud_api/viewmodel/show_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  State<ShowPage> createState() => _ShowPageScreenState();
}

class _ShowPageScreenState extends State<ShowPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ShowViewmodel>().fetchShow();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer<ShowViewmodel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (viewModel.errorMessage != null) {
                return Center(child: Text(viewModel.errorMessage!));
              } else if (viewModel.show == null) {
                return const Center(child: Text('No schedule available.'));
              } else {
                final Showdata = viewModel.show!;
                return ListView.builder(
                  itemCount: Showdata.length,
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    final isishow = Showdata[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(4),
                            Text('${isishow.nama}'),
                            Text('${isishow.kelas}'),
                        
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
