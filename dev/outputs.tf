 output "my_compute_hostnames" {
      value = module.my_compute.virtual_machine_hostnames
  }

  output "my_compute_ips" {
      value = module.my_compute.virtual_machine_nic_private_ip_address
  }
