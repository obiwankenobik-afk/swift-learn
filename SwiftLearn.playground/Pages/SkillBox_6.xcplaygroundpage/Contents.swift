//MARK: Задание 1
//Дана структура Person:
//struct Person {
//     var name: String
//     var age: Int
//     func getAgeComparisonString(_ p: Person) -> String {
         // Ваш код должен быть здесь
//Допишите метод в структуре Person, который сравнивает возраст.
// Должны выполняться следующие условия:
//1. Формат строки со сравнением:
//{Имя другого человека} {старше меня / моложе меня / такого же возраста, как я}.
//     2. Ваш код должен работать следующим образом:
// p1 = Person("Антон", 24)
// p2 = Person("Андрей", 36)
// p3 = Person("Ольга", 24)
// p1.getAgeComparisonString(p2) ➞ "Андрей старше меня"
// p2.getAgeComparisonString(p1) ➞ "Антон младше меня"
// p1.getAgeComparisonString(p3) ➞ "Ольга такого же возраста, как и я"

//MARK: Задание 2
//Добавьте в структуру Person ленивое свойство, которое возвращает человека в виде строки следующего формата {Имя} {Возраст} {года/лет}.
//p1 = Person("Антон", 24)
//p1.info -> Антон 24 года

// p2 = Person("Андрей", 36)
// p2.info -> Андрей 36 лет

struct Person {
    var name: String
    var age: Int
    lazy var info: String = "\(self.name) \(self.age) года"
    func getAgeComparisonString(_ p: Person) -> String {
        if p.age > self.age {
            return "\(p.name) старше меня"
        } else if p.age < self.age {
            return "\(p.name) младше меня"
        } else {
            return "\(p.name) такого же возраста, как и я "
        }
    }
}
var p1 = Person(name: "Антон", age: 24)
var p2 = Person(name: "Андрей", age: 36)
var p3 = Person(name: "Ольга", age: 24)

p1.getAgeComparisonString(p2)
p2.getAgeComparisonString(p1)
p1.getAgeComparisonString(p3)

p1.info
p2.info
p3.info

//MARK: Задание 3
//Создайте класс Hero. Добавьте свойство «количество жизней» — lifeCount. Количество жизней задаётся при создании героя в инициализаторе. Добавьте метод «попадание», который уменьшает количество жизней, — hit().

//MARK: Задание 4
//Добавьте в класс Hero вычисляемое свойство, жив или нет герой, — isLive. Если количество жизней больше 0, то возвращает true, в остальных случаях false.

//MARK: Задание 5
//Поставьте модификатор доступа private рядом с переменной «количество жизней» в классе Hero, чтобы менять количество жизней можно было только с помощью метода hit().

//MARK: Задание 6
//Отнаследуйтесь от класса Hero, создав дочерний класс SuperHero. Переопределите метод «попадание» для нового класса так, чтобы SuperHero не получал повреждения.

class Hero {
    private var lifeCount: Int
    init(lifeCount: Int) {
        self.lifeCount = lifeCount
    }
    var isLive: Bool {
        return lifeCount > 0
    }
    
    func hit() {
        self.lifeCount -= 1
    }
}

class SuperHero: Hero {
    override func hit() {
        print("Герой неуязвим")
    }
}

let axe = Hero(lifeCount: 2)
axe.hit()
axe.isLive
axe.hit()
axe.isLive
let deathProphet = SuperHero(lifeCount: 5)
deathProphet.hit()


