//MARK: Задание 1. Создайте класс животного Animal.У животного должны быть характеристики: энергия, вес, текущий возраст, максимальный возраст, имя. Энергия, вес, максимальный возраст и имя должны инициализироваться через конструктор. Добавьте вычисляемое свойство isTooOld — Boolean. Оно должно сравнивать текущий возраст с максимальным и возвращать true, если текущий возраст равен или больше максимального. Животное может спать, питаться и передвигаться. Во время сна: Энергия животного увеличивается на 5, а возраст — на 1. В консоль выводится сообщение: «${имя животного} спит». Во время питания: Энергия животного увеличивается на 3, а вес — на 1. Возраст животного может увеличиться на 1. В консоль выводится сообщение: «${имя животного} ест». Во время передвижения: Энергия животного уменьшается на 5, а вес — на 1. Возраст животного может увеличиться на 1. В консоль выводится сообщение: «${имя животного} передвигается». Случайное увеличение возраста реализуйте с помощью класса Bool и его метода random() if (Bool.random()) { //увеличить возраст. Вынесите случайное увеличение возраста в метод — tryIncrementAge. Если животное слишком старое, если не хватает веса или энергии для совершения действия, то ничего не происходит. Животное может производить потомство. Имя и максимальный возраст у рождённого животного такие же, как и у родителя. Энергия для рождённого животного устанавливается случайно в диапазоне от 1 до 10. Вес для рождённого животного устанавливается случайно в диапазоне от 1 до 5. В консоль должно выводиться сообщение о том, какое животное было рождено и какие у него характеристики.

class Animal {
    var energy: Int
    var weight: Int
    var currentAge: Int
    var maxAge: Int = 40
    var name: String
    var childrenArray: [childAnimal] = []
    
    var isTooOld: Bool {
        currentAge >= maxAge
    }
    
    init(energy: Int, weight: Int, currentAge: Int, name: String) {
        self.energy = energy
        self.weight = weight
        self.currentAge = currentAge
        self.name = name
    }
    
    func sleep() {
        if !isTooOld {
            if energy > 0 {
                if weight > 0 {
                    energy += 5
                    currentAge += 1
                    print("\(name) спит")
                } else {
                    print("у животного недостаточно веса")
                }
            } else {
                print("у животного нет энергии")
            }
        } else {
            print("животное слишком старое")
        }
    }
    
    func eating() {
        if !isTooOld {
            if energy > 0 {
                if weight > 0 {
                    energy += 3
                    currentAge += 1
                    tryIncrementAge
                    print("\(name) ест")
                } else {
                    print("у животного недостаточно веса")
                }
            } else {
                print("у животного нет энергии")
            }
        } else {
            print("животное слишком старое")
        }
    }
    
    func move() {
        if !isTooOld {
            if energy > 5 {
                if weight > 1 {
                    energy -= 5
                    weight -= 1
                    tryIncrementAge
                    print("\(name) передвигается")
                } else {
                    print("у животного недостаточно веса")
                }
            } else {
                print("у животного нет энергии")
            }
        } else {
            print("животное слишком старое")
        }
    }
    
    enum childBirthday {
        case animal(child: childAnimal, message: String)
        case reasonNotBorn(reason: String)
        
        var description: String {
            switch self {
            case .animal(let child, let message):
                return "\(message)" + ". Вес ребенка: \(child.weight), энергия ребенка: \(child.energy), возраст ребенка: \(child.currentAge) "
            case .reasonNotBorn(let reason):
                return "Ребенок не родился по причине: \(reason)"
            }
        }
    }
    
    func sex() -> childBirthday {
        if !isTooOld {
            if energy > 5 {
                if weight > 1 {
                    energy -= 3
                    let child = childAnimal(parent: self)
                    childrenArray.append(child)
                    let message = "У \(name) родился ребенок: \(child.name)"
                    return.animal(child: child, message: message)
                } else {
                    return .reasonNotBorn(reason: "У животного недостаточный вес")
                }
            } else {
                return .reasonNotBorn(reason: "У животного недостаточно энергии")
            }
        } else {
            return .reasonNotBorn(reason: "Животное слишком старое")
        }
    }
    
    func showChildren() {
        if childrenArray.isEmpty {
            print("У \(name) нет детей")
        } else {
            print("Дети \(name):")
            for (index, child) in childrenArray.enumerated() {
                print("\(index + 1). Имя: \(child.name) \(index + 1), энергия: \(child.energy), вес: \(child.weight), возраст: \(child.currentAge)")
            }
        }
    }
    
    private func tryIncrementAge() {
        let randomIncreaseAge = Bool.random()
        if randomIncreaseAge {
            currentAge += 1
        } else {
            currentAge
        }
    }
}

final class childAnimal: Animal {
    init (parent: Animal) {
        let parentMaxAge = parent.maxAge
        let parentName = parent.name
        let childEnergy = Int.random(in: 1...10)
        let childWeight = Int.random(in: 1...5)
        let currentAge = 0
        
        super.init(energy: childEnergy, weight: childWeight, currentAge: currentAge, name: "\(parentName) младший")
    }
}

var cat = Animal(energy: 10, weight: 10, currentAge: 30, name: "Barsik")

cat.move()
print(cat.currentAge)
cat.eating()
print(cat.currentAge)
cat.sleep()
print(cat.currentAge)

let firstChildCat = cat.sex
print(firstChildCat().description)
let secondChildCat = cat.sex
print(secondChildCat().description)
cat.showChildren()

//MARK: Задание 2. Создайте наследников класса Animal: Bird, Fish, Dog. В каждом из наследников переопределите функцию, отвечающую за передвижение. Для каждого наследника в этой функции необходимо вызвать родительскую реализацию и дополнительно вывести в консоль сообщение: энергия, вес, для Bird — «летит», для Fish — «плывет», для Dog — «бежит». Добейтесь, чтобы дополнительное сообщение выводилось только если выполнилась родительская реализация. В каждом из наследников переопределите функцию, отвечающую за рождение потомка. Класс Fish должен возвращать объект класса Fish. Аналогично с Bird и Dog.

//MARK: Задание 3. Создайте класс NatureReserve, который представляет из себя заповедник с разными животными. Инициализируйте заповедник. Изначально в нём должно быть пять птиц, три рыбы, две собаки и несколько обычных животных. По желанию: создайте дополнительные виды животных и добавьте их в заповедник. Напишите программу, которая имитирует жизненный цикл животных в заповеднике. В течение ограниченного числа итераций N каждое животное делает одно случайное действие, которое позволяют сделать его свойства: ест, спит, двигается, рожает. Когда у животного рождается детёныш, он добавляется к общему количеству животных заповедника. В конце итерации все животные, у которых возраст превысил максимальный, удаляются из заповедника. По окончании работы должно выводиться число животных в заповеднике, которые остались живы. Если все животные исчезли — программа должна прерываться, с выводом соответствующего сообщения.
