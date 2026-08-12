create index idx_churn on customer_churn(churn);
create index idx_contract on customer_churn(contract);

create index idx_tenure on customer_churn(tenure);
create index idx_payment on customer_churn(payment_method);
create index idx_internet on customer_churn(internet_service);