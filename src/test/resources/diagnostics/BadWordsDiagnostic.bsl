// при наличии в списке запрещенных слов "лотус/шмотус"

Запрос = Новый Запрос;
Запрос.Текст = "ВЫБРАТЬ ПЕРВЫЕ 1
|   Лотус.Ссылка КАК Узел                               //тут должно сработать
|ИЗ
|   ПланОбмена.ДиспетчерЛотус КАК Лотус";               //тут должно сработать дважды

// получаем узел лотуса                                 //в комментарии НЕ должно сработать
УзелШмотуса = Запрос.Выполнить().Выгрузить()[0].Ссылка;  //тут должно сработать
