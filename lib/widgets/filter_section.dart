import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/task_cubit.dart'; // تأكد من مسار الـ TaskCubit الصحيح

class FilterSection extends StatelessWidget {
  final String selectedFilter;

  const FilterSection({
    super.key,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Filter',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            buildFilterButton(context, 'All'),
            const SizedBox(width: 10),
            buildFilterButton(context, 'Pending'),
            const SizedBox(width: 10),
            buildFilterButton(context, 'Completed'),
          ],
        ),
      ],
    );
  }

  Widget buildFilterButton(BuildContext context, String text) {
    bool isSelected = selectedFilter == text;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // استدعاء الكيوبت الأساسي مباشرة لتغيير الفلتر
          context.read<TaskCubit>().changeFilter(text);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF536DFE) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? const Color(0xFF536DFE) : Colors.grey.shade400,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}