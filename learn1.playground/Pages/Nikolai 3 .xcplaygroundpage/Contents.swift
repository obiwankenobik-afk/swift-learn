//MARK: Задание 1. Напишите функцию, которая принимает на вход два целых числа и выводит в консоль, равны они или нет. Должны выполняться следующие условия: Если первое число равно второму числу, надо вывести в консоль слово «равно». Если первое число больше второго, то вывести слово «больше». Если первое число меньше, то вывести слово «меньше».

//через if else
func equalityNumber(_ firstNumber: Int, _ secondNumber: Int) -> String {
    if firstNumber == secondNumber {
        "Числа равны"
    }
    else if firstNumber > secondNumber {
        "Первое число больше"
    }
    else {
        "Первое число меньше"
    }
}

var firstComparison = equalityNumber(2, 1)
print(firstComparison)

//через case
func equalityNumber2(_ firstNumber: Int, _ secondNumber: Int) -> String {
    switch (firstNumber, secondNumber) {
    case let (a, b) where a == b:
        "Числа равны"
    case let (a, b) where a > b:
        "Первое число больше"
    default:
        "Первое число меньше"
    }
    
}

var secondComparison = equalityNumber2(3, 4)
print(secondComparison)

//через guard
func equalityNumber3(_ firstNumber: Int,_ secondNumber: Int) -> String {
    guard firstNumber == secondNumber else {
        guard firstNumber > secondNumber else {
            return "Первое число меньше"
        }
        return "Первое число больше"
    }
    return "Числа равны"
}

var thirdNumber = equalityNumber3(1, 1)
print(thirdNumber)

//MARK: Задание 2. Напишите функцию func summ(toValue: Int), которая посчитает и выведет сумму всех нечётных чисел от 1 до заданного числа. Для определения нечётного числа нужно использовать оператор остатка от целочисленного деления %. Если остаток от деления на 2 не равен 0, это число нечётное. let result = summ(toValue: 100) print(result) Вывод в консоль: 2500

func summ(toValue: Int) -> Int {
    var sum = 0
    for number in 1...toValue {
        if number % 2 != 0 {
            sum += number
        }
    }
    return sum
}
let result = summ(toValue: 100)
print(result)

//MARK: Задание 3. Напишите функцию, которая будет принимать целое число, а выводить все целые числа, квадраты которых меньше или равны переданному параметру. Квадрат числа — это результат умножения числа на самого себя. Например, 9 — это квадрат числа 3. n = 10 вывод в консоль: 1 2 3

func numbersSquares(_ value: Int) {
    var number = 1
    while value >= number * number {
        print(number)
        number += 1
    }
}

numbersSquares(10)

//MARK: Задание 4. Напишите функцию func handleDiceRoll(result: Int) для обработки значений одного брошенного кубика с помощью оператора switch. На вход функция получает число от 1 до 6 включительно. Если значение 1, 2 или 3, нужно вывести в консоль слово «проигрыш». Если значение 4, 5 или 6 — слово «победа».

func handleDiceRoll(_ result: Int) {
    switch result {
    case 1...3:
        print("Проигрыш")
    case ..<1:
        print("Введено неверное значение, введите число от 1 до 6")
    case 7...:
        print("Введено неверное значение, введите число от 1 до 6")
    default:
        print("Победа")
    }
}

handleDiceRoll(-1)
