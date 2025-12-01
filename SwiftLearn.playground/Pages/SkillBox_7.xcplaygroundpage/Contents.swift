//MARK: Задание 1. Создайте класс животного Animal.У животного должны быть характеристики: энергия, вес, текущий возраст, максимальный возраст, имя. Энергия, вес, максимальный возраст и имя должны инициализироваться через конструктор. Добавьте вычисляемое свойство isTooOld — Boolean. Оно должно сравнивать текущий возраст с максимальным и возвращать true, если текущий возраст равен или больше максимального. Животное может спать, питаться и передвигаться. Во время сна: Энергия животного увеличивается на 5, а возраст — на 1. В консоль выводится сообщение: «${имя животного} спит». Во время питания: Энергия животного увеличивается на 3, а вес — на 1. Возраст животного может увеличиться на 1. В консоль выводится сообщение: «${имя животного} ест». Во время передвижения: Энергия животного уменьшается на 5, а вес — на 1. Возраст животного может увеличиться на 1. В консоль выводится сообщение: «${имя животного} передвигается». Случайное увеличение возраста реализуйте с помощью класса Bool и его метода random() if (Bool.random()) { //увеличить возраст. Вынесите случайное увеличение возраста в метод — tryIncrementAge. Если животное слишком старое, если не хватает веса или энергии для совершения действия, то ничего не происходит. Животное может производить потомство. Имя и максимальный возраст у рождённого животного такие же, как и у родителя. Энергия для рождённого животного устанавливается случайно в диапазоне от 1 до 10. Вес для рождённого животного устанавливается случайно в диапазоне от 1 до 5. В консоль должно выводиться сообщение о том, какое животное было рождено и какие у него характеристики.

class Animal {
    var energy: Int
    var weight: Int
    var currentAge: Int = 0
    var maxAge: Int
    var name: String
    var certainMove = "передвигается"
    
    var isTooOld: Bool {
        currentAge >= maxAge
    }
    
    init(energy: Int, weight: Int, maxAge: Int, name: String) {
        self.energy = energy
        self.weight = weight
        self.maxAge = maxAge
        self.name = name
    }
    
    enum CustomError: Error {
        case tooOld, lowEnergy, lowWeight
        var errorDescription: String {
            switch self {
            case .tooOld:
                "Животное слишком старое"
            case .lowEnergy:
                "Животное слишком устало"
            case .lowWeight:
                "Животное слишком голодное"
            }
        }
    }
    
    func sleep() {
        guard let _ = try? validate() else { return }
        energy += 5
        currentAge += 1
        print("\(name) спит")
    }
    
    func eating() {
        guard let _ = try? validate() else { return }
        energy += 3
        weight += 1
        tryIncrementAge()
        print("\(name) ест")
    }
    
    func move() throws -> Bool {
        guard let _ = try? validate() else { return false }
        energy -= 5
        weight -= 1
        tryIncrementAge()
        print("\(name) \(certainMove)")
        return true
    }
    
    func love() -> Animal?  {
        guard let _ = try? validate() else { return nil }
        let randomEnergy = Int.random(in: 1...10)
        let randomWeight = Int.random(in: 1...5)
        print("Поздравляем! У \(name) родился ребенок: \(name). Вес ребенка: \(randomWeight), энергия ребенка: \(randomEnergy), возраст ребенка: \(currentAge), максимальное время жизни: \(maxAge)")
        return Animal(energy: randomEnergy, weight: randomWeight, maxAge: maxAge, name: name)
    }
    
    func tryIncrementAge() {
        if Bool.random() {
            currentAge += 1
        }
    }
    
    private func validate() throws {
        guard !isTooOld else {
            print(CustomError.tooOld.errorDescription)
            throw CustomError.tooOld
        }
        guard energy >= 5 else {
            print(CustomError.lowEnergy.errorDescription)
            throw CustomError.lowEnergy
        }
        guard weight >= 1 else {
            print(CustomError.lowWeight.errorDescription)
            throw CustomError.lowWeight
        }
    }
}

var cat = Animal(energy: 10, weight: 10, maxAge: 30, name: "Barsik")

try cat.move()
print(cat.currentAge)
cat.eating()
print(cat.currentAge)
cat.sleep()
print(cat.currentAge)
var newCat = cat.love()
newCat?.sleep()
newCat?.eating()

//MARK: Задание 2. Создайте наследников класса Animal: Bird, Fish, Dog. В каждом из наследников переопределите функцию, отвечающую за передвижение. Для каждого наследника в этой функции необходимо вызвать родительскую реализацию и дополнительно вывести в консоль сообщение: энергия, вес, для Bird — «летит», для Fish — «плывет», для Dog — «бежит». Добейтесь, чтобы дополнительное сообщение выводилось только если выполнилась родительская реализация. В каждом из наследников переопределите функцию, отвечающую за рождение потомка. Класс Fish должен возвращать объект класса Fish. Аналогично с Bird и Dog.

final class Bird: Animal {
    override func move() throws -> Bool {
        certainMove = "летит"
        let moved = try super.move()
        
        if moved {
            print("Энергия птички: \(energy), вес птички: \(weight)")
        }
        return moved
    }
    
    override func love() -> Bird? {
        guard let animal = super.love() else {
            return nil
        }
        return Bird(energy: animal.energy, weight: animal.weight, maxAge: animal.maxAge, name: animal.name)
    }
}

final class Fish: Animal {
    override func move() throws -> Bool {
        certainMove = "плывет"
        let moved = try super.move()
        
        if moved {
            print("Энергия рыбки: \(energy), вес рыбки: \(weight)")
        }
        return moved
    }
    
    override func love() -> Fish? {
        guard let animal = super.love() else {
            return nil
        }
        return Fish(energy: animal.energy, weight: animal.weight, maxAge: animal.maxAge, name: animal.name)
    }
}

final class Dog: Animal {
    override func move() throws -> Bool {
        certainMove = "бежит"
        let moved = try super.move()
        
        if moved {
            print("Энергия собаки: \(energy), вес собаки: \(weight)")
        }
        return moved
    }
    
    override func love() -> Dog? {
        guard let animal = super.love() else {
            return nil
        }
        return Dog(energy: animal.energy, weight: animal.weight, maxAge: animal.maxAge, name: animal.name)
    }
}

final class Cat: Animal {
    override func move() throws -> Bool {
        certainMove = "бежит"
        let moved = try super.move()
        
        if moved {
            print("Энергия кота: \(energy), вес кота: \(weight)")
        }
        return moved
    }
    
    override func love() -> Cat? {
        guard let animal = super.love() else {
            return nil
        }
        return Cat(energy: animal.energy, weight: animal.weight, maxAge: animal.maxAge, name: animal.name)
    }
}

//Птички проверка
var redBird = Bird(energy: 10, weight: 10, maxAge: 10, name: "Гоша")
try redBird.move()
var yellowBird = redBird.love()

//Рыбки проверка
var yellowFish = Fish(energy: 10, weight: 10, maxAge: 10, name: "Полосатик")
try yellowFish.move()
var redFish = yellowFish.love()
redFish?.sleep()

//Собачки проверка
var blackDog = Dog(energy: 10, weight: 10, maxAge: 10, name: "Бобик")
try blackDog.move()
var whiteDog = blackDog.love()
whiteDog?.sleep()

//Коты проверка
var blackCat = Cat(energy: 10, weight: 10, maxAge: 10, name: "Барсик")
try blackCat.move()
var whiteCat = blackCat.love()
whiteCat?.sleep()

//MARK: Задание 3. Создайте класс NatureReserve, который представляет из себя заповедник с разными животными. Инициализируйте заповедник. Изначально в нём должно быть пять птиц, три рыбы, две собаки и несколько обычных животных. По желанию: создайте дополнительные виды животных и добавьте их в заповедник. Напишите программу, которая имитирует жизненный цикл животных в заповеднике. В течение ограниченного числа итераций N каждое животное делает одно случайное действие, которое позволяют сделать его свойства: ест, спит, двигается, рожает. Когда у животного рождается детёныш, он добавляется к общему количеству животных заповедника. В конце итерации все животные, у которых возраст превысил максимальный, удаляются из заповедника. По окончании работы должно выводиться число животных в заповеднике, которые остались живы. Если все животные исчезли — программа должна прерываться, с выводом соответствующего сообщения.

final class NatureReserve {
    var zoo: [Animal] = []
    
    init(zoo: [Animal]) {
        self.zoo = zoo
    }
    
    init() {
        creatingZoo()
    }
    
    private func creatingZoo() {
        for bird in 1...5 {
            zoo.append(Bird(energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: Int.random(in: 2...4), name: "Птичка \(bird)"))
        }
        for fish in 1...3 {
            zoo.append(Fish(energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: Int.random(in: 3...4), name: "Рыбка \(fish)"))
        }
        for dog in 1...2 {
            zoo.append(Dog(energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: Int.random(in: 3...4), name: "Собака \(dog)"))
        }
        for animal in 1...4 {
            zoo.append(Animal(energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: Int.random(in: 3...4), name: "Животное \(animal)"))
        }
    }
    
    private func statistics() {
        var birdCount = 0
        var fishCount = 0
        var dogCount = 0
        var catCount = 0
        var animalCount = 0
        
        for animals in zoo {
            switch animals {
            case is Bird:
                birdCount += 1
            case is Fish:
                fishCount += 1
            case is Dog:
                dogCount += 1
            case is Cat:
                catCount += 1
            default:
                animalCount += 1
            }
        }
        print("Общее количество животных в заповеднике: \(zoo.count), из них птиц: \(birdCount), рыб: \(fishCount), собак: \(dogCount), котов: \(catCount), остальных животных: \(animalCount)")
    }
    
    func simulationCicleZoo(iterations: Int) {
        let helpArrayZoo = zoo
        
        for iteration in 1...iterations {
            if zoo.isEmpty {
                print("Все животные умерли на \(iteration) итерации")
                break
                
            }
            for animal in helpArrayZoo {
                let randomAction = Int.random(in: 1...4)
                switch randomAction {
                case 1:
                    animal.sleep()
                case 2:
                    animal.eating()
                case 3:
                    do {
                        try animal.move()
                    } catch {
                        print("\(animal.name) не может продолжать путь: \(error)")
                    }
                case 4:
                    if let child = animal.love() {
                        zoo.append(child)
                    }
                default:
                    break
                }
            }
            zoo = zoo.filter{ !$0.isTooOld }
            statistics()
            print("Количество итераций: \(iterations)")
        }
    }
}

//добавляю котов
let natureReserve = NatureReserve()
for cat in 1...3 {
    natureReserve.zoo.append(Cat(energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: Int.random(in: 3...4), name: "Кот \(cat)"))
}

//добавляю рыбку c птичкой
natureReserve.zoo.append(Fish(energy: 10, weight: 10, maxAge: 3, name: "Золотая рыбка"))
natureReserve.zoo.append(Bird(energy: 3, weight: 3, maxAge: 2, name: "Кеша"))
natureReserve.simulationCicleZoo(iterations: 10)

//MARK: Задание 4. Сделать Систему Боя Животных (Arena)** Сделай: •    класс Arena •    туда добавляются животные •    каждую итерацию случайные два животных дерутся •    урон случайный •    если у животного 0 энергии → оно падает •    победитель получает +energy, +weight •    проигравший удаляется из списка

final class Arena {
    var participants: [Animal] = []
    var firstHitEnergy: Int = 0
    var firstHitWeight: Int = 0
    var secondHitEnergy: Int = 0
    var secondHitWeight: Int = 0
    var bonusWeight: Int = 0
    var bonusEnergy: Int = 0
    
    init() {
        creatingFighter()
    }
    
    init(participants: [Animal]) {
        self.participants = participants
    }
    
    private func creatingFighter(){
        for bird in 1...5 {
            participants.append(Bird(energy: Int.random(in: 5...20), weight: Int.random(in: 1...5), maxAge: 50, name: "Птичий воин \(bird)"))
        }
        for dog in 1...5 {
            participants.append(Dog(energy: Int.random(in: 5...20), weight: Int.random(in: 1...5), maxAge: 50, name: "Пёс воин \(dog)"))
        }
        for fish in 1...5 {
            participants.append(Fish(energy: Int.random(in: 5...20), weight: Int.random(in: 1...5), maxAge: 50, name: "Рыба воин \(fish)"))
        }
        for cat in 1...5 {
            participants.append(Cat(energy: Int.random(in: 5...20), weight: Int.random(in: 1...5), maxAge: 50, name: "Воин каджит \(cat)"))
        }
    }
    
    private func creatingHit() -> (firstHitEnergy: Int, firstHitWeight: Int, secondHitEnergy: Int, secondHitWeight: Int, bonusWeight: Int, bonusEnergy: Int) {
        return (
        Int.random(in: 1...5), Int.random(in: 0...2),
        Int.random(in: 1...5), Int.random(in: 0...2),
        Int.random(in: 2...4), Int.random(in: 3...5)
        )
    }
    
       private func pickFighters() -> (Animal, Animal) {
           let firstFighter = participants.randomElement()!
           var secondFighter = participants.randomElement()!
           while firstFighter === secondFighter {
               secondFighter = participants.randomElement()!
           }
           return (firstFighter, secondFighter)
       }

       private func makingHit(firstFighter: Animal, secondFighter: Animal, hit: (firstHitEnergy: Int, firstHitWeight: Int, secondHitEnergy: Int, secondHitWeight: Int, bonusWeight: Int, bonusEnergy: Int)) {
           //первый бьет
           secondFighter.energy -= hit.firstHitEnergy
           secondFighter.weight -= hit.firstHitWeight
           secondFighter.tryIncrementAge()
           //второй бьет
           firstFighter.energy -= hit.secondHitEnergy
           firstFighter.weight -= hit.secondHitWeight
           firstFighter.tryIncrementAge()
       }
    
    private func removeDead() -> [Animal] {
           let dead = participants.filter { $0.energy <= 0 || $0.weight <= 0 }
           participants.removeAll { $0.energy <= 0 || $0.weight <= 0 }
           return dead
       }
    
       private func applyWinnerBonus(firstFighter: Animal, secondFighter: Animal, dead: [Animal], hit: (firstHitEnergy: Int, firstHitWeight: Int, secondHitEnergy: Int, secondHitWeight: Int, bonusWeight: Int, bonusEnergy: Int)) {
           if dead.contains(where: { $0 === firstFighter }) {
               secondFighter.energy += hit.bonusEnergy
               secondFighter.weight += hit.bonusWeight
           } else if dead.contains(where: { $0 === secondFighter }) {
               firstFighter.energy += hit.bonusEnergy
               firstFighter.weight += hit.bonusWeight
           }
       }

       private func battleOneRound() {
           guard participants.count >= 2 else { return }
           let (first, second) = pickFighters()
           let hit = creatingHit()
           makingHit(firstFighter: first, secondFighter: second, hit: hit)
           let dead = removeDead()
           applyWinnerBonus(firstFighter: first, secondFighter: second, dead: dead, hit: hit)
       }

       func battleRound(rounds: Int) {
           for _ in 1...rounds {
               if participants.count < 2 { break }
               battleOneRound()
           }
           if participants.isEmpty {
               print("Все бойцы мертвы.")
           } else {
               print("Победитель арены: \(participants[0].name) — энергия \(participants[0].energy), вес \(participants[0].weight)")
           }
       }
   }

let arena = Arena()
arena.battleRound(rounds:100)
