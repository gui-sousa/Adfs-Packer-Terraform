resource "google_compute_instance" "servidor-windows-adfs" {
  name         = "bee-active-directory-federation-service-2019-vm"
  machine_type = var.tipo-vm
  zone         = var.zona
  boot_disk {
    initialize_params {
      image = "windows-server-winrm-2019"
    }
  }

  #Define Configuração de Rede
  network_interface {
    network = "default"
    access_config {}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  tags = ["http-server", "https-server"]

}

