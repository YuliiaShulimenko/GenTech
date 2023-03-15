В рамках БД "bank" напишите следующие запросы:

(1) вывести размеры EURO-транзакций из ЕВРОПЫ в долларах
(2) вывести количество USD-транзакций из 'China'
(3) вывести три самых больших транзакции в 'usd'
(4) вывести всех незаблокированных пользователей, у которых есть завершенные (is_completed) транзакции от 10 usd 
(5) найти пользователей без транзакций



(1) db.transactions.find({currency: "EURO", from_country: "EUROPE"}).project({amount_in_usd : "$amount_in_usd"})
(2) db.transactions.find({currency: "USD", from_country: "China" }).count()
(3) db.transactions.find({currency: "USD"}).sort({amount: -1}).limit(3)
(4) db.users.find({blocked: false, "transactions.is_completed": true, "transactions.amount_in_usd":{$gte: 10}})
(5) db.users.find({transactions: {$size: 0}})
