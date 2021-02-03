defmodule FortnoxEx do
  @moduledoc """
  Documentation for `FortnoxEx`.

  API calls are rate limited with Fuse for 200 calls per minute. Should the rate limiting be blown, then the
  rate limiter will refresh in 60 seconds. If the rate limiter is hit, then the result of any api call
  will be {:error, :unavailable}
  """

  alias FortnoxEx.Utils
  alias FortnoxEx.Models.{AbsenceTransaction, Account, Article, AttendanceTransaction, Contract, Customer, Employee,
                          Invoice, Offer, Order, Project, Supplier, SupplierInvoice}

  defdelegate get_access_token(client_secret, authorization_code), to: Utils
  defdelegate client(client_secret, access_token), to: Utils

  defdelegate create_absence_transaction(client, absence_transaction_attrs), to: AbsenceTransaction
  defdelegate list_absence_transactions(client, query), to: AbsenceTransaction
  defdelegate stream_absence_transactions(client, query), to: AbsenceTransaction
  defdelegate get_absence_transaction(client, absence_transaction_number), to: AbsenceTransaction
  defdelegate update_absence_transaction(client, absence_transaction_number, absence_transaction_attrs),
              to: AbsenceTransaction
  defdelegate delete_absence_transaction(client, absence_transaction_number), to: AbsenceTransaction

  defdelegate create_account(client, account_attrs), to: Account
  defdelegate list_accounts(client, query), to: Account
  defdelegate stream_accounts(client, query), to: Account
  defdelegate get_account(client, account_number), to: Account
  defdelegate update_account(client, account_number, account_attrs), to: Account
  defdelegate delete_account(client, account_number), to: Account

  defdelegate create_article(client, article_attrs), to: Article
  defdelegate list_articles(client, query), to: Article
  defdelegate stream_articles(client, query), to: Article
  defdelegate get_article(client, article_number), to: Article
  defdelegate update_article(client, article_number, article_attrs), to: Article
  defdelegate delete_article(client, article_number), to: Article

  defdelegate create_attendance_transaction(client, attendance_transaction_attrs), to: AttendanceTransaction
  defdelegate list_attendance_transactions(client, query), to: AttendanceTransaction
  defdelegate stream_attendance_transactions(client, query), to: AttendanceTransaction
  defdelegate get_attendance_transaction(client, attendance_transaction_number), to: AttendanceTransaction
  defdelegate update_attendance_transaction(client, attendance_transaction_number, attendance_transaction_attrs),
              to: AttendanceTransaction
  defdelegate delete_attendance_transaction(client, attendance_transaction_number), to: AttendanceTransaction

  defdelegate create_contract(client, contract_attrs), to: Contract
  defdelegate list_contracts(client, query), to: Contract
  defdelegate stream_contracts(client, query), to: Contract
  defdelegate get_contract(client, contract_number), to: Contract
  defdelegate update_contract(client, contract_number, contract_attrs), to: Contract
  defdelegate create_invoice_for_contract(client, contract_number), to: Contract
  defdelegate increase_invoice_count_for_contract(client, contract_number), to: Contract
  defdelegate finish_contract(client, contract_number), to: Contract
  defdelegate delete_contract(client, contract_number), to: Contract

  defdelegate create_customer(client, customer_attrs), to: Customer
  defdelegate list_customers(client, query), to: Customer
  defdelegate stream_customers(client, query), to: Customer
  defdelegate get_customer(client, customer_number), to: Customer
  defdelegate update_customer(client, customer_number, customer_attrs), to: Customer
  defdelegate delete_customer(client, customer_number), to: Customer

  defdelegate create_employee(client, employee_attrs), to: Employee
  defdelegate list_employees(client, query), to: Employee
  defdelegate stream_employees(client, query), to: Employee
  defdelegate get_employee(client, employee_number), to: Employee
  defdelegate update_employee(client, employee_number, employee_attrs), to: Employee
  defdelegate delete_employee(client, employee_number), to: Employee

  defdelegate create_invoice(client, invoice_attrs), to: Invoice
  defdelegate list_invoices(client, query), to: Invoice
  defdelegate stream_invoices(client, query), to: Invoice
  defdelegate get_invoice(client, invoice_number), to: Invoice
  defdelegate update_invoice(client, invoice_number, invoice_attrs), to: Invoice
  defdelegate delete_invoice(client, invoice_number), to: Invoice

  defdelegate create_offer(client, offer_attrs), to: Offer
  defdelegate list_offers(client, query), to: Offer
  defdelegate stream_offers(client, query), to: Offer
  defdelegate get_offer(client, offer_number), to: Offer
  defdelegate update_offer(client, offer_number, offer_attrs), to: Offer
  defdelegate delete_offer(client, offer_number), to: Offer

  defdelegate create_order(client, order_attrs), to: Order
  defdelegate list_orders(client, query), to: Order
  defdelegate stream_orders(client, query), to: Order
  defdelegate get_order(client, order_number), to: Order
  defdelegate update_order(client, order_number, order_attrs), to: Order
  defdelegate delete_order(client, order_number), to: Order

  defdelegate create_project(client, project_attrs), to: Project
  defdelegate list_projects(client, query), to: Project
  defdelegate stream_projects(client, query), to: Project
  defdelegate get_project(client, project_number), to: Project
  defdelegate update_project(client, project_number, project_attrs), to: Project
  defdelegate delete_project(client, project_number), to: Project

  defdelegate create_supplier(client, supplier_attrs), to: Supplier
  defdelegate list_suppliers(client, query), to: Supplier
  defdelegate stream_suppliers(client, query), to: Supplier
  defdelegate get_supplier(client, supplier_number), to: Supplier
  defdelegate update_supplier(client, supplier_number, supplier_attrs), to: Supplier
  defdelegate delete_supplier(client, supplier_number), to: Supplier

  defdelegate create_supplier_invoice(client, supplier_invoice_attrs), to: SupplierInvoice
  defdelegate list_supplier_invoices(client, query), to: SupplierInvoice
  defdelegate stream_supplier_invoices(client, query), to: SupplierInvoice
  defdelegate get_supplier_invoice(client, supplier_invoice_number), to: SupplierInvoice
  defdelegate update_supplier_invoice(client, supplier_invoice_number, supplier_invoice_attrs), to: SupplierInvoice
  defdelegate delete_supplier_invoice(client, supplier_invoice_number), to: SupplierInvoice
end
