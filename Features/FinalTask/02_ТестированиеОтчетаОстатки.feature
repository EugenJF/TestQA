﻿#language: ru

@tree

Функционал: Тестирование отчета Остатки

Как Тестировщик я хочу
проверить формирование основного варианта отчета Остатки
чтобы проверить корректность получаемых с его помощью данных

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	
Сценарий: _0802 Подготовка данных для тестирования отчета
	Когда Загрузка тестовых данных для отчета Остатки
	И я выполняю код встроенного языка на сервере
		|'Документы.ПриходТовара.НайтиПоНомеру("000000029").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
        |'Документы.ПриходТовара.НайтиПоНомеру("000000043").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
        |'Документы.ПриходТовара.НайтиПоНомеру("000000046").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.РасходТовара.НайтиПоНомеру("000000007").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: _0803 Тестирование отчета Остатки
	И я закрываю все окна клиентского приложения
* Тестирование отчета Остатки	
	И В командном интерфейсе я выбираю 'Товарные запасы' 'Остатки товаров'
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	И в таблице "СписокНастроек" я перехожу к строке:
		| 'Представление'                      |
		| 'Основной'                           |
	И в таблице "СписокНастроек" я выбираю текущую строку
	И из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Значение" я выбираю точное значение 'Veko67NE'
	И из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Значение" я выбираю точное значение 'Большой'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду когда в табличном документе 'Результат' заполнится ячейка 'R6C1' в течение 20 секунд
    Дано Табличный документ "Результат" равен макету "ОстаткиТоваров" по шаблону

* Завершение сценария
	И я закрываю все окна клиентского приложения
