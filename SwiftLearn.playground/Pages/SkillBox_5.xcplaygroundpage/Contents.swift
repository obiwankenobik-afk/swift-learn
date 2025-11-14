//MARK: Задание 1. Мы можем воспользоваться массивом строк [String], чтобы по номеру дня недели получать название дня недели: let days = [“Monday”, “Tuesday”, “Wednesday”, “Thursday”, “Friday”, “Saturday”, “Sunday”]. day[0] — первый день недели. Теперь нам нужно получить по названию дня недели его номер. Реализуйте словарь, который позволит это сделать.

//через заполнение словаря

let daysOfTheWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let numberOfDays = [0, 1, 2, 3, 4, 5, 6]
var weekDictionary: [String: Int] = [:]
for i in 0..<numberOfDays.count {
    weekDictionary[daysOfTheWeek[i]] = numberOfDays[i]
}

if let resultWeekDay = weekDictionary["Friday"] {
    print(resultWeekDay)
}

//вариант через зипку

var zipDir = zip(daysOfTheWeek, numberOfDays)
var secondWeekDictionary = Dictionary(uniqueKeysWithValues: zipDir)

if let secondResultWeekDay = secondWeekDictionary["Monday"] {
    print(secondResultWeekDay)
}

//MARK: Задание 2. С помощью итерирования по созданному словарю выведите названия всех дней недели и их номера. Вывод должен осуществляться в консоль. Пример вывода: «Четверг — 4».

for (day, number) in secondWeekDictionary {
    print(day, "-", number)
}

//MARK: Задание 3. Создайте словарь, который будет представлять собой базу данных паролей пользователей. По строке имени пользователя мы будем хранить строку с паролем. Добавьте в этот словарь три любые записи.

let passwordAndUser = ["James": "james032", "Mary": "mary2004", "Kate": "katyashka69"]

//MARK: Задание 4 .enum CustomError: Error, LocalizedError { case invalidPassword - var errorDescription: String? { - switch self { -case .invalidPassword: - "Неправильный пароль" - } - } -}. Выше приведён код, в котором объявляется новый тип ошибки с помощью enum. Добавьте в него ещё два случая ошибки. Назовите их userNotFound и invalidUsername. Не забудьте добавить описание ошибок для новых случаев в соответствующий метод. Ошибка invalidUsername должна иметь ассоциированное значение — некорректный символ в имени пользователя.

enum CustomError: Error {
    case invalidPassword
    case userNotFound
    case invalidUsername
    case LocalizedError
    var errorDescription: String? {
        switch self {
        case .invalidPassword:
            "Неправильный пароль"
        case .userNotFound:
            "Пользователь не найден"
        case .invalidUsername:
            "Введен запрещенный символ"
        case .LocalizedError:
            "Вы вошли"        }
    }
    
}


//MARK: Задание 5. Напишите функцию обработки имени пользователя и пароля. Функция должна принимать два аргумента и, если такая запись в базе данных отсутствует или имя пользователя неверное, выбрасывать соответствующую ошибку. invalidUsername должна иметь ассоциированное значение — некорректный символ в имени пользователя.

func validation(_ user: String, _ password: String, _ passAndUs: [String: String]) -> CustomError {
    let banSymbols = "*"
    let userNames = passAndUs.keys
    let passwords = passAndUs.values
    if user.contains(banSymbols) {
        return .invalidUsername
    } else if !userNames.contains(user) {
        return .userNotFound
    } else if !passwords.contains(password) {
        return .invalidPassword
    }
    return .LocalizedError
}
let result = validation("James", "james032", passwordAndUser)
print(result.errorDescription ?? "")

//MARK: Задание 6. Напишите код обработки ошибки из функции в задании 5. Выведите описание ошибки, если она произошла, а иначе выведите сообщение, что вход в систему успешно осуществлён. Обработку ошибки сделайте двумя способами: С помощью конструкции do-catch. С помощью try?.

//try?

func firstValidationForSixth(_ user: String, _ password: String, _ passAndUs: [String: String]) throws -> CustomError {
    let banSymbols = "*"
    let userNames = passAndUs.keys
    let passwords = passAndUs.values
    if user.contains(banSymbols) {
        throw CustomError.invalidUsername
    } else if !userNames.contains(user) {
        throw CustomError.userNotFound
    } else if !passwords.contains(password) {
        throw CustomError.invalidPassword
    } else {
        return CustomError.LocalizedError
    }
}

let firstResult = try? firstValidationForSixth("Kate", "katyashka619", passwordAndUser)

//do-catch

do {
    let secondResult = try firstValidationForSixth("Kate", "katyashka619", passwordAndUser)
} catch {
    print("Пожалуйста, исправь эту ошибку: \(error)")
}


