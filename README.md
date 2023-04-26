# <img align="left" width="45" height="45" src="https://user-images.githubusercontent.com/1610100/234732421-ef3a5c43-817d-4e99-8e0c-d43f07358791.png"> Google Cloud Platform - VPC Terraform Module

**[GitHub Actions](https://github.com/osinfra-io/terraform-google-vpc/actions):**

[![Kitchen Tests](https://github.com/osinfra-io/terraform-google-vpc/actions/workflows/kitchen.yml/badge.svg)](https://github.com/osinfra-io/terraform-google-vpc/actions/workflows/kitchen.yml) [![Dependabot](https://github.com/osinfra-io/terraform-google-vpc/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/terraform-google-vpc/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

Monthly cost estimates for this module based off these usage values: [Default VPC](test/fixtures/default_vpc/infracost-usage.yml), [Shared VPC](test/fixtures/shared_vpc/infracost-usage.yml)

Terraform **example** module for a Google Cloud Platform VPC.

*We do not recommend consuming this module like you might a [public module](https://registry.terraform.io/browse/modules). Its purpose is to be a baseline, something you can fork and potentially maintain on your own and modify to fit your organization's needs. Using public modules vs. writing your own have various [drivers and trade-offs](https://github.com/orgs/osinfra-io/discussions/3) that your organization should evaluate.*

## Usage

You can check the [test/fixtures](test/fixtures/) directory for example configurations. These fixtures set up the system for the testing process by providing it with all the necessary code to initialize it, thus creating good examples to base your configurations on.

Here is an example of a basic configuration:

```hcl
module "vpc" {
  source   = "github.com/osinfra-io/terraform-google-vpc//global?ref=v0.0.0"

  network_name = "example-vpc"
  project      = "example-project"
}
```

## <img align="left" width="35" height="35" src="https://user-images.githubusercontent.com/1610100/209029142-410349b7-4b22-40a9-9d4d-729f07e2b4a2.png"> Development

>Open Source Infrastructure (as code) is a development model for infrastructure that focuses on open collaboration applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down [stream-aligned](https://teamtopologies.com/key-concepts) teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a local development environment [here](https://docs.osinfra.io/development-setup).

### Tools

- [infracost](https://github.com/infracost/infracost)
- [inspec](https://github.com/inspec/inspec)
- [kitchen-terraform](https://github.com/newcontext-oss/kitchen-terraform)
- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [firewall](https://cloud.google.com/vpc/docs/firewalls)
- [shared vpc](https://cloud.google.com/vpc/docs/shared-vpc)
- [vpc](https://cloud.google.com/vpc/docs/vpc)

### Tests

```none
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

## Terraform Documentation

[Global Infrastructure](global/README.md)
