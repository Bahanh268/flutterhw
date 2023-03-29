import 'package:flutter/material.dart';
import 'package:flutterhw/main.dart';

class ListLayoutPage extends StatefulWidget {
  const ListLayoutPage({super.key, required this.title});

  final String title;

  @override
  State<ListLayoutPage> createState() => _ListLayoutState();
}

class _ListLayoutState extends State<ListLayoutPage> {
  final List<String> entries = <String>[
    'https://picsum.photos/1000',
  ];
  final List<String> girdEntries = <String>[
    'https://picsum.photos/1000',
    'https://picsum.photos/1000',
    'https://picsum.photos/1000',
    'https://picsum.photos/1000',
    'https://picsum.photos/1000',
    'https://picsum.photos/1000',
    'https://picsum.photos/1000',
    'https://picsum.photos/1000',
    'https://picsum.photos/1000',
  ];

  void handleBack() {
    Navigator.pop(context);
  }

  void handleSearch() {
    MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  void handleSort() {}

  void handlePressItem() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading:
            IconButton(icon: const Icon(Icons.west), onPressed: handleBack),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: handleSearch)
        ],
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future(() => null);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: entries.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(children: <Widget>[
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {},
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                entries[index],
                                width: MediaQuery.of(context).size.width - 40,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width - 40,
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      Colors.transparent,
                                      Colors.black12,
                                      Colors.black87
                                    ])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const <Widget>[
                                Text(
                                  'Salad',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '16.278 recipes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )),
                      ]);
                    }),
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text('Sort by',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  const Text('Most popular',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.pink,
                      )),
                  IconButton(
                    icon: const Icon(Icons.swap_vert),
                    onPressed: handleSort,
                    color: Colors.pink,
                  )
                ],
              ),
              GridView.builder(
                itemCount: girdEntries.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(fit: StackFit.expand, children: <Widget>[
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {},
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            girdEntries[index],
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Colors.transparent,
                                  Colors.black12,
                                  Colors.black87
                                ])),
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const Text(
                              'Vegetable and Fruit Green Salad',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                const CircleAvatar(
                                  backgroundImage:
                                      NetworkImage('https://picsum.photos/400'),
                                  radius: 8,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const Text(
                                    'Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Colors.red,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.bookmark_add,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
