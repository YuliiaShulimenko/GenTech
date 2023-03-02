//  1 уровень сложности: (1) Напишите запрос, который создаст транзакцию (БД БАНК) с необходимыми полями.

Конспект занятия
https://western-appeal-39b.notion.site/GenTech-Feb-23-2023-28a4e33516774f78bcf440f907cbb0c5 

db.transactions.insertOne
({
	id: 'data123',
	created_at: new Date(),
  sender_id: 'u111',
	recipient_id: 'u222',
	amount: NumberInt,
	currency: 'usd',
});

//  2 Приведите в качестве примера пять типовых бизнес-процессов, связанных с транзакциями, и соотвествующие им запросы в MongoDB

* 1 * Вывести транзакции по определенному клиенту

db.transactions.find
({ 
recipient_id: 'u222' 
});

* 2 * Подсчитать кол-во транзакций полученных определенным клиентом

db.transactions.countDocuments
({ 
recipient_id: 'u222' 
})

* 3 * Добавить в информацию о транзакции поле (done)

db.transactions.updateOne(
	{ id: 'data123' },
	{
		$set: { done: true },
	});

* 4 * Поиск всех транзакций, сумма которых превышает 2000
db.transactions.find
({
amount: 2000
})

* 5 *  Поиск всех транзакций на определенную дату:
db.transactions.find
({ 
date: { $eq: "2023-02-10" }
})

