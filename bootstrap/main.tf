
#IAM service 
resource "yandex_iam_service_account" "hw2-service" {
  name        = var.yc_service_account_name
  description = "Service account for hw2"
}

resource "yandex_resourcemanager_folder_iam_member" "sa_roles" {
  for_each = toset([
    "storage.admin",
    "dataproc.editor",
    "compute.admin",
    "dataproc.agent",
    "mdb.dataproc.agent",
    "vpc.admin",
    "iam.serviceAccounts.user",
    "storage.uploader",
    "storage.viewer",
    "storage.editor"
  ])

  folder_id = var.yc_folder_id
  role      = each.key
  member    = "serviceAccount:${yandex_iam_service_account.hw2-service.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.hw2-service.id
  description        = "Static access key for object storage"
}

resource "yandex_iam_service_account_key" "hw2_auth_key" {
  service_account_id = yandex_iam_service_account.hw2-service.id
  description        = "new auth key for hw2"
}


resource "local_sensitive_file" "authorized_key_json" {
  filename = "infra/authorized_key.json"

  content = jsonencode({
    id                 = yandex_iam_service_account_key.hw2_auth_key.id
    service_account_id = yandex_iam_service_account.hw2-service.id
    created_at         = yandex_iam_service_account_key.hw2_auth_key.created_at
    key_algorithm      = yandex_iam_service_account_key.hw2_auth_key.key_algorithm
    public_key         = yandex_iam_service_account_key.hw2_auth_key.public_key
    private_key        = yandex_iam_service_account_key.hw2_auth_key.private_key
  })
}

