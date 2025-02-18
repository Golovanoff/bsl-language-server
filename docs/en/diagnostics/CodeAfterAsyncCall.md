# Lines of code after the asynchronous method call (CodeAfterAsyncCall)

|     Type     | Scope | Severity |    Activated<br>by default    |    Minutes<br>to fix    |     Tags     |
|:------------:|:-----:|:--------:|:-----------------------------:|:-----------------------:|:------------:|
| `Code smell` | `BSL` | `Major`  |             `No`              |          `10`           | `suspicious` |

<!-- Блоки выше заполняются автоматически, не трогать -->
## Description
<!-- Описание диагностики заполняется вручную. Необходимо понятным языком описать смысл и схему работу -->
When using asynchronous methods, developers may write lines of code follow immediately after calling the asynchronous method. In this case, the specified lines of code are executed immediately, without waiting for the asynchronous method to execute.

For the correct solution, you need to move all the code that must be executed after the asynchronous action is completed into the export method and specify its name in the notification processing that will be called after the asynchronous action completes. Or use asynchrony through promises, for example, `Wait AlertAsync(Text);`

## Examples
<!-- В данном разделе приводятся примеры, на которые диагностика срабатывает, а также можно привести пример, как можно исправить ситуацию -->

Incorrect code
```bsl
&AtClient
Procedure Command1(Command)
	AdditionalParameters = New Structure("Result", 10);
	Notify = New NotifyDescription("AfterNumberWereInputted", AdditionalParameters.Result, 2);
	
	Message("Inputed value is " + AdditionalParameters.Result); // wrong because there will always be 10 
EndProcedure

&AtClient
Procedure AfterNumberWereInputted(Number, AdditionalParameters) Export
	If Number <> Undefined Then
		AdditionalParameters.Result = Number;
	EndIf;
EndProcedure;
```

Correct code
```bsl
&НаКлиенте
Процедура Команда1(Команда)
    ДополнительныеПараметры = Новый Структура("Результат", 10);
    Оповещение = Новый ОписаниеОповещения("ПослеВводаКоличества", ЭтотОбъект);
    ПоказатьВводЧисла(Оповещение, 1, "Введите количество", ДополнительныеПараметры.Результат, 2);

КонецПроцедуры

&НаКлиенте
Процедура ПослеВводаКоличества(Число, ДополнительныеПараметры) Экспорт
    Если Число <> Неопределено Тогда
        ДополнительныеПараметры.Результат = Число;
        Сообщить("Введенное количество равно " + ДополнительныеПараметры.Результат); // неверно, т.к. всегда будет 10
    КонецЕсли;
КонецПроцедуры;
```

In some cases, executing code immediately after calling an asynchronous method is entirely possible if you do not need to wait for the results of the asynchronous action. For example
```bsl
&НаКлиенте
Процедура Команда1(Команда)
    ПоказатьПредупреждение(, "Предупреждаю", 10);
    Сообщить("начал работать код после ПоказатьПредупреждение");
    // ...
EndProcedure
```

It is also important to consider that an asynchronous method can be called in one of the code branches and you need to analyze the subsequent code until the end of the current procedure\function. Example:
```bsl
&НаКлиенте
Процедура Команда1(Команда)
    ДополнительныеПараметры = Новый Структура("Результат", 10);
    Если Условие Тогда
        Оповещение = Новый ОписаниеОповещения("ПослеВводаКоличества", ЭтотОбъект);
        ПоказатьВводЧисла(Оповещение, 1, "Введите количество", ДополнительныеПараметры.Результат, 2);
    Иначе
        // какой-то код
    КонецЕсли;
    // последующий код также может вызываться сразу после вызова асинхронного метода, что может быть неверно

    Сообщить("Введенное количество равно " + ДополнительныеПараметры.Результат); // неверно, т.к. всегда будет 10
КонецПроцедуры
```

## Sources
<!-- Необходимо указывать ссылки на все источники, из которых почерпнута информация для создания диагностики -->
<!-- Примеры источников

* Источник: [Стандарт: Тексты модулей](https://its.1c.ru/db/v8std#content:456:hdoc)
* Полезная информация: [Отказ от использования модальных окон](https://its.1c.ru/db/metod8dev#content:5272:hdoc)
* Источник: [Cognitive complexity, ver. 1.4](https://www.sonarsource.com/docs/CognitiveComplexity.pdf) -->
- [Sync and async methods - Developers guide Chapter 4. Internal language](https://its.1c.ru/db/v8319doc#bookmark:dev:TI000001505)

## Snippets

<!-- Блоки ниже заполняются автоматически, не трогать -->
### Diagnostic ignorance in code

```bsl
// BSLLS:CodeAfterAsyncCall-off
// BSLLS:CodeAfterAsyncCall-on
```

### Parameter for config

```json
"CodeAfterAsyncCall": false
```
