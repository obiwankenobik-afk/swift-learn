//MARK: Задание 1. Напишите функцию, которая принимает в качестве параметра массив целых чисел Int (как отрицательных, так и положительных) и возвращает массив, в котором каждое число меньше 0 заменено на 0, а сам массив отсортирован так, чтобы все элементы со значением, равным 0, были в начале. Примечание. Пример создания случайного числа для заполнения массива: let randomInt = Int.random(in: -10...10), где −10...10 — диапазон, в пределах которого будет сгенерированное число.

var emptyArray: [Int] = []
for _ in 1...10 {
    let randomInt = Int.random(in: -10...10)
    emptyArray.append(randomInt)
}

func firstZeroReplaceAndSort(_ array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for number in array {
        if number < 0 {
            newArray.append(0)
        } else {
            newArray.append(number)
        }
    }
    return newArray.sorted()
}

print(firstZeroReplaceAndSort(emptyArray))

//через map

func secondZeroReplaceAndSort(_ array: [Int]) -> [Int] {
    let newArray = array.map { $0 < 0 ? 0 : $0 }
    return newArray.sorted()
}

var secondResultArray = secondZeroReplaceAndSort(emptyArray)
print(secondResultArray)

//MARK: Задание 2. Напишите функцию, которая принимает в качестве параметра массив и возвращает его в обратном порядке.

func reversedArray(_ array: [Int]) -> [Int] {
    array.reversed()
}

print(reversedArray([1, 5, 3, 73, 64, 7, 3, 0]))

//MARK: Задание 3. Напишите функцию, которая принимает в качестве параметров целое число и замыкание и вызывает внутри себя замыкание для проверки значения. Напишите замыкание, которое принимает в качестве параметра целое число и затем печатает в консоль название месяца, порядковый номер которого соответствует переданному параметру. Например: если передаётся 1, печатается «январь», 2 — «февраль». Если число выходит за рамки номеров месяцев, то должно печататься: «Такого месяца не бывает». Вызовите функцию, передав в неё значения для проверки.

let monthArray = ["январь",  "февраль", "март", "апрель", "май", "июнь", "июль", "август", "сентябрь", "октябрь", "ноябрь", "декабрь"]

func checkNumber(_ number: Int, completion: (Int) -> Void) {
    completion(number)
}

let numberMonth = { (number: Int) in
    if number >= 1 && number <= 12 {
        print(monthArray[number - 1])
    } else {
        print ("Такого месяца не бывает")
    }
}

checkNumber(1, completion: numberMonth)

//MARK: Задание 4. Напишите функцию, которая принимает в качестве параметров массив целых чисел и замыкание из задания 3. Внутри функции напишите код, где для каждого элемента в массиве вызывается передаваемое замыкание методом forEach(). Если передаётся пустой массив, то печатается «Месяцев нет».

func numberClosed(_ numbers: [Int], completion: (Int) -> Void) {
    if numbers.isEmpty {
        print("Месяцев нет")
    } else {
        numbers.forEach {
            completion($0)
        }
    }
}

numberClosed([], completion: numberMonth)

//MARK: Задание 5. Создайте пустое множество строк fruits и добавьте в него фрукты: orange, apple, banana, grapefruit. Создайте множество redFood из элементов apple, tomato, grapefruit, strawberry. Найдите с помощью операций над множествами множества красных фруктов, множество красных продуктов, но не фруктов, и множество всей еды, кроме красных фруктов.

var fruits: Set<String> = ["orange", "apple", "banana", "grapefruit"]

var redFood: Set<String> = ["apple", "tomato", "grapefruit", "strawberry"]

let redFruits = fruits.intersection(redFood)
let redFoodNoFruits = redFood.subtracting(fruits)
let foodNoRedFruits = redFood.symmetricDifference(fruits)

//MARK: Задание 6. Напишите две функции, которые принимают в качестве параметра массив, удаляют из него дубликаты и возвращают массив с уникальными значениями. Первая функция не должна использовать свойства множеств для удаления дубликатов, вторая функция — должна.

// без использования множеств
func firstArrayNoDuplicate(_ array: [Int]) -> [Int] {
    var arrayNoDuplicate: [Int] = []
    for number in array {
        if !arrayNoDuplicate.contains(number) {
            arrayNoDuplicate.append(number)
        }
    }
    return arrayNoDuplicate
}

var arrayNoSort = [1,4,3,3,3,2,2,7,6,1,1,2]

print(firstArrayNoDuplicate(arrayNoSort))


//с использованием множест

func secondArrayNoDuplicate(_ array: [Int]) -> [Int] {
    Array(Set(array))
}

print(secondArrayNoDuplicate(arrayNoSort))

