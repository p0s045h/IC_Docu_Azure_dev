locals {
      azure_resource_group_name              = "Opentextcloud-icdocudev-eastus2_0-NPROD-000"
      azure_subscription_id                  = "23c6c55f-2b36-4869-9420-0c8bc50854fd"
      virtual_machine_windows_admin_groups = "homeoffice/opentextssl"
      tag_apmid                            = "APM0019511"
      tag_application_name                 = "IC_Documentum"
      tag_environment_type                 = "dev"
      tag_notification_dist_list           = "Win2k12-Elimination@wal-mart.com"
      #tag_owner_ad_group                   = ""
      tag_team_rosters_product_id          = "1278"
  }

  provider "azurerm" {
      subscription_id = local.azure_subscription_id
      features {}
  }

  provider "random" {}
  provider "walmart" {}

  module "my_compute" {
      source  = "localterraform.com/SharedModules/simple-compute/azurerm"
      version = "2.6.2"

      azure_resource_group_name                           = local.azure_resource_group_name
      azure_subscription_id                               = local.azure_subscription_id
      virtual_machine_extension_storage_account           = var.virtual_machine_extension_storage_account
      virtual_machine_walmart_approved_operating_system   = "windows_2022_gen2"
      
      # Required for Linux
      # virtual_machine_linux_admin_ssh_public_key = var.virtual_machine_linux_admin_ssh_public_key
      
      # Required for Windows
      virtual_machine_windows_admin_groups              = local.virtual_machine_windows_admin_groups
      virtual_machine_windows_join_domain_secret        = var.virtual_machine_windows_join_domain_secret
      
      # Optional Variables:
      # tag_apmid                   = local.tag_apmid
      # tag_application_name        = local.tag_application_name
      # tag_environment_type        = local.tag_environment_type
      # tag_notification_dist_list  = local.tag_notification_dist_list
      # tag_owner_ad_group          = local.tag_owner_ad_group
      # tag_team_rosters_product_id = local.tag_team_rosters_product_id
      # virtual_machine_count
      # virtual_machine_data_disk_cache = ["None"]
      # virtual_machine_data_disk_count = 1
      # virtual_machine_data_disk_size  = [10]
      # virtual_machine_data_disk_type  = ["StandardSSD_LRS"]
      # virtual_machine_enable_accelerated_network = true
      # virtual_machine_size = ""
  }
