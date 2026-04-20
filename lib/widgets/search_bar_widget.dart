import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

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
                  values: const RangeValues(10000, 50000),
                  min: 0,
                  max: 100000,
                  divisions: 10,
                  labels: const RangeLabels("10k", "50k"),
                  onChanged: (values) {
                    // TODO: Handle price range change
                  },
                ),

                /// Transmission
                const Text(
                  "Transmission",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                _buildChips(["Automatic", "Manual", "Semi-Automatic"]),

                const SizedBox(height: 16),

                /// Fuel Type
                const Text(
                  "Fuel Type",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                _buildChips(["Petrol", "Diesel", "Electric", "Hybrid"]),

                const SizedBox(height: 25),

                /// Apply Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
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
              border: Border.all(color: Colors.white.withAlpha(21)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
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
            border: Border.all(color: Colors.white.withAlpha(21)),
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
          value: items.first,
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: const TextStyle(color: Colors.white)),
                ),
              )
              .toList(),
          onChanged: (value) {
            // TODO: Handle dropdown change
          },
        ),
      ),
    );
  }

  Widget _buildChips(List<String> options) {
    return Wrap(
      spacing: 8,
      children: options.map((e) {
        return Chip(
          label: Text(e),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: Colors.white10),
          backgroundColor: Colors.teal.shade800,
          labelStyle: const TextStyle(color: Colors.white),
        );
      }).toList(),
    );
  }
}
