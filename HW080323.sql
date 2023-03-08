Напишите следующие запросы к MongoDB (БД "bank"):
(1) найти ко-во завершенных транзакций не в евро на сумму более 100
(2) для всех пользователей не из Китая и не из Испании увеличить баланс на 20%
(3) разблокировать пользователей, у которых баланс больше нуля или премиальный статус
(4) найти пользователей из Китая, которые заблокированы и имеют нулевой баланс
(5) пользователям не из Китая и не из США, имеющим баланс более 5000, установить статус премиум
(6) Проанализируйте след/запросы

db.users.find(
    {
      '$nor': [
          {'country': 'China'},
          {'balance': {'$lt': 100}}
      ]
    }
)
// Данный запрос найдет все пользователи, у которых страна не Китай или баланс больше или равен 100


db.users.find(
    {
        'country': {'$ne': 'China'},
        'balance': {'$gte': 100}
    }
)
//Этот запрос ищет пользователей не из Китая с балансом в банке не менее 100.


Конспект занятия
https://western-appeal-39b.notion.site/GenTech-Mar-2-2023-b034686de2f346faa812884ef8f3185e 



///////////////////////////////


(1) db.transactions.find({"currency": {$ne: "EUR"}, "amount": {$gt: 100}}).count()

(2) db.users.updateMany({"country": {$nin: ["China", "Spain"]}}, {$inc: {"balance": 0.2}})

(3) db.users.updateMany( {$or: [ {balance: {$gt: 0}}, {premium: true} ]}, {$set: {locked:false}} )

(4) db.users.find( {country: 'China', locked: true, balance: 0} ).count()

(5) db.users.updateMany( {country: {$nin: ['China', 'USA']}, balance: {$gt: 5000} }, {$set: {premium: true}} )



