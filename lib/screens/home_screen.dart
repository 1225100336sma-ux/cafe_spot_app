import 'package:flutter/material.dart';
import '../models/cafe_model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  String selectedCategory = 'Todos';

  final List<String> categorias = ['Todos', 'Especialidad', 'Panadería', 'Fríos', 'Tradicional'];

  @override
  Widget build(BuildContext context) {
    // Lógica para filtrar la lista según el texto de búsqueda y la categoría seleccionada
    final cafesFiltrados = listaCafes.where((cafe) {
      final coincideNombre = cafe.nombre.toLowerCase().contains(searchQuery.toLowerCase()) ||
          cafe.descripcion.toLowerCase().contains(searchQuery.toLowerCase());
      final coincideCategoria = selectedCategory == 'Todos' || cafe.categoria == selectedCategory;
      return coincideNombre && coincideCategoria;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CaféSpot - Inicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda funcional
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar cafeterías o descripción...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Chips de Categorías (Filtros horizontales)
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                final isSelected = selectedCategory == categoria;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(categoria),
                    selected: isSelected,
                    selectedColor: Colors.brown,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = categoria;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),

          // Lista dinámica de elementos filtrados
          Expanded(
            child: cafesFiltrados.isEmpty
                ? const Center(
                    child: Text(
                      'No se encontraron cafeterías con esos criterios',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: cafesFiltrados.length,
                    itemBuilder: (context, index) {
                      final cafe = cafesFiltrados[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        elevation: 3,
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              cafe.imagenUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(cafe.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${cafe.categoria} • ⭐ ${cafe.calificacion}'),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(cafe: cafe),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}