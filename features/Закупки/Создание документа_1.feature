﻿#language: ru

@tree

Функционал: Поступление товара 

Как Администратор я хочу
Создание документа поступление номенклатуры
чтобы поставить товар на учет


Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документов Поступление номенклатуры
//создание
*Открытие формы создания документов
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Склад" "Поступление номенклатуры"
	Тогда открылось окно 'Поступление номенклатуры'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление номенклатуры (создание)'
*Заполнение шапки документа
	И я нажимаю кнопку выбора у поля с именем "Организация"
	Тогда открылось окно 'Организации'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление номенклатуры (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Склад"
	Тогда открылось окно 'Склады'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление номенклатуры (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'               |
		| '00-000003' | 'ООО "Воронежская керамика"' |
*Заполнение табличной части товары
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление номенклатуры (создание) *'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыПодборНоменклатурыВыдачи'
	Тогда открылось окно 'Подбор номенклатуры выдачи'
	И в таблице "ПодобраннаяНоменклатура" я нажимаю на кнопку с именем 'ПодобраннаяНоменклатураПеренестиВДокумент'
	Тогда открылось окно 'Поступление номенклатуры (создание) *'

*Проверка заполнения табличной части 
		Тогда таблица "Товары" содержит строки:
		| 'N' | 'Характеристика номенклатуры' | 'Номенклатура выдачи'             | 'Количество' | 'Документ выдачи' | 'Цена' | 'Сумма' | 'Заказ поставщику' |
		| '1' | ''                            | 'Шапка трикотажная полушерстяная' | '1,000'      | ''                | ''     | ''      | ''                 |
	И я нажимаю на кнопку "Записать"
*Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
*Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление номенклатуры (создание) *' в течение 20 секунд
*Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |
	
Сценарий: Проверка наличия в справочнике номенклатуры шапка трикотажная полушерстяная
И В командном интерфейсе я выбираю 'Склад' 'Номенклатура выдачи'
Тогда открылось окно 'Номенклатура выдачи'
И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Шапка трикотажная полушерстяная'   |

