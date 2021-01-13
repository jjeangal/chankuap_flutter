class Transac {

  final String productor_name;
  final String p_code;
  final String comunidad;
  final String compania;
  final String fecha_uno;
  final String fecha_dos;
  final List<Producto> lotes;

  Transac(this.productor_name, this.p_code, this.comunidad, this.compania,
      this.fecha_uno, this.fecha_dos, this.lotes);

  getCode() {
    return this.p_code;
  }

  getLotes() {
    return this.lotes;
  }
}

class Producto {
  final String name;
  final String code;
  final int cantidad;
  final int unidad;

  Producto(this.name, this.code, this.cantidad, this.unidad);
}