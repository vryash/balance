# README

curl -XGET localhost:3000/users | json_pp
curl -XGET localhost:3000/users/1/invoices -d "start_date=10.10.2020&end_date=10.10.2024" | json_pp
curl -XGET localhost:3000/users/1/invoices/summary -d "start_date=10.10.2020&end_date=10.10.2024&range=tru

curl -XPOST localhost:3000/users/ -d "name=happy"
curl -XPOST localhost:3000/users/1/invoices -d "num=10&operator=inc" | json_pp
curl -XPOST localhost:3000/users/1/invoices -d "num=10&operator=dec" | json_pp
