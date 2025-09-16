//
//  main.swift
//  Lession5
//
//  Created by Oleg Konstantinov on 16.09.2025.
//

import Foundation

//MARK: -  Простой уровень
/*
  1 - Сумма чисел
  Функция принимает массив чисел [Int] и возвращает их сумму.
  Пример: [1, 2, 3] → 6
 */

func sumOfIntegers(in arr: [Int]) -> Int {
    arr.reduce(0, +)
}

let array = sumOfIntegers(in: [1, 2, 3])
print(array)

/*
 2 - Подсчет четных
 Функция принимает массив [Int], возвращает количество четных чисел.
 Пример: [1, 2, 3, 4] → 2
 */
func sumOfEven(in arr: [Int]) -> Int {
    arr.filter{ $0 % 2 == 0 }.count
}

let arr = sumOfEven(in: [1, 2, 3, 4])
print(arr)

/*
 3 - Словарь длин слов
 Функция принимает массив слов [String], возвращает словарь [String: Int], где ключ — слово, значение — длина слова.
 Пример: ["hi", "swift"] → ["hi": 2, "swift": 5]
 */

func makeDict(from array: [String]) -> [String: Int] {
    var dictionary: [String: Int] = [:]
    
//    array.forEach { dictionary[$0] = $0.count }

    for word in array {
        dictionary[word] = word.count
    }
    
    return dictionary
}

let wordsArray = makeDict(from: ["hi", "swift"])
print(wordsArray)

//MARK: -  Средний уровень

/*
 1 - Подсчет количества повторений
 Функция принимает массив чисел [Int], возвращает словарь [Int: Int], где ключ — число, значение — сколько раз оно встречается.
 Пример: [1, 2, 2, 3, 1] → [1: 2, 2: 2, 3: 1]
 */

func makeDict(from array: [Int]) -> [Int: Int] {
    var dictionary: [Int: Int] = [:]
//    array.forEach { dictionary[$0, default: 0] += 1 } // Мне больше нравится этот вариант))

    for value in array {
//        dictionary[value, default: 0] += 1 // Если использовать этот метод, то можно обойтись без развертывания опционала, что
//        избавит нас от опционалов и значительно сократит код

//        блок if-else, также можно делать для принудительного развертывания опционала, но это увеличивает код
        if dictionary[value] != nil {
            dictionary[value]! += 1
        } else {
            dictionary[value] = 1
        }
    }
    
    return dictionary
}
let intArray = makeDict(from: [1, 2, 2, 3, 1])
print(intArray)

/*
 2 - Слияние массивов без дубликатов
 Функция принимает два массива [String] и возвращает массив без повторяющихся элементов.
 Пример: ["a", "b", "c"], ["b", "c", "d"] → ["a", "b", "c", "d"]
 */
func merge(from fristArray: [String], and secondArray: [String]) -> [String] {
    Set(fristArray).union(secondArray).sorted()
}

let mergeArray = merge(from: ["a", "b", "c"], and: ["b", "c", "d"])
print(mergeArray)

/*
 3 - Самое частое слово
 Функция принимает массив слов [String] и возвращает слово, которое встречается чаще всего.
 Если таких слов несколько — вернуть любое.
 Пример: ["apple", "banana", "apple", "orange"] → "apple"
 */

//Вариант 1
func words(with array: [String]) -> String {
    var dict: [String: Int] = [:]
    
    for item in array {
        dict[item, default: 0] += 1
    }
    
    guard let element = (dict.first { $0.value == dict.values.max() }?.key) else { return "Отсутсвуют значения" }
    
return element

}
let dictWords = words(with: ["apple", "banana", "apple", "orange", "orange"])
print(dictWords)

//Вариант 2
func transform(array: [String]) -> [String: Int] {
    var dict: [String: Int] = [:]
    
    for item in array {
        dict[item, default: 0] += 1
    }
    
    return dict
}

func mostFrequency(in array: [String]) -> String {
    let items = transform(array: array)
    
    guard let item = items.first(where: { $0.value == items.values.max() })?.key else { return "Введен неверный массив" }
    
    return item
}
let word = mostFrequency(in: ["apple", "banana", "apple", "orange", "orange"])
print(dictWords)


//Вариант 3
//Допустим, у нас есть несколько слов, которые одинаково часто встречаются. Тогда можно создать функцию, которая возращает массив данных
func mostFrequencies(in array: [String]) -> [String] {
    let items = transform(array: array)
    
    return items.filter({ $0.value == items.values.max() }).map { $0.key }
}

let arrayofWords = mostFrequencies(in: ["apple", "banana", "apple", "orange", "orange"])
print(arrayofWords)
