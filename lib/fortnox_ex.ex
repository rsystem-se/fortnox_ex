defmodule FortnoxEx do
  @moduledoc """
  Documentation for `FortnoxEx`.

  API calls are rate limited with Fuse for 200 calls per minute. Should the rate limiting be blown, then the
  rate limiter will refresh in 60 seconds. If the rate limiter is hit, then the result of any api call
  will be {:error, :unavailable}
  """

  alias FortnoxEx.{Models, Utils}

  defdelegate get_access_token(client_secret, authorization_code), to: Utils
  defdelegate client(client_secret, access_token), to: Utils

  defdelegate create_absence_transaction(client, absence_transaction_attrs), to: Models.AbsenceTransaction
  defdelegate list_absence_transactions(client, query), to: Models.AbsenceTransaction
  defdelegate stream_absence_transactions(client, query), to: Models.AbsenceTransaction
  defdelegate get_absence_transaction(client, absence_transaction_number), to: Models.AbsenceTransaction
  defdelegate update_absence_transaction(client, absence_transaction_number, absence_transaction_attrs),
              to: Models.AbsenceTransaction
  defdelegate delete_absence_transaction(client, absence_transaction_number), to: Models.AbsenceTransaction

  defdelegate create_account(client, account_attrs), to: Models.Account
  defdelegate list_accounts(client, query), to: Models.Account
  defdelegate stream_accounts(client, query), to: Models.Account
  defdelegate get_account(client, account_number), to: Models.Account
  defdelegate update_account(client, account_number, account_attrs), to: Models.Account
  defdelegate delete_account(client, account_number), to: Models.Account

  defdelegate list_account_charts(client), to: Models.AccountChart

  defdelegate create_article(client, article_attrs), to: Models.Article
  defdelegate list_articles(client, query), to: Models.Article
  defdelegate stream_articles(client, query), to: Models.Article
  defdelegate get_article(client, article_number), to: Models.Article
  defdelegate update_article(client, article_number, article_attrs), to: Models.Article
  defdelegate delete_article(client, article_number), to: Models.Article

  defdelegate create_asset(client, asset_attrs), to: Models.Asset
  defdelegate list_assets(client, query), to: Models.Asset
  defdelegate stream_assets(client, query), to: Models.Asset
  defdelegate get_asset(client, asset_number), to: Models.Asset
  defdelegate update_asset(client, asset_number, asset_attrs), to: Models.Asset
  defdelegate delete_asset(client, asset_number), to: Models.Asset

  defdelegate create_attendance_transaction(client, attendance_transaction_attrs), to: Models.AttendanceTransaction
  defdelegate list_attendance_transactions(client, query), to: Models.AttendanceTransaction
  defdelegate stream_attendance_transactions(client, query), to: Models.AttendanceTransaction
  defdelegate get_attendance_transaction(client, attendance_transaction_number), to: Models.AttendanceTransaction
  defdelegate update_attendance_transaction(client, attendance_transaction_number, attendance_transaction_attrs),
              to: Models.AttendanceTransaction
  defdelegate delete_attendance_transaction(client, attendance_transaction_number), to: Models.AttendanceTransaction

  defdelegate create_contract(client, contract_attrs), to: Models.Contract
  defdelegate list_contracts(client, query), to: Models.Contract
  defdelegate stream_contracts(client, query), to: Models.Contract
  defdelegate get_contract(client, contract_number), to: Models.Contract
  defdelegate update_contract(client, contract_number, contract_attrs), to: Models.Contract
  defdelegate create_invoice_for_contract(client, contract_number), to: Models.Contract
  defdelegate increase_invoice_count_for_contract(client, contract_number), to: Models.Contract
  defdelegate finish_contract(client, contract_number), to: Models.Contract
  defdelegate delete_contract(client, contract_number), to: Models.Contract

  defdelegate create_currency(client, currency_attrs), to: Models.Currency
  defdelegate list_currencies(client, query), to: Models.Currency
  defdelegate stream_currencies(client, query), to: Models.Currency
  defdelegate get_currency(client, currency_number), to: Models.Currency
  defdelegate update_currency(client, currency_number, currency_attrs), to: Models.Currency
  defdelegate delete_currency(client, currency_number), to: Models.Currency

  defdelegate create_customer(client, customer_attrs), to: Models.Customer
  defdelegate list_customers(client, query), to: Models.Customer
  defdelegate stream_customers(client, query), to: Models.Customer
  defdelegate get_customer(client, customer_number), to: Models.Customer
  defdelegate update_customer(client, customer_number, customer_attrs), to: Models.Customer
  defdelegate delete_customer(client, customer_number), to: Models.Customer

  defdelegate create_employee(client, employee_attrs), to: Models.Employee
  defdelegate list_employees(client, query), to: Models.Employee
  defdelegate stream_employees(client, query), to: Models.Employee
  defdelegate get_employee(client, employee_number), to: Models.Employee
  defdelegate update_employee(client, employee_number, employee_attrs), to: Models.Employee
  defdelegate delete_employee(client, employee_number), to: Models.Employee

  defdelegate create_expense(client, expense_attrs), to: Models.Expense
  defdelegate list_expenses(client, query), to: Models.Expense
  defdelegate stream_expenses(client, query), to: Models.Expense
  defdelegate get_expense(client, expense_number), to: Models.Expense

  defdelegate create_invoice(client, invoice_attrs), to: Models.Invoice
  defdelegate list_invoices(client, query), to: Models.Invoice
  defdelegate stream_invoices(client, query), to: Models.Invoice
  defdelegate get_invoice(client, invoice_number), to: Models.Invoice
  defdelegate update_invoice(client, invoice_number, invoice_attrs), to: Models.Invoice
  defdelegate delete_invoice(client, invoice_number), to: Models.Invoice

  defdelegate create_invoice_payment(client, invoice_payment_attrs), to: Models.InvoicePayment
  defdelegate list_invoice_payments(client, query), to: Models.InvoicePayment
  defdelegate stream_invoice_payments(client, query), to: Models.InvoicePayment
  defdelegate get_invoice_payment(client, invoice_payment_number), to: Models.InvoicePayment
  defdelegate update_invoice_payment(client, invoice_payment_number, invoice_payment_attrs), to: Models.InvoicePayment
  defdelegate delete_invoice_payment(client, invoice_payment_number), to: Models.InvoicePayment

  defdelegate create_label(client, label_attrs), to: Models.Label
  defdelegate list_labels(client, query), to: Models.Label
  defdelegate stream_labels(client, query), to: Models.Label
  defdelegate get_label(client, label_number), to: Models.Label
  defdelegate update_label(client, label_number, label_attrs), to: Models.Label
  defdelegate delete_label(client, label_number), to: Models.Label

  defdelegate create_modes_of_payment(client, modes_of_payment_attrs), to: Models.ModesOfPayment
  defdelegate list_modes_of_payments(client, query), to: Models.ModesOfPayment
  defdelegate stream_modes_of_payments(client, query), to: Models.ModesOfPayment
  defdelegate get_modes_of_payment(client, modes_of_payment_code), to: Models.ModesOfPayment
  defdelegate update_modes_of_payment(client, modes_of_payment_code, modes_of_payment_attrs), to: Models.ModesOfPayment

  defdelegate create_offer(client, offer_attrs), to: Models.Offer
  defdelegate list_offers(client, query), to: Models.Offer
  defdelegate stream_offers(client, query), to: Models.Offer
  defdelegate get_offer(client, offer_number), to: Models.Offer
  defdelegate update_offer(client, offer_number, offer_attrs), to: Models.Offer
  defdelegate delete_offer(client, offer_number), to: Models.Offer

  defdelegate create_order(client, order_attrs), to: Models.Order
  defdelegate list_orders(client, query), to: Models.Order
  defdelegate stream_orders(client, query), to: Models.Order
  defdelegate get_order(client, order_number), to: Models.Order
  defdelegate update_order(client, order_number, order_attrs), to: Models.Order
  defdelegate delete_order(client, order_number), to: Models.Order

  defdelegate create_price_list(client, price_list_attrs), to: Models.PriceList
  defdelegate list_price_lists(client, query), to: Models.PriceList
  defdelegate stream_price_lists(client, query), to: Models.PriceList
  defdelegate get_price_list(client, price_list_number), to: Models.PriceList
  defdelegate update_price_list(client, price_list_number, price_list_attrs), to: Models.PriceList
  defdelegate delete_price_list(client, price_list_number), to: Models.PriceList

  defdelegate list_print_templates(client), to: Models.PrintTemplate

  defdelegate create_project(client, project_attrs), to: Models.Project
  defdelegate list_projects(client, query), to: Models.Project
  defdelegate stream_projects(client, query), to: Models.Project
  defdelegate get_project(client, project_number), to: Models.Project
  defdelegate update_project(client, project_number, project_attrs), to: Models.Project
  defdelegate delete_project(client, project_number), to: Models.Project

  defdelegate create_supplier(client, supplier_attrs), to: Models.Supplier
  defdelegate list_suppliers(client, query), to: Models.Supplier
  defdelegate stream_suppliers(client, query), to: Models.Supplier
  defdelegate get_supplier(client, supplier_number), to: Models.Supplier
  defdelegate update_supplier(client, supplier_number, supplier_attrs), to: Models.Supplier
  defdelegate delete_supplier(client, supplier_number), to: Models.Supplier

  defdelegate create_supplier_invoice(client, supplier_invoice_attrs), to: Models.SupplierInvoice
  defdelegate list_supplier_invoices(client, query), to: Models.SupplierInvoice
  defdelegate stream_supplier_invoices(client, query), to: Models.SupplierInvoice
  defdelegate get_supplier_invoice(client, supplier_invoice_number), to: Models.SupplierInvoice
  defdelegate update_supplier_invoice(client, supplier_invoice_number, supplier_invoice_attrs),
              to: Models.SupplierInvoice
  defdelegate delete_supplier_invoice(client, supplier_invoice_number), to: Models.SupplierInvoice

  defdelegate create_terms_of_delivery(client, terms_of_delivery_attrs), to: Models.TermsOfDelivery
  defdelegate list_terms_of_deliverys(client, query), to: Models.TermsOfDelivery
  defdelegate stream_terms_of_deliverys(client, query), to: Models.TermsOfDelivery
  defdelegate get_terms_of_delivery(client, terms_of_delivery_code), to: Models.TermsOfDelivery
  defdelegate update_terms_of_delivery(client, terms_of_delivery_code, terms_of_delivery_attrs), to: Models.TermsOfDelivery
  defdelegate delete_terms_of_delivery(client, terms_of_delivery_code), to: Models.TermsOfDelivery

  defdelegate create_terms_of_payment(client, terms_of_payment_attrs), to: Models.TermsOfPayment
  defdelegate list_terms_of_payments(client, query), to: Models.TermsOfPayment
  defdelegate stream_terms_of_payments(client, query), to: Models.TermsOfPayment
  defdelegate get_terms_of_payment(client, terms_of_payment_code), to: Models.TermsOfPayment
  defdelegate update_terms_of_payment(client, terms_of_payment_code, terms_of_payment_attrs), to: Models.TermsOfPayment
  defdelegate delete_terms_of_payment(client, terms_of_payment_code), to: Models.TermsOfPayment

  defdelegate create_unit(client, unit_attrs), to: Models.Unit
  defdelegate list_units(client, query), to: Models.Unit
  defdelegate stream_units(client, query), to: Models.Unit
  defdelegate get_unit(client, unit_number), to: Models.Unit
  defdelegate update_unit(client, unit_number, unit_attrs), to: Models.Unit
  defdelegate delete_unit(client, unit_number), to: Models.Unit

  defdelegate create_way_of_delivery(client, way_of_delivery_attrs), to: Models.WayOfDelivery
  defdelegate list_way_of_deliverys(client, query), to: Models.WayOfDelivery
  defdelegate stream_way_of_deliverys(client, query), to: Models.WayOfDelivery
  defdelegate get_way_of_delivery(client, way_of_delivery_code), to: Models.WayOfDelivery
  defdelegate update_way_of_delivery(client, way_of_delivery_code, way_of_delivery_attrs), to: Models.WayOfDelivery
  defdelegate delete_way_of_delivery(client, way_of_delivery_code), to: Models.WayOfDelivery
end
