import 'package:flutter/material.dart';
import '../Services/ApiServices.dart';
import '../Models/Guias.dart';

class ListGuiasScreen extends StatefulWidget {
  ListGuiasScreen({super.key});

  @override
  State<ListGuiasScreen> createState() => _ListGuiasScreenState();
}

class _ListGuiasScreenState extends State<ListGuiasScreen> {
  final Apiservices apiservices = Apiservices();

  List<Guias> guia = [];

  @override
  void initState() {
    super.initState();
    _loadGuias();
  }

  Future<void> _loadGuias() async {
    try {
      final fetchedGuias = await Apiservices.getGuia();
      setState(() {
        guia = fetchedGuias;
      });
    } catch (e) {
      print('Error al cargar los Guías');
    }
  }

  void _registerGuia(String nombre, String apellido, String documento, String email, String direccion) async {
    try {
      await Apiservices.createGuia(nombre, apellido, documento, email, direccion);
      await _loadGuias();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Guía creado satisfactoriamente')),
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Problemas al crear el Guía')),
      );
    }
  }

  void _editGuia(String id, String nombre, String apellido, String documento, String email, String direccion) async {
    try {
      await Apiservices.updateGuia(id, nombre, apellido, documento, email, direccion);
      await _loadGuias();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El Guía ha sido actualizado satisfactoriamente')),
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ha ocurrido un error al actualizar el Guía')),
      );
    }
  }

  void showRegisterModalGuia() {
    final TextEditingController _nombreController = TextEditingController();
    final TextEditingController _apellidoController = TextEditingController();
    final TextEditingController _documentoController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _direccionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Guía Registrado'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    hintText: 'Nombre',
                    labelText: 'Ingrese un Nombre',
                    icon: Icon(Icons.numbers_rounded),
                  ),
                ),
                TextFormField(
                  controller: _apellidoController,
                  decoration: const InputDecoration(
                    hintText: 'Apellido',
                    labelText: 'Ingrese un Apellido',
                    icon: Icon(Icons.colorize_rounded),
                  ),
                ),
                TextFormField(
                  controller: _documentoController,
                  decoration: const InputDecoration(
                    hintText: 'Documento',
                    labelText: 'Ingrese un Documento de Identidad',
                    icon: Icon(Icons.colorize_rounded),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Ingrese un Email',
                    icon: Icon(Icons.colorize_rounded),
                  ),
                ),
                TextFormField(
                  controller: _direccionController,
                  decoration: const InputDecoration(
                    hintText: 'Dirección',
                    labelText: 'Ingrese una Dirección',
                    icon: Icon(Icons.colorize_rounded),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final _nombre = _nombreController.text.trim();
                final _apellido = _apellidoController.text.trim();
                final _documento = _documentoController.text.trim();
                final _email = _emailController.text.trim();
                final _direccion = _direccionController.text.trim();

                print('$_nombre $_apellido $_documento $_email $_direccion');
                _registerGuia(_nombre, _apellido, _documento, _email, _direccion);
              },
              child: Text('Registrado'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void showEditModalGuia(String id, String nombre, String apellido, String documento, String email, String direccion) {
    final TextEditingController _nombreController = TextEditingController(text: nombre);
    final TextEditingController _apellidoController = TextEditingController(text: apellido);
    final TextEditingController _documentoController = TextEditingController(text: documento);
    final TextEditingController _emailController = TextEditingController(text: email);
    final TextEditingController _direccionController = TextEditingController(text: direccion);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Guía Actualizado'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    hintText: 'Nombre',
                    labelText: 'Ingrese un Nombre',
                    icon: Icon(Icons.numbers_rounded),
                  ),
                ),
                TextFormField(
                  controller: _apellidoController,
                  decoration: const InputDecoration(
                    hintText: 'Apellido',
                    labelText: 'Ingrese un Apellido',
                    icon: Icon(Icons.colorize_rounded),
                  ),
                ),
                TextFormField(
                  controller: _documentoController,
                  decoration: const InputDecoration(
                    hintText: 'Documento',
                    labelText: 'Ingrese un Documento de Identidad',
                    icon: Icon(Icons.colorize_rounded),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Ingrese un Email',
                    icon: Icon(Icons.colorize_rounded),
                  ),
                ),
                TextFormField(
                  controller: _direccionController,
                  decoration: const InputDecoration(
                    hintText: 'Dirección',
                    labelText: 'Ingrese una Dirección',
                    icon: Icon(Icons.colorize_rounded),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final _nombre = _nombreController.text.trim();
                final _apellido = _apellidoController.text.trim();
                final _documento = _documentoController.text.trim();
                final _email = _emailController.text.trim();
                final _direccion = _direccionController.text.trim();

                print('$_nombre $_apellido $_documento $_email $_direccion');
                _editGuia(id, _nombre, _apellido, _documento, _email, _direccion);
              },
              child: Text('Actualizado'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void showDeleteModalGuia(String id, String nombre, String apellido, String documento, String email, String direccion) async {
    final confirmDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Guía Eliminado'),
          content: Text('¿Te gustaría borrar este Guía?'),
          actions: [
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              label: Text(
                'Cancelar',
                style: TextStyle(color: Colors.lightGreen),
              ),
              icon: Icon(Icons.cancel_rounded),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              label: Text('Confirmar'),
              icon: Icon(Icons.confirmation_num_rounded),
              style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 213, 215, 216)),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      await Apiservices.deleteGuia(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El Guía ha sido eliminado satisfactoriamente')),
      );
      _loadGuias();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Guías')),
      body: FutureBuilder<List<Guias>>(
        future: Apiservices.getGuia(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final guia = snapshot.data![index];

                return ListTile(
                  title: Text(guia.nombre),
                  subtitle: Text('${guia.apellido} ${guia.documento} ${guia.email} ${guia.direccion}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showEditModalGuia(
                            guia.id,
                            guia.nombre,
                            guia.apellido,
                            guia.documento,
                            guia.email,
                            guia.direccion,
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          showDeleteModalGuia(
                            guia.id,
                            guia.nombre,
                            guia.apellido,
                            guia.documento,
                            guia.email,
                            guia.direccion,
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showRegisterModalGuia();
        },
        child: Text('+'),
      ),
    );
  }
}
