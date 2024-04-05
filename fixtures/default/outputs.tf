output "name" {
  description = "The network name"
  value       = module.test.name
}

output "project" {
  description = "The ID of the project in which the resource belongs"
  value       = module.test.project
}

output "self_link" {
  description = "The URI of the created resource"
  value       = module.test.self_link
}
