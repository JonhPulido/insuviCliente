class CreateDatabaseStructure < ActiveRecord::Migration[5.1]
  def change
    
ActiveRecord::Schema.define(version: 20180226234736) do

  create_table "abono_ahorrador", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "folio", null: false
    t.integer "no_pago", null: false
    t.date "fecha", null: false
    t.float "abono", limit: 53, default: 0.0, null: false
    t.string "ahorrador_clave", limit: 25, null: false
    t.text "registrado", null: false
  end

  create_table "abono_convenio", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "folio", default: 0, null: false
    t.integer "no_pago", default: 0, null: false
    t.date "fecha", null: false
    t.float "abono", limit: 53, default: 0.0, null: false
    t.text "registrado", null: false
    t.integer "seguimiento_id", default: 0, null: false
  end

  create_table "abono_credito", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "folio", null: false
    t.string "no_pago", limit: 10, null: false
    t.date "fecha", null: false
    t.decimal "abono", precision: 18, scale: 12, default: "0.0", null: false
    t.string "mensualidad_clave", limit: 50, null: false
    t.decimal "interes", precision: 18, scale: 12, default: "0.0", null: false
    t.decimal "capital", precision: 18, scale: 12, default: "0.0", null: false
    t.decimal "moratorio", precision: 18, scale: 12, default: "0.0", null: false
    t.text "registrado", null: false
  end

  create_table "ahorrador", primary_key: "clave_ahorrador", id: :string, limit: 25, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "monto_total", limit: 53, null: false
    t.boolean "pagado", default: false, null: false
    t.float "total_abonado", limit: 53, default: 0.0, null: false
    t.boolean "eliminado", default: false
    t.integer "demanda_id", null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "caja", primary_key: "id_caja", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "modulo", limit: 16, null: false
    t.integer "folio_inicio", default: 0, null: false
    t.integer "folio_final", default: 0, null: false
    t.integer "folio_actual", default: 0, null: false
    t.boolean "estatus", default: true, null: false
    t.bigint "usuario_id", default: 0, null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "caja_usuario", primary_key: ["id_detalle", "caja_id", "usuario_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_detalle", null: false, auto_increment: true
    t.integer "caja_id", null: false
    t.integer "usuario_id", null: false
    t.date "alta", null: false
    t.boolean "estatus_detalle", default: true, null: false
    t.index ["caja_id"], name: "caja_id"
    t.index ["usuario_id"], name: "usuario_id"
  end

  create_table "cambio_domicilio", primary_key: "id_domicilio", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "domicilio", null: false
    t.bigint "cliente_id", null: false
    t.text "creado", null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "cancelacion", primary_key: "id_cancelacion", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "folio", limit: 15, default: "0", null: false
    t.float "importe", limit: 53, default: 0.0, null: false
    t.text "descripcion", null: false
    t.string "no_cheque", limit: 50, default: "0", null: false
    t.string "credito_clave", limit: 50, default: "0", null: false
    t.text "registrado", null: false
    t.integer "usuario_id", default: 0, null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "cat_banco", primary_key: "id_banco", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.string "cuenta", limit: 30, default: "0", null: false
    t.boolean "estatus", default: true, null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "cat_calle", primary_key: "id_calle", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 100, null: false
    t.boolean "estatus", default: true, null: false
    t.bigint "colonia_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colonia_id"], name: "fk_cat_calles_cat_colonias1"
    t.index ["nombre"], name: "nombre_UNIQUE", unique: true
  end

  create_table "cat_colonia", primary_key: "id_colonia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 100, null: false
    t.string "abreviacion", limit: 4, null: false
    t.boolean "estatus", default: true, null: false
    t.bigint "localidad_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["localidad_id"], name: "fk_cat_colonia_cat_localidad"
  end

  create_table "cat_documento", primary_key: "id_documento", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.boolean "opcional", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_estado", primary_key: "id_estado", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 35, null: false
    t.boolean "estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_grupo_atencion", primary_key: "id_grupo", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 80, null: false
    t.boolean "estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_localidad", primary_key: "id_localidad", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 100, null: false
    t.boolean "estatus", default: true, null: false
    t.bigint "municipio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "fk_cat_localidad_cat_municipio"
    t.index ["nombre"], name: "nombre_UNIQUE", unique: true
  end

  create_table "cat_mejoramiento", primary_key: "id_mejoramiento", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_municipio", primary_key: "id_municipio", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.integer "estado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "fk_cat_municipio_cat_estado"
    t.index ["nombre"], name: "nombre_UNIQUE", unique: true
  end

  create_table "cat_muro", primary_key: "id_muro", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_ocupacion", primary_key: "id_ocupacion", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_piso", primary_key: "id_piso", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_regimen_propiedad", primary_key: "id_propiedad", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_techo", primary_key: "id_techo", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cesion_derecho", primary_key: "id_cesion", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "acuerdo", null: false
    t.string "cliente_anterior", limit: 80, null: false
    t.string "curp_anterior", limit: 18, null: false
    t.text "registrado", null: false
    t.integer "demanda_id", null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "cliente", primary_key: "id_cliente", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 45, null: false
    t.string "ape_paterno", limit: 45, null: false
    t.string "ape_materno", limit: 45, null: false
    t.string "curp", limit: 18, null: false
    t.date "fecha_nac", null: false
    t.string "escolaridad", limit: 34, null: false
    t.string "estado_civil", limit: 20, null: false
    t.string "genero", limit: 9, null: false
    t.string "correo", limit: 60, default: "null"
    t.string "telefono", limit: 13, default: "null"
    t.string "num_int", limit: 7, default: "0", null: false
    t.string "num_ext", limit: 7, null: false
    t.string "codigo_postal", limit: 5, null: false
    t.string "estado_nac", limit: 45, null: false
    t.string "lugar_nac", limit: 65, null: false
    t.string "referencia_calles", limit: 200, null: false
    t.integer "dependientes", null: false
    t.string "grupo_social", limit: 15
    t.string "adquisicion_vivienda", limit: 18
    t.string "autoconstruccion", limit: 6
    t.text "descripcion_ubicacion"
    t.string "zona_interes", limit: 16, null: false
    t.boolean "estatus", default: true, null: false
    t.bigint "calle_id", null: false
    t.bigint "usuario_id", null: false
    t.integer "ocupacion_id", null: false
    t.integer "mejoramiento_id", null: false
    t.integer "grupo_atencion_id", null: false
    t.text "creado", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calle_id"], name: "fk_clientes_cat_calles1"
    t.index ["correo"], name: "correo_UNIQUE", unique: true
    t.index ["curp"], name: "curp_UNIQUE", unique: true
    t.index ["mejoramiento_id"], name: "fk_cliente_cat_mejoramiento1"
    t.index ["ocupacion_id"], name: "fk_cliente_cat_ocupacion1"
    t.index ["usuario_id"], name: "fk_clientes_usuarios1"
  end

  create_table "contrato", primary_key: "id_contrato", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "contrato_tipo_programa", primary_key: ["id", "tipo_programa_id", "contrato_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id", null: false, auto_increment: true
    t.integer "contrato_id", null: false
    t.integer "tipo_programa_id", null: false
    t.index ["contrato_id"], name: "cat_contrato_id"
    t.index ["tipo_programa_id"], name: "tipo_programa_id"
  end

  create_table "conyuge", primary_key: "id_conyuge", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 45, null: false
    t.string "ape_paterno", limit: 45, null: false
    t.string "ape_materno", limit: 45, null: false
    t.string "curp", limit: 18, null: false
    t.string "bienes", limit: 12
    t.string "lugar_nac", limit: 60, null: false
    t.date "fecha_nac", null: false
    t.boolean "estatus", default: true, null: false
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "fk_conyuge_cliente1"
  end

  create_table "corte", primary_key: "id_corte", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "fecha", null: false
    t.float "total", limit: 53, null: false
    t.integer "caja_id", null: false
  end

  create_table "credito", primary_key: "clave_credito", id: :string, limit: 50, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "costo_metro", precision: 19, scale: 12, default: "0.0", null: false
    t.decimal "costo_terreno", precision: 19, scale: 12, default: "0.0", null: false
    t.decimal "costo_construccion", precision: 19, scale: 12, default: "0.0", null: false
    t.decimal "valor_solucion", precision: 19, scale: 12, default: "0.0", null: false
    t.decimal "enganche", precision: 19, scale: 12, default: "0.0", null: false
    t.string "no_subsidio_fed", limit: 10
    t.string "no_subsidio_est", limit: 10
    t.string "no_subsidio_mun", limit: 10
    t.string "no_subsidio_otr", limit: 10
    t.decimal "costo_contado", precision: 19, scale: 12, default: "0.0", null: false
    t.integer "plazo", default: 0, null: false
    t.float "taza_interes", limit: 53, default: 0.0, null: false
    t.float "moratorio", limit: 53, default: 0.0, null: false
    t.decimal "costo_financiamiento", precision: 19, scale: 12, default: "0.0", null: false
    t.decimal "total_pagar", precision: 19, scale: 12, default: "0.0", null: false
    t.decimal "total_abonado", precision: 19, scale: 12, default: "0.0", null: false
    t.decimal "total_descuento", precision: 19, scale: 12, default: "0.0", null: false
    t.decimal "pago_mensual", precision: 19, scale: 12, default: "0.0", null: false
    t.date "fecha_inicio", null: false
    t.string "estatus", limit: 22, default: "PAGANDOLA", null: false
    t.text "observaciones"
    t.string "plantilla", limit: 1, null: false
    t.integer "saiv", default: 0, null: false
    t.text "fechas_saiv"
    t.string "tabla", limit: 1, default: "4", null: false
    t.integer "demanda_id", null: false
    t.integer "lote_id", null: false
    t.string "reestructura_id", limit: 30, default: "0", null: false
    t.text "registrado", null: false
    t.text "actualizado"
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "credito_subsidio", primary_key: ["id", "credito_id", "subsidio_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id", null: false, auto_increment: true
    t.string "credito_id", limit: 50, null: false
    t.integer "subsidio_id", null: false
    t.index ["credito_id"], name: "credito_clave"
    t.index ["subsidio_id"], name: "subsidio_id"
  end

  create_table "datos_empresa", primary_key: "id_empresa", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "limite_monto", limit: 53, default: 0.0, null: false
    t.decimal "limite_porcentaje", precision: 4, scale: 2, default: "0.0", null: false
    t.string "director", limit: 80, null: false
    t.boolean "estatus", default: true, null: false
    t.date "fecha_director", null: false
    t.date "fecha_limite", null: false
  end

  create_table "demanda", primary_key: "id_demanda", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "modulo", limit: 21, null: false
    t.string "tipo_cliente", limit: 11, default: "AHORRADOR", null: false
    t.float "enganche", limit: 53, default: 0.0, null: false
    t.text "observaciones"
    t.string "plantilla", limit: 1, default: "2", null: false
    t.string "estatus", limit: 10, default: "PREPARADO", null: false
    t.text "registrado", null: false
    t.text "actualizado"
    t.integer "tipo_programa_id", null: false
    t.bigint "cliente_id", null: false
    t.date "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "fk_demanda_cliente1"
    t.index ["tipo_programa_id"], name: "fk_demanda_tipo_programa1"
  end

  create_table "descuento", primary_key: "id_descuento", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "observaciones", null: false
    t.string "estatus", limit: 10, default: "DISPONIBLE", null: false
    t.text "estatus_descuentos", null: false
    t.text "desc_capital", null: false
    t.text "desc_interes", null: false
    t.text "desc_moratorio", null: false
    t.text "mensualidades", null: false
    t.string "credito_clave", limit: 50, null: false
    t.text "registrado", null: false
    t.date "vigencia", null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "documento_tipo_programa", primary_key: ["id", "documento_id", "tipo_programa_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id", null: false, auto_increment: true
    t.integer "documento_id", null: false
    t.integer "tipo_programa_id", null: false
    t.index ["documento_id"], name: "fk_cat_documento_has_tipo_programa_cat_documento1"
    t.index ["tipo_programa_id"], name: "fk_cat_documento_has_tipo_programa_tipo_programa1"
  end

  create_table "empleado", primary_key: "id_empleado", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 45, null: false
    t.string "modulo", limit: 16, null: false
    t.string "apellido_p", limit: 45, null: false
    t.string "apellido_m", limit: 45, null: false
    t.string "telefono", limit: 13
    t.string "correo", limit: 60
    t.bigint "usuario_id", null: false
    t.bigint "jefe_id", default: 0, null: false
    t.boolean "jefe", default: false, null: false
    t.boolean "emp_estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correo"], name: "correo", unique: true
    t.index ["usuario_id"], name: "fk_Empleados_usuarios1"
  end

  create_table "estudio_socioeconomico", primary_key: "id_estudio", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "antiguedad", default: 0, null: false
    t.string "nombre_trabajo", limit: 45, null: false
    t.string "telefono_trabajo", limit: 13, default: "null"
    t.string "servicio_salud", limit: 14, default: "NO TIENE", null: false
    t.string "servicio_vivienda", limit: 9, default: "NO TIENE", null: false
    t.string "num_int", limit: 7, default: "0", null: false
    t.string "num_ext", limit: 7, default: "0", null: false
    t.float "ingr_principal", limit: 24, default: 0.0, null: false
    t.float "ingr_secundario", limit: 24, default: 0.0, null: false
    t.boolean "asalariado", default: false, null: false
    t.float "gst_alimentacion", limit: 24, default: 0.0, null: false
    t.float "gst_luz", limit: 24, default: 0.0, null: false
    t.float "gst_transporte", limit: 24, default: 0.0, null: false
    t.float "gst_renta", limit: 24, default: 0.0, null: false
    t.float "gst_educacion", limit: 24, default: 0.0, null: false
    t.float "gst_agua", limit: 24, default: 0.0, null: false
    t.float "gst_otros", limit: 24, default: 0.0, null: false
    t.float "gst_total", limit: 24, default: 0.0, null: false
    t.float "ingr_total", limit: 24, default: 0.0, null: false
    t.float "ingr_familiar", limit: 53, default: 0.0, null: false
    t.string "no_seg_social", limit: 15
    t.integer "num_cuartos", default: 0, null: false
    t.boolean "escrituracion", default: false, null: false
    t.string "estado_vivienda", limit: 16, null: false
    t.string "entrevistador", limit: 60, null: false
    t.string "responsable", limit: 60, null: false
    t.boolean "estatus", default: true, null: false
    t.bigint "cliente_id", null: false
    t.bigint "calle_id", null: false
    t.integer "techo_id", null: false
    t.integer "muro_id", null: false
    t.integer "piso_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calle_id"], name: "fk_estudios_socioeconomicos_cat_calles1"
    t.index ["cliente_id"], name: "fk_estudios_socioeconomicos_clientes1"
    t.index ["muro_id"], name: "muro_id"
    t.index ["piso_id"], name: "piso_id"
    t.index ["techo_id", "muro_id", "piso_id"], name: "techo_id"
  end

  create_table "familiar", primary_key: "id_familiar", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 45, null: false
    t.string "ape_paterno", limit: 45, null: false
    t.string "ape_materno", limit: 45, null: false
    t.string "parentesco", limit: 14, null: false
    t.string "genero", limit: 9, null: false
    t.integer "edad", null: false
    t.string "ocupacion", limit: 45, default: "null"
    t.float "ingresos", limit: 24, default: 0.0, null: false
    t.bigint "cliente_id", null: false
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.index ["cliente_id"], name: "fk_familiares_cliente1"
  end

  create_table "lote", primary_key: "id_lote", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "no_manzana", null: false
    t.string "no_lote", limit: 10, null: false
    t.float "superficie", limit: 53, null: false
    t.text "norte", null: false
    t.text "sur", null: false
    t.text "este", null: false
    t.text "oeste", null: false
    t.text "noreste"
    t.text "sureste"
    t.text "suroeste"
    t.text "noroeste"
    t.string "ochavo", limit: 40
    t.string "uso_suelo", limit: 10, null: false
    t.string "clave_catastral", limit: 35
    t.string "calle", limit: 60, null: false
    t.string "numero", limit: 10, null: false
    t.boolean "regularizacion", default: false, null: false
    t.string "estatus", limit: 21, default: "DISPONIBLE", null: false
    t.bigint "colonia_id", null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.index ["clave_catastral"], name: "clave_catastral", unique: true
  end

  create_table "mensualidad", primary_key: "clave_mensualidad", id: :string, limit: 50, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "no_mensualidad", default: 0, null: false
    t.date "fecha_vencimiento", null: false
    t.decimal "descuento_capital", precision: 18, scale: 12, default: "0.0", null: false
    t.decimal "descuento_interes", precision: 18, scale: 12, default: "0.0", null: false
    t.decimal "descuento_moratorio", precision: 18, scale: 12, default: "0.0", null: false
    t.decimal "interes", precision: 18, scale: 12, default: "0.0", null: false
    t.decimal "capital", precision: 18, scale: 12, default: "0.0", null: false
    t.decimal "saldo", precision: 18, scale: 12, default: "0.0", null: false
    t.decimal "resto", precision: 18, scale: 12, default: "0.0", null: false
    t.string "estatus", limit: 9, default: "NO PAGADO", null: false
    t.string "credito_clave", limit: 50, null: false
  end

  create_table "pre_registro", primary_key: "id_pre_registro", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "solicitante_nombre", limit: 45, null: false
    t.string "solicitante_ape_paterno", limit: 45, null: false
    t.string "solicitante_ape_materno", limit: 45, null: false
    t.string "solicitante_curp", limit: 18, null: false
    t.string "genero", limit: 9, null: false
    t.string "correo", limit: 50
    t.string "telefono", limit: 13
    t.date "fecha_nac", null: false
    t.string "estado_nac", limit: 50, null: false
    t.string "lugar_nac", limit: 50, null: false
    t.integer "no_dependientes", null: false
    t.string "escolaridad", limit: 34, null: false
    t.string "estado_civil", limit: 20, null: false
    t.string "conyuge_nombre", limit: 45
    t.string "conyuge_ape_paterno", limit: 45
    t.string "conyuge_ape_materno", limit: 45
    t.string "conyuge_curp", limit: 18
    t.date "conyuge_fecha_nac"
    t.string "conyuge_lugar_nac", limit: 50
    t.string "bienes", limit: 12
    t.string "clave_registro", limit: 15, null: false
    t.string "password", limit: 350, null: false
    t.boolean "estatus", default: true, null: false
    t.integer "ocupacion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clave_registro"], name: "clave_registro", unique: true
    t.index ["conyuge_curp"], name: "conyuge_curp_UNIQUE", unique: true
    t.index ["correo"], name: "correo", unique: true
    t.index ["solicitante_curp"], name: "solicitante_curp_UNIQUE", unique: true
  end

  create_table "programa", primary_key: "id_programa", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 150, null: false
    t.boolean "estatus", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referencia", primary_key: "id_referencia", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 40, null: false
    t.string "ape_paterno", limit: 40, null: false
    t.string "ape_materno", limit: 40, null: false
    t.text "domicilio", null: false
    t.string "telefono", limit: 13
    t.string "parentesco", limit: 14, null: false
    t.string "genero", limit: 9, null: false
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "cliente_id"
  end

  create_table "regularizacion", primary_key: "id_regularizacion", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "valor_metro", limit: 53, default: 0.0, null: false
    t.float "catastral_lote", limit: 53, default: 0.0, null: false
    t.float "catastral_construccion", limit: 53, default: 0.0, null: false
    t.float "insuvi_lote", limit: 53, default: 0.0, null: false
    t.float "insuvi_pie_casa", limit: 53, default: 0.0, null: false
    t.boolean "drenaje", default: false
    t.boolean "agua", default: false
    t.boolean "electricidad", default: false
    t.string "estado_vivienda", limit: 16, default: "PROPIA", null: false
    t.string "escrituracion", limit: 8, default: "VIVIENDA", null: false
    t.integer "lote_id", default: 0, null: false
    t.integer "techo_id", null: false
    t.integer "piso_id", null: false
    t.integer "muro_id", null: false
    t.integer "regimen_id", null: false
    t.date "created_at"
    t.date "updated_at"
  end

  create_table "seguimiento", primary_key: "id_seguimiento", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "descripcion_seguimiento"
    t.string "restriccion", limit: 12, null: false
    t.float "monto_convenio", limit: 53, default: 0.0, null: false
    t.boolean "convenio_pagado", default: false, null: false
    t.float "abonado_convenio", limit: 53, default: 0.0, null: false
    t.boolean "estatus_seguimiento", default: true, null: false
    t.integer "situacion_id", default: 0, null: false
    t.string "credito_clave", limit: 50, null: false
    t.text "registrado", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sit_conyuge", primary_key: "id_sit_conyuge", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "antiguedad", default: 0, null: false
    t.string "nombre_trabajo", limit: 45, null: false
    t.string "telefono_trabajo", limit: 13, default: "null"
    t.string "servicio_salud", limit: 14, default: "NO TIENE", null: false
    t.string "servicio_vivienda", limit: 9, default: "NO TIENE", null: false
    t.string "no_seg_social", limit: 15
    t.string "num_int", limit: 7, default: "0", null: false
    t.string "num_ext", limit: 7, default: "0", null: false
    t.float "ingr_prin", limit: 24, default: 0.0, null: false
    t.boolean "asalariado", default: false, null: false
    t.float "ingr_sec", limit: 24, default: 0.0, null: false
    t.bigint "calle_id", null: false
    t.integer "ocupacion_id", null: false
    t.bigint "estudio_socioeconomico_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calle_id"], name: "fk_conyuges_cat_calles1"
    t.index ["estudio_socioeconomico_id"], name: "fk_conyuges_estudios_socioeconomicos1"
    t.index ["ocupacion_id"], name: "fk_conyuges_cat_tipos_empleos1"
  end

  create_table "situacion", primary_key: "id_situacion", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "situacion", null: false
    t.boolean "status", default: true, null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "solicitud_eliminacion", primary_key: "id_solicitud", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "descripcion", null: false
    t.string "credito", limit: 50, null: false
    t.string "usuario", limit: 50, null: false
    t.string "responsable", limit: 50
    t.string "status", limit: 11, default: "PENDIENTE", null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "subsidio", primary_key: "id_subsidio", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT" do |t|
    t.string "tipo", limit: 9, default: "OTROS", null: false
    t.string "organizacion", limit: 80, null: false
    t.string "clave", limit: 50, null: false
    t.float "valor", limit: 53, default: 0.0, null: false
    t.boolean "estatus", default: true, null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "tipo_programa", primary_key: "id_tipo_programa", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 80, null: false
    t.text "descripcion", null: false
    t.boolean "estatus", default: true, null: false
    t.string "plantilla", limit: 1, null: false
    t.integer "programa_id", null: false
    t.integer "banco_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["programa_id"], name: "fk_tipo_programa_programa1"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "password"
    t.string "curp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuario", primary_key: "id_usuario", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "usuario", limit: 80, null: false
    t.text "password", null: false
    t.text "perfil", null: false
    t.text "modulos", null: false
    t.string "permisos", limit: 3, default: "25", null: false
    t.boolean "estatus_us", default: true, null: false
    t.text "remember_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario"], name: "usuario_UNIQUE", unique: true
  end

    end
  end
end
