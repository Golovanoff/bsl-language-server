#Use lib-name
#Use 1commands
// Комментарий
&Аннотация(Параметр = "Значение")
Процедура ИмяПроцедуры(Парам = 0)
    Если Истина = Истина Тогда
        
        // Комментарий
        Возврат;
    КонецЕсли;
    А = (А ИЛИ А);
    
    А = А
        И (А)
        И А = А
        ИЛИ А;
    
    А = """";
    
    Пока Истина Цикл
        А = А - 1;
    КонецЦикла;
    
КонецПроцедуры

Процедура Другая()
    А = 0;
КонецПроцедуры

Процедура Третья()
    // Комментарий с пробелами слева
    // Другой комментарий с пробелами
КонецПроцедуры
