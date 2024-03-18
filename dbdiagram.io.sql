Table "categories" {
  "category_id" INT [pk, increment]
  "category_name" VARCHAR(255) [not null]
  "description" TEXT
}

Table "customer_demographics" {
  "customer_type_id" INT [pk, increment]
  "customer_desc" TEXT
}

Table "customer_customer_demo" {
  "customer_id" VARCHAR(255)
  "customer_type_id" INT

  Indexes {
    (customer_id, customer_type_id) [pk]
  }
}

Table "customers" {
  "customer_id" VARCHAR(255) [pk]
  "company_name" VARCHAR(255) [not null]
  "contact_name" VARCHAR(255)
  "contact_title" VARCHAR(255)
  "address" VARCHAR(255)
  "city" VARCHAR(255)
  "region" VARCHAR(255)
  "postal_code" VARCHAR(255)
  "country" VARCHAR(255)
  "phone" VARCHAR(255)
  "fax" VARCHAR(255)
}

Table "employees" {
  "employee_id" INT [pk, increment]
  "last_name" VARCHAR(255) [not null]
  "first_name" VARCHAR(255) [not null]
  "title" VARCHAR(255)
  "title_of_courtesy" VARCHAR(255)
  "birth_date" DATE
  "hire_date" DATE
  "address" VARCHAR(255)
  "city" VARCHAR(255)
  "region" VARCHAR(255)
  "postal_code" VARCHAR(255)
  "country" VARCHAR(255)
  "home_phone" VARCHAR(255)
  "extension" VARCHAR(255)
  "photo" MEDIUMBLOB
  "notes" TEXT
  "reports_to" INT
}

Table "employee_territories" {
  "employee_id" INT
  "territory_id" VARCHAR(255)

  Indexes {
    (employee_id, territory_id) [pk]
  }
}

Table "order_details" {
  "order_id" INT
  "product_id" INT
  "unit_price" DECIMAL(10,2) [not null]
  "quantity" SMALLINT [not null]
  "discount" REAL [not null]

  Indexes {
    (order_id, product_id) [pk]
  }
}

Table "orders" {
  "order_id" INT [pk, increment]
  "customer_id" VARCHAR(255)
  "employee_id" INT
  "order_date" DATE
  "required_date" DATE
  "shipped_date" DATE
  "ship_via" INT
  "freight" DECIMAL(10,2)
  "ship_name" VARCHAR(255)
  "ship_address" VARCHAR(255)
  "ship_city" VARCHAR(255)
  "ship_region" VARCHAR(255)
  "ship_postal_code" VARCHAR(255)
  "ship_country" VARCHAR(255)
}

Table "products" {
  "product_id" INT [pk, increment]
  "product_name" VARCHAR(255) [not null]
  "supplier_id" INT
  "category_id" INT
  "quantity_per_unit" VARCHAR(255)
  "unit_price" DECIMAL(10,2)
  "units_in_stock" SMALLINT
  "units_on_order" SMALLINT
  "reorder_level" SMALLINT
  "discontinued" BOOLEAN [not null]
}

Table "region" {
  "region_id" INT [pk, increment]
  "region_description" VARCHAR(255) [not null]
}

Table "shippers" {
  "shipper_id" INT [pk, increment]
  "company_name" VARCHAR(255) [not null]
  "phone" VARCHAR(255)
}

Table "suppliers" {
  "supplier_id" INT [pk, increment]
  "company_name" VARCHAR(255) [not null]
  "contact_name" VARCHAR(255)
  "contact_title" VARCHAR(255)
  "address" VARCHAR(255)
  "city" VARCHAR(255)
  "region" VARCHAR(255)
  "postal_code" VARCHAR(255)
  "country" VARCHAR(255)
  "phone" VARCHAR(255)
  "fax" VARCHAR(255)
  "homepage" TEXT
}

Table "territories" {
  "territory_id" VARCHAR(255) [pk]
  "territory_description" VARCHAR(255) [not null]
  "region_id" INT
}

Table "us_states" {
  "state_id" INT [pk, increment]
  "state_name" VARCHAR(255) [not null]
  "state_abbr" VARCHAR(2) [not null]
  "state_region" VARCHAR(255)
}

Ref:"customers"."customer_id" < "customer_customer_demo"."customer_id"

Ref:"customer_demographics"."customer_type_id" < "customer_customer_demo"."customer_type_id"

Ref:"employees"."employee_id" < "employees"."reports_to"

Ref:"employees"."employee_id" < "employee_territories"."employee_id"

Ref:"territories"."territory_id" < "employee_territories"."territory_id"

Ref:"orders"."order_id" < "order_details"."order_id"

Ref:"products"."product_id" < "order_details"."product_id"

Ref:"customers"."customer_id" < "orders"."customer_id"

Ref:"employees"."employee_id" < "orders"."employee_id"

Ref:"shippers"."shipper_id" < "orders"."ship_via"

Ref:"suppliers"."supplier_id" < "products"."supplier_id"

Ref:"categories"."category_id" < "products"."category_id"

Ref:"region"."region_id" < "territories"."region_id"
