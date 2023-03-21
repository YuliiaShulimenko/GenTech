 В рамках БД "bank" напишите след/запросы:

(1) Вывести количественное распределение товаров по поставщикам, а также общую сумму поставленных товаров.

(2) Вывести общую и среднюю продолжительность звонков по каждой теме

(3) Вывести тему звонков, по которой общались меньше всего

(4) Вывести одного пользователя, с которым общались на тему кредита дольше всего
поля: имя, продолжительность общения в часах


1) db.suppliers.aggregate([
    {
        $group: {
            _id: "$supplier",
            totalProducts: {$sum: "$products"}
        }
    }
])

2) db.calls.aggregate([
    {
        $group: {
            _id: "$topic",
            totalDuration: {$sum: "$duration"},
            avgDuration: {$avg: "$duration"}
        }
    }
])

3) db.calls.aggregate([
    {
        $group: {
            _id: "$topic",
            totalCalls: {$sum: 1}
        }
    }, {
        $sort: {totalCalls: -1}
    }, {
        $limit: 1
    }
])

4) db.calls.aggregate([
    {
        $match: {topic: "credit"}
    }, {
        $group: {
            _id: "$userName",
            totalDuration: {$sum: "$duration"}
        }
    }, {
        $sort: {totalDuration: -1}
    }, {
        $limit: 1
    }, {
        $project: {
            _id: 0,
            userName: "$_id",
            totalDuration: 1
        }
    }
])


