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

# -----------------------------------------------------------------------------
# Required
# -----------------------------------------------------------------------------

variable "application_id" {
  description = "AppConfig application ID."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{4,7}$", var.application_id))
    error_message = "application_id must match ^[a-z0-9]{4,7}$."
  }
}

variable "name" {
  description = "Name of the AppConfig environment. Must be 1 to 64 characters."
  type        = string

  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 64
    error_message = "Name must be between 1 and 64 characters."
  }
}

# -----------------------------------------------------------------------------
# Optional
# -----------------------------------------------------------------------------

variable "description" {
  description = "Description of the AppConfig environment. Must be at most 1024 characters."
  type        = string
  default     = null

  validation {
    condition     = var.description == null ? true : length(var.description) <= 1024
    error_message = "Description must be at most 1024 characters."
  }
}

variable "monitors" {
  description = "CloudWatch alarms to monitor during deployments. Maximum of 5 monitors. alarm_role_arn is optional when AWS AppConfig has permission through the service-linked role."
  type = list(object({
    alarm_arn      = string
    alarm_role_arn = optional(string)
  }))
  default = []
  validation {
    condition     = length(var.monitors) <= 5
    error_message = "At most 5 monitors may be configured."
  }
}

variable "region" {
  description = "AWS Region where this resource is managed. Defaults to the provider-configured Region."
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags to assign to the resource. Up to 50 tags are allowed; tag keys must be 1 to 128 characters and values must be at most 256 characters."
  type        = map(string)
  default     = {}

  validation {
    condition = length(var.tags) <= 50 && alltrue([
      for key, value in var.tags : length(key) >= 1 && length(key) <= 128 && length(value) <= 256
    ])
    error_message = "Tags must contain at most 50 entries. Tag keys must be 1 to 128 characters and values must be at most 256 characters."
  }
}
