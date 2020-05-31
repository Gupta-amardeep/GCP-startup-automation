output "instance_name" {
  value = "${google_compute_instance.vm_instance.name}"
}

output "external-ip" {
  value = google_compute_address.my-ip.address
}