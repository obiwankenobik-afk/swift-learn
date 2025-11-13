import Foundation
//MARK: переменные
let x = 111 // константа
var y = 222 // переменная


let alertMessage = "Слишком много попыток"

var defaultErrorMessage = "Ошибочка"

defaultErrorMessage = alertMessage


y *= 10


//типы
let first: Int = 32
var second: String = "Stroka"
var double: Double = 2.233


let string2: String = String(first)
var textToSnow = "Значение переменное int равно \(first)"

textToSnow = #"Тратата, чтобы выветси текст, \(int) в итоге получим \#(second)"#

let stix = """
Я вас любил: любовь ещё, быть может,
В душе моей угасла не совсем;
Но пусть она вас больше не тревожит;
Я не хочу печалить вас ничем.
Я вас любил безмолвно, безнадежно,
То робостью, то ревностью томим;
Я вас любил так искренно, так нежно,
Как дай вам Бог любимой быть другим
"""
//FIXME: исправь тут что-то
//TODO: сделай что-то
//MARK: - Control flow

let condition: Bool = true //хранит только тру и фолс

if condition {
    print ("condition is true")
}

var rowCount = 51

if rowCount > 100 {
    print("Too many rows. Update your plan")
} else{
    print("Everything is ok")
}

if rowCount > 100 {
    print("Too many rows. Update your plan")
}else if rowCount > 50 {
    print ("many 50% closed")
}else {
    print("okey")
}

let offerSale = true
let SaleWasSnown = false

// ! - not, && - and , || - or
if offerSale || SaleWasSnown {
    print("Должна появиться скидка")
}else {
    print("Cкидка уже была показана")
}

let shoppingListCount = 2
var shouldMakelittleDiscount = false
var shouldMakeLargeDiscount = false
var shouldMakeSpecialDiscount = false

if shoppingListCount != 1 {
    if shoppingListCount == 10 {
        shouldMakeSpecialDiscount = true
    } else if shoppingListCount > 10 && shoppingListCount <= 40 {
        shouldMakeLargeDiscount = true
    } else {
        shouldMakelittleDiscount = true
    }
} else {
    print ("Default client - no discount")
}


//MARK: SWITCH

let range = 70...
let range2 = ...1
let range3 = ..<1
let range4 = 30...70

var lastMessage = "Hi, how are you? Have a nice day, dear"
let lastMessageLenght = lastMessage.count
var fakeCommand = ""

switch lastMessageLenght {
case 0:
    fakeCommand = "Показать username печатает..."
case 30...:
    fakeCommand = "Обрезать строку"
default:
    fakeCommand = "Nothing"
}

switch fakeCommand {
case "Nothing":
    //print (fakeCommand)
    fallthrough
case "Обрезать строку":
    lastMessage = String(lastMessage.prefix(30)) + "..."
case let localScopeCommand where localScopeCommand.hasPrefix("Показать "):
    lastMessage = String(fakeCommand.trimmingPrefix("Показать "))
default:
    print("дефолтное поведение")
}

print(lastMessage)

//MARK: Tuple

let tuple = (fakeCommand, lastMessageLenght)


//MARK: Array

let shoppingList = ["Молоко", "Чай", "Хлеб", "Кофе"]
print(shoppingList[0])

print(shoppingList.count)
print(shoppingList.isEmpty) // проверка на пустой
print(shoppingList.contains("Чай")) // проверка на наличие заданного значения в массиве

for value in shoppingList {
    print(value)
}

for (index, item) in shoppingList.enumerated() {
    print(index)
    print(item)
}

var mutableShoppingList = shoppingList
mutableShoppingList[0] = "Яйца"
mutableShoppingList.append("Вода")

mutableShoppingList.removeLast()
mutableShoppingList.insert("Лимон", at: 0)

//создание пустых массивов
let emptyArray: [String] = []
let emptyArray2 = [String]()
let emptyArray3: Array<String> = []
let emptyArray4 = Array<String>()

//MARK: Опционалы
let value: String? = nil
let value2: Int? = 12
//print(value2)

//MARK: словари

let chat = ["title" : "Roman", "lastMessage" : "How are you?"]

print(chat["title"])

