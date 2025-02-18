# Diagnostics structure, files contents and purpose

This article contains rules of diagnostics usage, creation and information about content templates.

- [Diagnostics structure, files contents and purpose](#%d0%a1%d1%82%d1%80%d1%83%d0%ba%d1%82%d1%83%d1%80%d0%b0-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8-%d0%bd%d0%b0%d0%b7%d0%bd%d0%b0%d1%87%d0%b5%d0%bd%d0%b8%d0%b5-%d0%b8-%d1%81%d0%be%d0%b4%d0%b5%d1%80%d0%b6%d0%b8%d0%bc%d0%be%d0%b5-%d1%84%d0%b0%d0%b9%d0%bb%d0%be%d0%b2)
  - [Diagnostics structure](#%d0%a1%d0%be%d1%81%d1%82%d0%b0%d0%b2-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8)
  - [Diagnostics implementation class](#%d0%9a%d0%bb%d0%b0%d1%81%d1%81-%d1%80%d0%b5%d0%b0%d0%bb%d0%b8%d0%b7%d0%b0%d1%86%d0%b8%d0%b8-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8)
    - [Diagnostics class, implements BSLDiagnostic interface](#%d0%9a%d0%bb%d0%b0%d1%81%d1%81-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8-%d1%80%d0%b5%d0%b0%d0%bb%d0%b8%d0%b7%d1%83%d1%8e%d1%89%d0%b8%d0%b9-%d0%b8%d0%bd%d1%82%d0%b5%d1%80%d1%84%d0%b5%d0%b9%d1%81-bsldiagnostic)
    - [Diagnostics class, inherits from AbstractDiagnostic](#%d0%9a%d0%bb%d0%b0%d1%81%d1%81-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8-%d1%83%d0%bd%d0%b0%d1%81%d0%bb%d0%b5%d0%b4%d0%be%d0%b2%d0%b0%d0%bd%d0%bd%d1%8b%d0%b9-%d0%be%d1%82-abstractdiagnostic)
    - [Diagnostics class, inherits from AbstractVisitorDiagnostic](#%d0%9a%d0%bb%d0%b0%d1%81%d1%81-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8-%d1%83%d0%bd%d0%b0%d1%81%d0%bb%d0%b5%d0%b4%d0%be%d0%b2%d0%b0%d0%bd%d0%bd%d1%8b%d0%b9-%d0%be%d1%82-abstractvisitordiagnostic)
    - [Diagnostics class, inherits from AbstractListenerDiagnostic **(Work in Progress)**](#%d0%9a%d0%bb%d0%b0%d1%81%d1%81-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8-%d1%83%d0%bd%d0%b0%d1%81%d0%bb%d0%b5%d0%b4%d0%be%d0%b2%d0%b0%d0%bd%d0%bd%d1%8b%d0%b9-%d0%be%d1%82-abstractlistenerdiagnostic-%d0%92-%d0%a0%d0%90%d0%97%d0%a0%d0%90%d0%91%d0%9e%d0%a2%d0%9a%d0%95)
  - [Diagnostics test class](#%d0%9a%d0%bb%d0%b0%d1%81%d1%81-%d1%82%d0%b5%d1%81%d1%82%d0%b0-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8)
    - [Diagnostics test](#%d0%a2%d0%b5%d1%81%d1%82-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8)
    - [Test of configuration method for parameterized diagnostics](#%d0%a2%d0%b5%d1%81%d1%82-%d0%bc%d0%b5%d1%82%d0%be%d0%b4%d0%b0-%d0%ba%d0%be%d0%bd%d1%84%d0%b8%d0%b3%d1%83%d1%80%d0%b8%d1%80%d0%be%d0%b2%d0%b0%d0%bd%d0%b8%d1%8f-%d0%b4%d0%bb%d1%8f-%d0%bf%d0%b0%d1%80%d0%b0%d0%bc%d0%b5%d1%82%d1%80%d0%b8%d0%b7%d0%be%d0%b2%d0%b0%d0%bd%d0%bd%d1%8b%d1%85-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba)
    - [Quick fixes test **(Work in progress)**](#%d0%a2%d0%b5%d1%81%d1%82-%22%d0%b1%d1%8b%d1%81%d1%82%d1%80%d1%8b%d1%85-%d0%b7%d0%b0%d0%bc%d0%b5%d0%bd%22-%d0%92-%d0%a0%d0%90%d0%97%d0%a0%d0%90%d0%91%d0%9e%d0%a2%d0%9a%d0%95)
  - [Diagnostics resources](#%d0%a0%d0%b5%d1%81%d1%83%d1%80%d1%81%d1%8b-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8)
  - [Diagnostics test resources](#%d0%a0%d0%b5%d1%81%d1%83%d1%80%d1%81%d1%8b-%d1%82%d0%b5%d1%81%d1%82%d0%b0-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8)
  - [Diagnostics description](#%d0%9e%d0%bf%d0%b8%d1%81%d0%b0%d0%bd%d0%b8%d0%b5-%d0%b4%d0%b8%d0%b0%d0%b3%d0%bd%d0%be%d1%81%d1%82%d0%b8%d0%ba%d0%b8)

## Diagnostics structure

Diagnostics consists of a set of files, which are described in detail in the sections below.  
The required set of files as part of the diagnostics at the time of this writing and the rules for their naming

- Diagnostic implementation class.                 The file name is formed according to the principle `% Diagnostic Key%` + `Diagnosctic.java`
- Diagnostics test class.                      The file name is generated according to the principle `%DiagnosticKey%` + `DiagnoscticTest.java`
- Diagnostic resource file in Russian.    The file name is formed according to the principle `%DiagnosticKey%` + `Diagnosctic_en.properties`
- Diagnostic resource file in English. The file name is formed according to the principle `%DiagnosticKey%` + `Diagnosctic_en.properties`
- Resource file (fixture) test.                The file name is formed according to the principle `%DiagnosticKey%` + `Diagnosctic.bsl`
- Diagnostic description file in Russian.   The file name is formed according to the principle `%DiagnosticKey%` + `.md`
- Diagnostic resource file in English. The file name is formed according to the principle `%DiagnosticKey%` + `.md`

**Note:**  
To create necessary files in right places, should run command `gradlew newDiagnostic --key="KeyDiagnostic"`, where `KeyDiagnostic` should be replaced with your own diagnostics key. Details in help `gradlew -q help --task newDiagnostic`.

## Diagnostics implementation class

Diagnostics is implemented by adding a java class to the `com.github._1c_syntax.bsl.languageserver.diagnostics` package in the `src/main/java` directory.

In the body of the file, you need to specify the package to which the class and the import block are added _(when using ide, the import list is updated automatically)_. It is necessary to ensure that **only** is imported that is necessary for implementation, everything unused should be **removed** _(if [settings](EnvironmentSetting.md) are correct, then ide will do everything automatically)_.

Each diagnostic must have a `@DiagnosticMetadata`, class annotation containing diagnostic metadata. The actual content can always be obtained by examining the [file](https://github.com/1c-syntax/bsl-language-server/blob/develop/src/main/java/com/github/_1c_syntax/bsl/languageserver/diagnostics/metadata/DiagnosticMetadata.java).

At the time of this writing, the following properties are available:

- The type of diagnostics is `type` and its importance is `severity`, for each diagnostics it is necessary to define them. In order to choose the correct type and importance of diagnostics, you can refer to [article](DiagnosticTypeAndSeverity.md).
- Time to fix issue `minutesToFix` (default 0). This value is used when calculating the total technical debt of the project in labor costs to correct all comments (the sum of time to correct for all detected comments). It is worth indicating the time, as realistic as possible, that the developer should spend on fixing.
- A set of diagnostics tags `tag` that indicate the group to which it belongs. Read more about tags in the [article](DiagnosticTag.md).
- Applicability limit `scope` (by default `ALL`, i.e. no limit). BSL LS supports multiple languages (oscript and bsl) and diagnostics can be applied to one specific language or to all at once.
- Default diagnostic active `activatedByDefault` (default `True`). When developing experimental, controversial, or not applicable in most projects, it is worth turning off diagnostics by default, the activation will be performed by the end user of the solution.
- Compatibility mode `compatibilityMode`, by which diagnostics are filtered when using metadata. The default is `UNDEFINED`.

The last two can be omitted.

Annotation example

```java
@DiagnosticMetadata(
  type = DiagnosticType.CODE_SMELL,
  severity = DiagnosticSeverity.MINOR,
  minutesToFix = 1,
  activatedByDefault = false,          // Deactivated by default
  scope = DiagnosticScope.BSL,         // Applicable only for BSL
  compatibilityMode = DiagnosticCompatibilityMode.COMPATIBILITY_MODE_8_3_3, // 8.3.3 compatibility mode
  tags = {
    DiagnosticTag.STANDARD             // This is a diagnosis for violation of the 1C standard
  }
)
```

Class should implement the interface `BSLDiagnostic`. If diagnostic bases on AST, that class should extends at one of classes, that implement `BSLDiagnostic` below:

- for simple diagnostics (module context checking) it is worth using inheritance `AbstractVisitor` with the implementation of a single `check` method
- if you need to analyze a visit to a node / sequence of nodes, use the `listener` strategy, you need to inherit the class from `AbstractListenerDiagnostic`
- in other cases, you need to use the strategy `visitor` and
  - `AbstractVisitorDiagnostic` for diagnostics of 1C code
  - `AbstractSDBLVisitorDiagnostic` for diagnostics of 1C query

Examples

```java
public class TemplateDiagnostic implements BSLDiagnostic
```

```java
public class TemplateDiagnostic extends AbstractDiagnostic
```

```java
public class TemplateDiagnostic extends AbstractVisitorDiagnostic
```

```java
public class TemplateDiagnostic extends AbstractListenerDiagnostic
```

```java
public class TemplateDiagnostic extends AbstractSDBLVisitorDiagnostic
```

Diagnostic may provide so-called `quick fixes`. In order to provide quick fixes the diagnostic class must implement `QuickFixProvider` interface. See this [article](DiagnosticQuickFix.md) on adding a `quick fix` to diagnostic.

Examples

```java
public class TemplateDiagnostic implements BSLDiagnostic, QuickFixProvider
```

```java
public class TemplateDiagnostic extends AbstractDiagnostic implements QuickFixProvider
```

```java
public class TemplateDiagnostic extends AbstractVisitorDiagnostic implements QuickFixProvider
```

```java
public class TemplateDiagnostic extends AbstractListenerDiagnostic implements QuickFixProvider
```

```java
public class TemplateDiagnostic extends AbstractSDBLVisitorDiagnostic implements QuickFixProvider
```

After the declaration of the class, a block with their parameters is located for parameterizable diagnostics. For details on the diagnostic parameters, see the [article](DiagnostcAddSettings.md).

Below are the differences in the implementation of diagnostic classes.

### Diagnostics class, implements BSLDiagnostic interface

В классе необходимо определить приватное поле `diagnosticStorage` типа `DiagnosticStorage`, которое будет хранилищем обнаруженных замечаний, и приватное свойство `info` типа `DiagnosticInfo`, которое будет предоставлять доступ к данным диагностики.

```java
 private DiagnosticStorage diagnosticStorage = new DiagnosticStorage(this);
private final DiagnosticInfo info;
```

In the class, you need to implement:

- метод `getDiagnostics` принимающий контекст анализируемого файла и возвращающий список обнаруженных замечаний `List<Diagnostic>`
- метод `getInfo`, возвращающий значение свойства `info`
- метод `setInfo`, для установки значения свойства `info`

Ниже приведена общая структура метода `getDiagnostics`

```java
  @Override
  public List<Diagnostic> getDiagnostics(DocumentContext documentContext) {
    // Clearing diagnostics storage
    diagnosticStorage.clearDiagnostics();

    documentContext.getComments()  // Getting the collection of tokens, here comments
      .parallelStream()
      .filter((Token t) ->         // Search for "necessary" - those that the diagnostics is aimed at detecting
        !goodCommentPattern.matcher(t.getText()).matches())
      .sequential()
      .forEach((Token t) ->        // Adding errors, here for each token a separate error
        diagnosticStorage.addDiagnostic(t));

    // Return of found
    return diagnosticStorage.getDiagnostics();
  }
```

### Diagnostics class, inherits from AbstractDiagnostic

Для простых диагностик стоит наследовать класс своей диагностики от класса AbstractDiagnostic. В классе диагностики необходимо реализовать метод `check` - он должен проанализировать контекст документа и, при наличии замечаний, добавить диагностику в `diagnosticStorage`.

Example:

```java

  @Override
  protected void check() {
    documentContext.getTokensFromDefaultChannel()
      .parallelStream()
      .filter((Token t) ->
        t.getType() == BSLParser.IDENTIFIER &&
          t.getText().toUpperCase(Locale.ENGLISH).contains("Ё"))
      .forEach(token -> diagnosticStorage.addDiagnostic(token));
  }
```

### Diagnostics class, inherits from AbstractVisitorDiagnostic

В классе диагностики необходимо реализовать методы всех соответствующих `визитеров AST`, в соответствии грамматикой языка, описанной в проекте [BSLParser](https://github.com/1c-syntax/bsl-parser/blob/master/src/main/antlr/BSLParser.g4).  Полный список существующих методов-визитеров находится в классе `BSLParserBaseVisitor`. Необходимо обратить внимание, что для упрощения добавлены `обобщенные` визитеры, например вместо реализации `visitFunction` для функции и `visitProcedure` для процедуры можно использовать `visitSub`, обобщающий работу с методами.

В качестве параметра, в каждый метод визитера передается узел AST соответствующего типа. В теле метода необходимо проанализировать узел и/или его дочерние узлы и принять решение о наличии замечания. При обнаружении проблемы, необходимо добавить замечание в хранилище `diagnosticStorage` _(поле уже определено в абстрактном классе)_. Замечания может быть привязано как непосредственно к переданному узлу, так и к его дочерним или родительским узлам, к нужному блоку кода.

Примерная структура метода

```java
  @Override
  public ParseTree visitModuleVar(BSLParser.ModuleVarContext ctx) {                 // Visitor for module variables
    if(Trees.findAllRuleNodes(ctx, BSLParser.RULE_compilerDirective).size() > 1) {  // Finding child nodes
      diagnosticStorage.addDiagnostic(ctx);                                         // Adding a error to the entire site
    }
    return ctx;
  }
```

Если диагностика **не предусматривает** анализ вложенных блоков, то она должна возвращать переданный входной параметр, в противном случае необходимо вызвать аналогичный `super-метод`.  
Следует внимательно относиться к этому правилу, т.к. оно позволит сэкономить ресурсы приложения не выполняя бессмысленный вызов.

Examples:

- Диагностика для метода или файла должна сразу возвращать значение, т.к. вложенных методов / файлов не существует
- Диагностика для блока условия или области должна вызывать `super-метод`, т.к. они существуют и используются (например `return super.visitSub(ctx)` для методов)

### Diagnostics class, inherits from AbstractSDBLVisitorDiagnostic

В классе диагностики необходимо реализовать методы всех соответствующих `визитеров AST`, в соответствии грамматикой языка запросов, описанной в проекте [BSLParser](https://github.com/1c-syntax/bsl-parser/blob/master/src/main/antlr/SDBLParser.g4).  Полный список существующих методов-визитеров находится в классе `SDBLParserBaseVisitor`.

Остальные правила использования идентичны `AbstractVisitorDiagnostic`.

### Diagnostics class, inherits from AbstractListenerDiagnostic **(Work in Progress)**

_**<В разработке>**_

## Diagnostics test class

При написании тестов используется фреймворк [JUnit5](https://junit.org/junit5/), для утверждений - библиотека [AssertJ](https://joel-costigliola.github.io/assertj/), предоставляющая [текучий/fluent-интерфейс](https://ru.wikipedia.org/wiki/Fluent_interface) "ожиданий", подобно привычной многим библиотеке [asserts](https://github.com/oscript-library/asserts) для [OneScript](http://oscript.io/).

Теста реализуется посредством добавления java-класса в пакет `com.github._1c_syntax.bsl.languageserver.diagnostics` в каталоге `src/test/java`.

В теле файла, нужно указать пакет, в который добавлен класс и блок импорта _(аналогично классу реализации диагностики)_.  
В файле необходимо создать одноименный файлу класс, унаследованый от класса `AbstractDiagnosticTest` для созданного класса диагностики.

Test class example

```java
package com.github._1c_syntax.bsl.languageserver.diagnostics;

import org.eclipse.lsp4j.Diagnostic;
import com.github._1c_syntax.bsl.languageserver.utils.Ranges;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

class TemplateDiagnosticTest extends AbstractDiagnosticTest<TemplateDiagnostic> {

    TemplateDiagnosticTest() {
        super(TemplateDiagnostic.class);
    }
}
```

Для добавления нового теста в созданный класс, необходимо добавить процедуру, аннотированную как тест `@Test`.

В тестовом классе обязательно должны присутствовать методы для тестирования

- тест диагностики, самой по себе
- тест метода конфигурирования для параметризованных диагностик
- тест "быстрых замен" при их наличии

### Diagnostics test

Упрощенно, тест диагностики состоит из следующих шагов

- получение списка замечаний диагностики
- проверка количества срабатываний
- проверка местоположения срабатываний

Первый шагом необходимо получить список замечаний диагностики вызовом метода `getDiagnostics()` _(реализован в классе `AbstractDiagnosticTest`)_. При вызове этого метода будет выполнен анализ файла ресурса диагностики и возвращен список замечаний в нем.  
Следующим шагом необходимо, с помощью утверждения `hasSize()` убедиться, что замечаний зафиксированно столько, сколько допущенно в фикстурах.  
После этого, необходимо удостовериться, что замечания обнаружены верно, для чего нужно сравнить область замечания, полученную методом `getRange()`, с ожидаемой областью _(стоит использовать класс `RangeHelper` для упрощения формирования контрольнх значений)_.  
В случае использования шаблонного текста сообщения об ошибке замечания, необходимо в тесте проверить и его, получив текст сообщения об ошибке методом `getMessage()` диагностики.

Test method example

```java
    @Test
    void test() {
      List<Diagnostic> diagnostics = getDiagnostics();   // getting a list of diagnostics

      assertThat(diagnostics).hasSize(2);                // checking the number of errors found

      // verification of special cases
      assertThat(diagnostics)
        .anyMatch(diagnostic -> diagnostic.getRange().equals(Ranges.create(27, 4, 27, 29)))
        .anyMatch(diagnostic -> diagnostic.getRange().equals(Ranges.create(40, 4, 40, 29)));
    }
```

Для упрощена написания тестов, сокращения объема кода, можно использовать хелпер `util.Assertions.assertThat` и тогда пример выше будет выглядеть следующим образом:

```java
    @Test
    void test() {
      List<Diagnostic> diagnostics = getDiagnostics();   // getting a list of diagnostics

      assertThat(diagnostics).hasSize(2);                // checking the number of errors found

      // проверка частных случаев
      assertThat(diagnostics, true)
        .hasRange(27, 4, 27, 29)
        .hasRange(40, 4, 40, 29);
    }
```

### Test of configuration method for parameterized diagnostics

Тесты для метода конфигурирования должны покрывать все возможные варианты настроек и их комбинаций. Тест имеет практически ту же структуру, что и тест диагностики, за исключение установки параметров диагностики перед получением спсика замечаний.  
Перед установкой новых значений параметров диагностики, необходимо получить настройки диагностики по умолчанию методом `getDefaultDiagnosticConfiguration()`, используя информацию текущего объекта диагностики `diagnosticInstance.getInfo()`. Полученный результат представляет собой соответствие, в котором, методом `put`, необходимо изменить значения нужных параметров. Применение измененных настроек выполняется методом `configure()` текущего объекта диагностики `diagnosticInstance`.

Test method example

```java
    @Test
    void testConfigure() {
        // получение настроек диагностики по умолчанию
        Map<String, Object> configuration = diagnosticInstance.getInfo().getDefaultDiagnosticConfiguration();

        configuration.put("templateParem", "newValue");     // установка параметру "templateParem" значения "newValue"
        diagnosticInstance.configure(configuration);        // применение настроек

        List<Diagnostic> diagnostics = getDiagnostics();    // получение списка замечаний диагностики

        assertThat(diagnostics).hasSize(2);                 // проверка количества обнаруженных замечаний

        // проверка частных случаев
        assertThat(diagnostics, true)
          .hasRange(27, 4, 27, 29)
          .hasRange(40, 4, 40, 29);
    }
```

### Quick fixes test **(Work in progress)**

_**<В разработке>**_

## Diagnostics resources

BSL LS поддерживает два языка в диагностиках: русский и английский, поэтому в состав диагностики входит два файла ресурсов, располагаемых в каталоге `src/main/resources` в пакете `com.github._1c_syntax.bsl.languageserver.diagnostics`, по одному для каждого языка. Структура файлов одинакова: это текстовый файл в UTF-8 кодировки, каждая строка которого содержит пару "Ключ=Значение".

Обязательные параметры, используемые при добавлении замечания по диагностике методам `diagnosticStorage.addDiagnostic`

- diagnosticMessage - diagnostic message. Значение поддерживает параметризацию (см `String.format`)
- diagnosticName - Diagnostic name, human-readable

Для `быстрых исправлений` применяется параметр `quickFixMessage`, содержащий описание действия-исправления.

## Diagnostics test resources

В качестве фикстур используется содержимое ресурсного файла теста, расположенного в каталоге `src/test/resources` в пакете `diagnostics`. Файл должен содержать необходимые примеры кода на языке 1С _(или oscript)_.  
Необходимо добавлять как ошиочный, так и корректный код, **помечая с помощью комментариев места, где диагностика должна зафиксировать замечания, а где нет**. Лукчше всего, если тестовые примеры будут `реальиными`, из практики, а не синтетическими, придуманными `под диагностику`.

## Diagnostics description

Описание диагностики создается в формате [Markdown](https://ru.wikipedia.org/wiki/Markdown) в двух вариантах - для русского и английчского языков. Файлы с описанием располагаются в каталоге `docs/diagnostics` для русского языка, для английского в `docs/diagnostics`.  
Файл в общем случае описания имеет следующую структуру

- Заголовок, равный значению `diagnosticName` из файла ресурса диагностики соответствующего языка
- Описание параметров диагностики при их наличии
- Тело с описанием диагностики, указанием "почему так плохо"
- Исключительные ситуации, когда диагностика не детектирует замечание
- Examples of good and bad code
- Algorithm of diagnostics for complex
- Ссылки на источники, если диагностика является реализацией стандарта (например на [ИТС](https://its.1c.ru)).

Кроме непосредственно создания файлов описания диагностики, необходимо обновлять индекс-файлы `index.md` для каждого языка, добавляя диагностику в таблицу реализованных.
