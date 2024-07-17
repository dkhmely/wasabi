variable "buckets" {
  description = "Map of bucket names"
  type        = map(string)
  default = {
    sales_data      = "sales-data-bucket",
    marketing_data  = "marketing-data-bucket",
    engineering_data = "engineering-data-bucket",
    finance_data    = "finance-data-bucket",
    operations_data = "operations-data-bucket"
  }
}

variable "users" {
  description = "Map of user policies"
  type        = map(object({
    rw = map(string)
    ro = map(string)
  }))
  default = {
    alice = {
      rw = {
        "sales_data" = "write",
        "marketing_data" = "write"
      },
      ro = {
        "engineering_data" = "read"
      }
    },
    bob = {
      rw = {
        "sales_data" = "write",
        "marketing_data" = "write",
        "engineering_data" = "write",
        "finance_data" = "write",
        "operations_data" = "write"
      },
      ro = {}
    },
    charlie = {
      rw = {
        "operations_data" = "write"
      },
      ro = {
        "finance_data" = "read"
      }
    },
    backup = {
      rw = {},
      ro = {
        "sales_data" = "read",
        "marketing_data" = "read",
        "engineering_data" = "read",
        "finance_data" = "read",
        "operations_data" = "read"
      }
    }
  }
}
