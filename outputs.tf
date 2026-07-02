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
  value       = aws_appconfig_environment.environment.environment_id
}

output "arn" {
  description = "The ARN of the environment."
  value       = aws_appconfig_environment.environment.arn
}

output "name" {
  description = "The name of the environment."
  value       = aws_appconfig_environment.environment.name
}

output "state" {
  description = "The environment state."
  value       = aws_appconfig_environment.environment.state
}

output "application_id" {
  description = "The AppConfig application ID."
  value       = aws_appconfig_environment.environment.application_id
}

output "description" {
  description = "The environment description."
  value       = aws_appconfig_environment.environment.description
}

output "monitors" {
  description = "The CloudWatch alarms monitored during deployments."
  value       = aws_appconfig_environment.environment.monitor
}
