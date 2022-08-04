﻿#language: ru

@tree

Функционал: Заказ поставщику

Как Менеджер по закупкам я хочу
зафиксировать заказанный у поставщика товар 
чтобы проанализировать разницу между заказанным и поставленным товаром 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0401 подготовительный сценарий (заказ поставщику)
//	Когда экспорт основных данных

Сценарий: _0402 проверка заполнения цены из соглашения
	* Заполнение документа Заказ поставщику
		Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
		И я нажимаю на кнопку с именем 'FormCreate'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'               |
			| 'Поставщик 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я активизирую поле "Номенклатура"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Номенклатура"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            | 'Ссылка'                  |
			| '2'   | 'Товар без характеристик' | 'Товар без характеристик' |
		И в таблице "List" я активизирую поле "Наименование"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
	* Проверка заполнения цены из соглашения	
		Тогда таблица "ItemList" содержит строки:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |
	* Изменение вида цены и проверка его перезаполнения при перевыборе партнера
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование' |
			| '4'   | 'Поставщик 2'  |
		И в таблице "List" я выбираю текущую строку	
		И я нажимаю на кнопку с именем 'FormOK'
	* Проверка заполнения цены из соглашения	
		Тогда таблица "ItemList" содержит строки:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена' |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 2' | ''     |
	* Перевыбор первого партнера и проверка перезаполнения вида цены 		
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'               |
			| 'Поставщик 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'FormOK'
	* Проверка заполнения цены из соглашения
		Тогда элемент формы с именем "Agreement" стал равен 'Соглашение с поставщиком 1'
		Тогда таблица "ItemList" содержит строки:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |
		И я закрыл все окна клиентского приложения		