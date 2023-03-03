import 'package:flutter/material.dart' hide ReorderableList;

class WithList extends StatefulWidget {
  const WithList({
    Key? key,
    required this.title,
    required this.tempKey,
    required this.onUpdate,
  }) : super(key: key);
  final GlobalKey tempKey;
  final String title;
  final Function() onUpdate;

  @override
  _WithListState createState() => _WithListState();
}

class ItemData {
  ItemData(this.title, this.key);

  final String title;

  // Each item in reorderable list needs stable and unique key
  final Key key;
}

enum DraggingMode {
  iOS,
  android,
}

class _WithListState extends State<WithList> {
  final array = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9];

  void _update(old, ew) {
    setState(() {
      var el = array[old];
      if (old < ew) {
        ew = ew - 1;
      }
      array.removeAt(old);
      array.insert(ew, el);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 250,
      ),
      child: ReorderableListView(
        padding: const EdgeInsets.only(bottom: 100),
        scrollDirection: Axis.horizontal,
        onReorder: _update,
        children: [
          for (final item in array)
            Container(
              key: item == 4
                  ? widget.tempKey
                  : ValueKey(widget.title + item.toString()),
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                    ),
                  ]),
              child: Center(
                child: Text('Item $item'),
              ),
            ),
        ],
      ),
    );
  }
}
