Описание занятия: В рамках БД 'chat' с помощью SQL напишите запрос, который вывеадет информацию о чатах  (КТО С КЕМ ОБЩАЕТСЯ), отсортированных по дате посл/сообщения

Конспект занятия
https://western-appeal-39b.notion.site/GenTech-Feb-16-2023-0f9ea59d231649cfa707a0d9227ac5d0 


SELECT 
    messages.chat_id,                                      
    t1.fullname as user1,                                     // отправитель/пользователь 1
    t2.fullname as user2,                                     // получатель /пользователь 2
    messages.created_at                                       // дата публикации
    
FROM 
    messages
    JOIN users t1 ON messages.user1_id = u1.user_id 
    JOIN users t2 ON messages.user2_id = u2.user_id 
  
GROUP BY 
    messages.chat_id 
ORDER BY  
    messages.created_at desc



   
