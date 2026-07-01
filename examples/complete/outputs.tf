// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

output "id" {
  description = "The environment ID."
  value       = module.environment.id
}
output "arn" {
  description = "The ARN of the environment."
  value       = module.environment.arn
}
output "name" {
  description = "The name of the environment."
  value       = module.environment.name
}
output "state" {
  description = "The environment state."
  value       = module.environment.state
}
output "application_id" {
  description = "The application ID."
  value       = module.environment.application_id
}
output "expected_name" {
  description = "Expected environment name."
  value       = module.resource_names["environment"].standard
}

output "region" {
  description = "The AWS Region where the example resources are deployed."
  value       = data.aws_region.current.region
}
