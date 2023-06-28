variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key."
  type        = string
  default     = ""
}
variable "iam_access_key_status" {
  description = "Access key status to apply."
  type        = string
  default     = null
}