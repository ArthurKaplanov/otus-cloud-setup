resource "yandex_compute_instance" "compute-vm-2-2-10-ssd-1783175271593" {
  boot_disk {
    initialize_params {
      name       = "disk-ubuntu-20-04-lts-os-login-1783175276302"
      type       = "network-ssd"
      size       = 10
      block_size = 4096
      image_id   = "fd87q9coi4v2ap1c9okf"
    }
    auto_delete = true
  }
  folder_id = var.yc_folder_id
  hostname  = "compute-vm-2-2-10-ssd-1783175271593"
  metadata = {
    user-data = "#cloud-config\ndatasource:\n Ec2:\n  strict_id: false\nssh_pwauth: no\nusers:\n- name: ubuntu\n  sudo: ALL=(ALL) NOPASSWD:ALL\n  shell: /bin/bash\n  ssh_authorized_keys:\n  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG1DB0k45xC+EYl54R0YKEehQrnU0AhEIVloB3SbF8jS https://github.com/ArthurKaplanov"
    ssh-keys  = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG1DB0k45xC+EYl54R0YKEehQrnU0AhEIVloB3SbF8jS https://github.com/ArthurKaplanov"
  }
  name = "compute-vm-2-2-10-ssd-1783175271593"
  network_interface {
    subnet_id = "fl85dhe7vfiulk72nv9m"
    index     = 0
    nat       = true
  }
  platform_id = "standard-v3"
  resources {
    memory        = 2
    cores         = 2
    core_fraction = 100
  }
  scheduling_policy {
    preemptible = true
  }
  zone = var.yc_zone
}
