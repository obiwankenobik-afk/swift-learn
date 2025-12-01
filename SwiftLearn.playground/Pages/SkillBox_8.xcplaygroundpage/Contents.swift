//MARK: Задание 1
//Объявите три сущности, которые реализует предоставленный вам протокол. После этого для всех сущностей вызовите все методы и свойства, объявленные в протоколе.
//Протокол:
//protocol CalorieCountProtocol {
//     var calories: Int { get }
//     func description() -> String
//}Должны выполняться следующие условия:
// 1. Объявлены класс, структура и перечисления enum, которые реализует данный протокол.
// 2. Реализация протокола может быть любой.
// 3. Вызваны все свойства и методы протокола у каждого экземпляра из пункта 1.
// 4. Задание сделано без изменения протокола.

protocol CalorieCountProtocol {
    var calories: Int { get }
    func description() -> String
}

final class Food: CalorieCountProtocol {
    var calories: Int
    private var food: String
    
    init(calories: Int, food: String) {
        self.calories = calories
        self.food = food
    }
    
    func description() -> String {
        "в этом \(food) столько калорий: \(calories)"
    }
}

var apple = Food(calories: 100, food: "Яблоко")
apple.description()

struct Product: CalorieCountProtocol {
    var calories: Int
    var product: String
    
    func description() -> String {
        "в этом '\(product)' столько калорий: \(calories)"
    }
}

var product = Product(calories: 403, product: "Биг мак")
product.description()

enum FoodType: CalorieCountProtocol {
case apple, pizza, burger
    var calories: Int {
        switch self {
        case .apple:
            return 50
        case .pizza:
            return 1000
        case .burger:
            return 500
        }
    }
    
    func description() -> String {
        switch self {
        case .apple:
            "В яблоке мало калорий"
        case .pizza:
            "В пицце много калорий"
        case .burger:
            "В бургере не мало калорий"
        }
    }
}

let pizza = FoodType.pizza
pizza.calories
pizza.description()

//MARK: Задание 2
//Поработайте с протоколом Equatable, который нужен для сравнения сущностей.
//Вам предоставлены структура и класс, которые нужно сравнить. Добавьте в объявление этих сущностей протокол Equatable. При необходимости реализуйте недостающий метод.
//
//Структура:
//enum BalanceType {
//    case positive, negative, neutral
//}
//
//struct Balance {
//    let type: BalanceType
//    let amount: Int
//}Класс:
//class BalanceObject {
//    var amount: Int = 0
//}
//Должны выполняться следующие условия:
// 5. Структура и класс реализуют протокол Equatable.
// 6. Проведена проверка, что протокол реализуется. Для этого сравните экземпляры этих сущностей с помощью оператора ‘==’.

enum BalanceType {
    case positive, negative, neutral
}

struct Balance: Equatable {
    let type: BalanceType
    let amount: Int
}

final class BalanceObject: Equatable {
    var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    static func == (lhs: BalanceObject, rhs: BalanceObject) -> Bool {
        lhs.amount == rhs.amount
    }
}

let firstBalance = Balance(type: .positive, amount: 10)
let secondBalance = Balance(type: .negative, amount: 10)
let firstBalanceObject = BalanceObject(amount: 10)
let secondBalanceObject = BalanceObject(amount: 10)

print(firstBalance == secondBalance)
print(firstBalanceObject == secondBalanceObject)

//MARK: Задание 3
//Вам дан протокол и три сущности, которые его реализуют. Добавьте в протокол новый метод. Реализуйте этот метод с помощью расширения протокола. Создайте массив из этих сущностей и вызовите в цикле новый метод у каждого элемента массива.
//Код:
//protocol Dog {
//    var name: String { get set }
//    var color: String { get set }
//}
//
//struct Haski: Dog {
//    var name: String
//    var color: String
//}
//
//class Corgi: Dog {
//    var name: String
//    var color: String
//
//    init(name: String, color: String) {
//        self.name = name
//        self.color = color
//    }
//}
//
//struct Hound: Dog {
//    var name: String
//    var color: String
//}
//Должны выполняться следующие условия:
// 7. В протокол добавлен метод func speak() -> String.
// 8. Реализация метода из пункта 1 сделана с помощью расширения.
// 9. Создан массив, содержащий как минимум один экземпляр каждой сущности.
// 10. У каждого элемента массива вызван новый метод.
//

protocol Dog {
    var name: String { get set }
    var color: String { get set }
    func speak() -> String
}

extension Dog {
    func speak() -> String {
        "Гав гав"
    }
}

struct Haski: Dog {
    var name: String
    var color: String
}

final class Corgi: Dog {
    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

struct Hound: Dog {
    var name: String
    var color: String
}

let haski = Haski(name: "Bobik", color: "White")
let corgi = Corgi(name: "Boba", color: "Orange")
let hound = Hound(name: "Biba", color: "Black")
let dogs: [Dog] = [haski, corgi, hound]

dogs[0].speak()
dogs[1].speak()
dogs[2].speak()

