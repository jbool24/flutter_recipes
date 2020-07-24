import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/meal-filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  void initState() {
    super.initState();
    _vegan = widget.currentFilters['vegan'];
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['lactose'];
    _lactoseFree = widget.currentFilters['vegetarian'];
  }

  Widget _buildSwitchTile(
      String title, String subtitle, bool currentVal, Function toggle) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentVal,
      onChanged: (newVal) => toggle(newVal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Meals'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.saveFilters({
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            }),
          ),
        ],
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Pick your meal type',
                style: Theme.of(context).textTheme.headline1),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  'Gluten-Free',
                  'Select only gluten-free meals',
                  _glutenFree,
                  (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  'Select only Vegetarian meals',
                  _vegetarian,
                  (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegan',
                  'Select only vegan meals',
                  _vegan,
                  (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Lactose-Free',
                  'Select only lactose-free meals',
                  _lactoseFree,
                  (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
