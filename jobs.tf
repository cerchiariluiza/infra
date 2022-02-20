resource "aws_glue_job" "job_selecao" {
  name     = "job_selecao"
  role_arn = "arn:aws:iam::959181567859:role/dados_relacionamento_role"

  command {
    script_location = "s3://imobiliario/job_normalizacaoo.py"
  }
}

resource "aws_glue_trigger" "selecao" {
  name     = "selecao"
  schedule = "cron(15 1 * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = "job_selecao"
  }
}

resource "aws_glue_job" "job_normalizacao" {
  name     = "job_normalizacao"
  role_arn = "arn:aws:iam::959181567859:role/dados_relacionamento_role"

  command {
    script_location = "s3://imobiliario/job_normalizacaoo.py"
  }
}

resource "aws_glue_trigger" "normalizacao" {
  name     = "normalizacao"
  schedule = "cron(15 1 * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = "job_normalizacao"
  }
}


resource "aws_glue_job" "job_sumarizacao" {
  name     = "job_sumarizacao"
  role_arn = "arn:aws:iam::959181567859:role/dados_relacionamento_role"

  command {
    script_location = "s3://imobiliario/job_sumarizacaoo.py"
  }
}

resource "aws_glue_trigger" "sumarizacao" {
  name     = "sumarizacao"
  schedule = "cron(15 1 * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = "job_sumarizacao"
  }
}



