import 'package:flutter/material.dart';
import 'package:flutter_fetch_riverpod_app/Core/Service/service_locator.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Presentation/Controller/fetch_post_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main()  async {
  ServiceLocator().init();
  // final PostUseCase postUseCase = PostUseCase(sl());
  // final List<dynamic> _test = await postUseCase.execute();
  // print(_test);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo' ,
      home: HomePage() ,
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  final _fetchData = FutureProvider((ref)=>FetchPostController(sl()).getData());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          Expanded(
              child: Consumer(
                builder: (context,prov,_) {
                  return prov.watch(_fetchData).when(
                      error: (err,stack)=>Text(err.toString()),
                      loading: ()=> const Center(child: CircularProgressIndicator.adaptive()) ,
                    data: (data)=>ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context,i) {
                          return ListTile(
                            title: Text(data.elementAt(i).name),
                            subtitle: Text(data.elementAt(i).body),
                          );
                        }
                    )
                  );
                }
              )) ,

        ],
      ),
    );
  }
}

