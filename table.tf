##############################################################################
####################### CRIACAO DO TABLE NORMALIZACAO DO GLUE - FIM ########################
###############################################################################

resource "aws_glue_catalog_table" "tb_normalizacao_alias" {
  name          = "tb_normalizacao"
  database_name = "bd_bonus"

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL              = "TRUE"
    "parquet.compression" = "SNAPPY"
  }

  storage_descriptor {
    location      = "s3://dadosrelacionamento-${var.environment}/topics/cashmanagement-boleto/tb-normalizacao"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    ser_de_info {
      name                  = "my-stream"
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"

      parameters = {
        "serialization.format" = 1
      }
    }

    columns {
      name = "specversion"
      type = "string"
    }

    columns {
      name = "anomesdia"
      type = "string"
    }

    columns {
      name    = "type"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "id"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "time"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "eventversion"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "transactionid"
      type    = "string"
      comment = ""
    }


    columns {
      name    = "data"
      type    = "string"
    }
  }
}


resource "aws_glue_catalog_table" "tb_selecao_alias" {
  name          = "tb_selecao"
  database_name = "bd_bonus"

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL              = "TRUE"
    "parquet.compression" = "SNAPPY"
  }

  storage_descriptor {
    location      =  "s3://dadosrelacionamento-${var.environment}/topics/cashmanagement-boleto/tb-selecao"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    ser_de_info {
      name                  = "my-stream"
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"

      parameters = {
        "serialization.format" = 1
      }
    }

    columns {
      name = "type"
      type = "string"
    }

    columns {
      name = "time"
      type = "string"
    }

    columns {
      name    = "numero_agencia"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "numero_conta_corrente"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "numero_digito_verificador"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "codigo_tipo_pessoa"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "numero_cadastro_nacional_pessoa_juridica"
      type    = "string "
      comment = ""
    }


    columns {
      name    = "valor_pago_boleto_cobranca"
      type    = "string"
      comment = ""
    }
  }
}

