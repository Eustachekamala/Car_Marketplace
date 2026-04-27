import 'package:flutter/material.dart';
import 'package:car_marketplace/model/car_model.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key,  this.allCars, this.onResults});

  final List<CarModel>? allCars;
  final ValueChanged<List<CarModel>>? onResults;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String? _selectedBrand;
  RangeValues _priceRange = const RangeValues(10000, 50000);
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final Set<String> _selectedTransmissions = {};
  final Set<String> _selectedFuelTypes = {};

  void _notifyFiltersChanged() {
    final filters = {
      'query': _searchQuery,
      'brand': _selectedBrand,
      'priceRange': _priceRange,
      'transmission': _selectedTransmissions.toList(),
      'fuel': _selectedFuelTypes.toList(),
    };
    // Removed onFiltersChanged call
    if (widget.allCars != null && widget.onResults != null) {
      final results = _filterLocal(widget.allCars!, filters);
      widget.onResults?.call(results);
    }
  }

  List<CarModel> _filterLocal(List<CarModel> source, Map<String, dynamic> filters) {
    final query = (filters['query'] as String?)?.toLowerCase() ?? '';
    final brand = (filters['brand'] as String?)?.toLowerCase();
    final RangeValues priceRange = filters['priceRange'] as RangeValues? ?? const RangeValues(0, 1000000);
    final List transmission = filters['transmission'] as List? ?? <dynamic>[];
    final List fuel = filters['fuel'] as List? ?? <dynamic>[];

    return source.where((c) {
      if (query.isNotEmpty) {
        final name = c.brandName.toLowerCase();
        final desc = (c.description ?? '').toLowerCase();
        if (!name.contains(query) && !desc.contains(query)) return false;
      }

      if (brand != null && brand.isNotEmpty) {
        if (!c.brandName.toLowerCase().contains(brand)) return false;
      }

      final price = c.price.toDouble();
      if (price < priceRange.start || price > priceRange.end) return false;

      if (transmission.isNotEmpty) {
        if (!transmission.contains(c.transmission)) return false;
      }

      if (fuel.isNotEmpty) {
        if (!fuel.contains(c.fuelType)) return false;
      }

      return true;
    }).toList();
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xFF103F35),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Handle
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Title
                const Text(
                  "Filters",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                /// Brand
                const Text("Brand", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 8),
                _buildDropdown(["BMW", "Mercedes", "Nissan", "Mazda", "Tesla"]),

                const SizedBox(height: 16),

                /// Price Range
                const Text(
                  "Price Range",
                  style: TextStyle(color: Colors.white70),
                ),
                RangeSlider(
                  values: _priceRange,
                  min: 0,
                  max: 100000,
                  divisions: 100,
                  labels: RangeLabels(
                    "${(_priceRange.start / 1000).round()}k",
                    "${(_priceRange.end / 1000).round()}k",
                  ),
                  onChanged: (values) {
                    setState(() {
                      _priceRange = values;
                    });
                    _notifyFiltersChanged();
                  },
                ),

                /// Transmission
                const Text(
                  "Transmission",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                _buildChips(["Automatic", "Manual", "Semi-Automatic"], _selectedTransmissions),

                const SizedBox(height: 16),

                /// Fuel Type
                const Text(
                  "Fuel Type",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                _buildChips(["Petrol", "Diesel", "Electric", "Hybrid"], _selectedFuelTypes),

                const SizedBox(height: 25),

                /// Clear + Apply buttons
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 55,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              _searchQuery = '';
                              _selectedBrand = null;
                              _priceRange = const RangeValues(0, 100000);
                              _selectedTransmissions.clear();
                              _selectedFuelTypes.clear();
                              Navigator.pop(context);
                            });
                            _notifyFiltersChanged();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: const BorderSide(color: Colors.white24),
                            ),
                          ),
                          child: const Text(
                            'Clear',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            final filters = {
                              'query': _searchQuery,
                              'brand': _selectedBrand,
                              'priceRange': _priceRange,
                              'transmission': _selectedTransmissions.toList(),
                              'fuel': _selectedFuelTypes.toList(),
                            };
                            Navigator.pop(context, filters);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: const Text(
                            "Apply Filters",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// Bottom safe spacing
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Search field
        Expanded(
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(12),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white.withAlpha(21), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (v) {
                setState(() => _searchQuery = v);
                _notifyFiltersChanged();
              },
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: "Search cars, brands...",
                hintStyle: TextStyle(color: Colors.white60),
                prefixIcon: Icon(Icons.search, color: Colors.white70),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ),

        const SizedBox(width: 6),

        /// Filter button
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(12),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white.withAlpha(21), width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(35),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () => showFilterBottomSheet(context),
            icon: const Icon(Icons.tune_rounded, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: const Color(0xFF103F35),
          value: _selectedBrand ?? items.first,
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: const TextStyle(color: Colors.white)),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedBrand = value;
              });
              _notifyFiltersChanged();
            }
          },
        ),
      ),
    );
  }

  Widget _buildChips(List<String> options, Set<String> selectedSet) {
    return Wrap(
      spacing: 8,
      children: options.map((e) {
        final selected = selectedSet.contains(e);
        return FilterChip(
          label: Text(e, style: TextStyle(color: selected ? Colors.black : Colors.white)),
          selected: selected,
          onSelected: (v) {
            setState(() {
              if (v) {
                selectedSet.add(e);
              } else {
                selectedSet.remove(e);
              }
            });
            _notifyFiltersChanged();
          },
          selectedColor: Colors.white,
          backgroundColor: Colors.teal.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: Colors.white10),
          labelStyle: const TextStyle(color: Colors.white),
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
