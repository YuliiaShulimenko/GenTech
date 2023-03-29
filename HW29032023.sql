1 уровень сложности: В рамках БД 'platform_fe' напишите следующие запросы:

//////////////////////////////// 1 /////////////////////////////////////
 Вывести ТОП-1 стран по общей сумме пожертвований (страна + общая сумма).

db.donations.aggregate([
	{
		$lookup: {
			from: 'users',
			localField: 'donator_id',
			foreignField: 'id',
			as: 'donator',
		},
	},
	{ $unwind: '$donator' },
	{
		$group: {
			_id: '$donator.country',
			total_donation: { $sum: '$amount' },
		},
	},
	{ $sort: { total_donation: -1 } },
	{ $limit: 1 },
]);


//////////////////////////////// 2 /////////////////////////////////////
 Вывести страны со средней реакцией пользователей (напр., пользователи из США имеют сред.реакцию - 4).
 
 db.users.aggregate([
  {
    $lookup: {
      from: "reactions",
      localField: "id",
      foreignField: "user_id",
      as: "user_reactions"
    }
  },
  {
      $unwind: '$user_reactions'
  },
  {
    $group: {
      _id: "$country",
      avg_reaction: { $avg: "$user_reactions.value" }
    }
  },
  {
      $sort: {'avg_reaction': -1}
  },
  {
      $project:{
          _id: 0,
          country: '$_id',
          avg_reaction: 1
      }
  }
])

//////////////////////////////// 3 /////////////////////////////////////
Вывести названия стримов без пожертвований или без реакций.

db.streams.aggregate([
    {'$lookup': {
            'from': 'donations',
            'localField': 'user_id',
            'foreignField': 'donator_id',
            'as': 'author_donat'}},
//    {'$unwind': '$author_donat'},
    {'$match': { 'amount': { '$ne': 0 } } },
    {'$group': { _id: "$author_donat.amount" } },
    {'$lookup': {
            'from': 'reactions',
            'localField': 'donator_id',
            'foreignField': 'user_id',
            'as': 'author_reactions'}},
//    {'$unwind': '$author_reactions'},
    {'$match': { 'value': { '$ne': 0 } } },
    {'$group': { _id: "$author_reactions.value" } },
    
     {'$project': {
            'stream_title': '$author_donat.fullname',
            '_id': 1 }}
])

//////////////////////////////// 4 /////////////////////////////////////
Вывести максимальный размер пожертвования для каждого стримера.

db.donations.aggregate([
	{
		$lookup: {
			from: 'streams',
			localField: 'stream_id',
			foreignField: 'id',
			as: 'stream',
		},
	},
	{ $unwind: '$stream' },
	{
		$group: {
			_id: '$stream.user_id',
			max_donation: { $max: '$amount' },
		},
	},
]);



Конспект занятия
https://western-appeal-39b.notion.site/GenTech-Mar-23-2023-453fd33457d1426a844203309e97f92f 

