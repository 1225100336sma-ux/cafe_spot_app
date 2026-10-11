class Cafe {
  final String id;
  final String nombre;
  final String categoria;
  final String imagenUrl;
  final String descripcion;
  final double calificacion;
  final String precio;

  Cafe({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.imagenUrl,
    required this.descripcion,
    required this.calificacion,
    required this.precio,
  });
}

// Lista con más elementos para probar la búsqueda y los filtros
final List<Cafe> listaCafes = [
  Cafe(
    id: '1',
    nombre: 'Café Espresso Art',
    categoria: 'Especialidad',
    imagenUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93',
    descripcion: 'Un lugar acogedor con granos de altura tostados artesanalmente. Ideal para leer o trabajar con tranquilidad.',
    calificacion: 4.8,
    precio: '\$\$',
  ),
  Cafe(
    id: '2',
    nombre: 'Latte & Muffin',
    categoria: 'Panadería',
    imagenUrl: 'https://images.unsplash.com/photo-1554118811-1e0d58224f24',
    descripcion: 'Disfruta de los mejores postres recién horneados acompañados de un latte cremoso.',
    calificacion: 4.6,
    precio: '\$',
  ),
  Cafe(
    id: '3',
    nombre: 'Cold Brew Lab',
    categoria: 'Fríos',
    imagenUrl: 'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5',
    descripcion: 'Innovación en bebidas frías y métodos de extracción avanzados para los amantes del café intenso.',
    calificacion: 4.9,
    precio: '\$\$\$',
  ),
  Cafe(
    id: '4',
    nombre: 'Café Tradicional Doña María',
    categoria: 'Tradicional',
    imagenUrl: 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd',
    descripcion: 'Café de olla tradicional con un toque de canela y piloncillo, acompañado de pan de pueblo.',
    calificacion: 4.7,
    precio: '\$',
  ),
  Cafe(
    id: '5',
    nombre: 'Mocha & Beans',
    categoria: 'Especialidad',
    imagenUrl: 'https://images.unsplash.com/photo-1572442388796-11668a67e53d',
    descripcion: 'Mezcla perfecta de espresso, chocolate artesanal y leche vaporizada.',
    calificacion: 4.5,
    precio: '\$\$',
  ),
];