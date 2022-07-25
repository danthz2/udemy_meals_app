import 'package:flutter/material.dart';
import 'package:udemy_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] ?? false;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchListTile(
                "Gluten-free",
                "Only include gluten-free meals",
                _glutenFree,
                (newVal) {
                  setState(
                    () {
                      _glutenFree = newVal;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                "Lactose-free",
                "Only include lactose-free meals",
                _lactoseFree,
                (newVal) {
                  setState(
                    () {
                      _lactoseFree = newVal;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                "Vegetarian",
                "Only include vegetarian meals",
                _vegetarian,
                (newVal) {
                  setState(
                    () {
                      _vegetarian = newVal;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                "Vegan",
                "Only include egan meals",
                _vegan,
                (newVal) {
                  setState(
                    () {
                      _vegan = newVal;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
