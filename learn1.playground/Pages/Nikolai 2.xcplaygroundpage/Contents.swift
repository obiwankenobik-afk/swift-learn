// Задание 1. Дополните функцию nextNumber() так, чтобы она получала целое число и возвращала число, следующее за ним по порядку.

func nextNumber(number: Int) -> Int {
    return number + 1
}
nextNumber(number:5)


// Задание 2. В предыдущем задании, вы вызвали существующую функцию. В этом задании требуется сделать обратное, т.е. вам нужно по описанию вызова функции ее создать. Дан вызов функции. Превратите его в функцию, которая вызывается так: getSquare(number: 3) — и возвращает квадрат целого числа, в данном случае 9.

func getSquare(number: Int) -> Int{
    return number * number
}

let value = getSquare(number: 3)
print(value)

// Задание 3. Напишите функцию, которая получает на вход количество секунд и возвращает количество минут и оставшихся секунд. Пример: в качестве аргумента подаётся 70 секунд, тогда функция возвращает два целых числа. Первое — 1 минуту, второе — 10 секунд.

func secondReturn(_ second:Int) -> (Int, Int) {
    return (second / 60, second % 60)
}

let countSecond = secondReturn(70)
print("Количество минут \(countSecond.0), количество секунд \(countSecond.1)")

// Задание 4. Напишите функцию, которая будет конкатенировать (объединять) две строки в одну. Вызовите вашу функцию и сохраните результат в переменную. Выведите результат в консоль. Для проверки используйте константы ниже.

func linePlus (_ line1: String, _ line2: String) -> String {
    return line1 + line2
}

let string1 = "Writing Swift code "
let string2 = "is interactive and fun"
let together = linePlus(string1, string2)
print(together)
