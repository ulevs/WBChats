import UIKit

import Foundation
//Цель: закрепить полученные знания о хешировании, Dictionary, Set, Linked List
//1. Напишите функцию на Swift, которая принимает строку и возвращает её хеш, используя встроенную функцию hash().
//2. Придумайте и реализуйте собственную простую хеш-функцию для строк.
//3. Set:
//Создайте множество (set) из целых чисел.
//Добавьте несколько элементов в это множество.
//Удалите один элемент.
//Проверьте, существует ли определенный элемент в множестве.
//Примените операции объединения, пересечения и разности на множествах
//4. Dictionary:
//Создайте словарь, где ключами будут строки (названия городов), а значениями — целые числа (их население).
//Добавьте несколько пар ключ-значение в словарь.
//Удалите одну пару ключ-значение.
//Обновите значение для одного из ключей.
//Получите значение для одного из ключей.
//Отправка результатов:
//
//Создайте отдельный файл Swift для каждого задания.
//Комментируйте код, чтобы объяснить вашу логику.
//Отправьте все файлы на проверку через GitHub в формате Pull Request


// Функция принимает строку и возвращает её хеш
//func hashString(_ input: String) -> Int {
//    return input.hashValue
//}
// Функция принимает строку и возвращает её хеш
//func hashString(_ input: String) -> Int {
//    return input.hash
//}
// Функция принимает строку и возвращает её хеш
func hashString(_ input: String) -> String {
    return String(input.hash)
}

// Пример использования функции
let myString = "Hello, World!"
let hashValue = hashString(myString)
print("Hash value for '\(myString)' is \(hashValue)")

// File: CustomHashFunction.swift

// Простая хеш-функция, которая возвращает хеш-значение строки.
func customHashString(_ input: String) -> String {
    var hash = ""
    for char in input {
        hash += String((char.asciiValue ?? 1) % 5)
    }
    return hash
}

// Пример использования функции
let myString2 = "Hello, World!"
let customHashValue = customHashString(myString2)
print("Custom hash value for '\(myString2)' is \(customHashValue)")

// File: SetOperations.swift

// Создание множества из целых чисел
var numberSet: Set<Int> = [1, 2, 3, 4, 5]

// Добавление элементов в множество
numberSet.insert(6)
numberSet.insert(7)

// Удаление одного элемента
numberSet.remove(3)
print("Number set without 3: \(numberSet)")

// Проверка, существует ли элемент в множестве
print("Does the element 4 exist in the set? \(numberSet.contains(4))")

// Операции объединения, пересечения и разности
let anotherSet: Set<Int> = [4, 5, 6, 7, 8, 9]

//let unionSet = numberSet.union(anotherSet)
//let intersectionSet = numberSet.intersection(anotherSet)
//let differenceSet = numberSet.subtracting(anotherSet)

print("Union of sets: \(numberSet.union(anotherSet))")
print("Intersection of sets: \(numberSet.intersection(anotherSet))")
print("Difference of sets: \(numberSet.subtracting(anotherSet))")


// File: DictionaryOperations.swift


// Создание словаря, где ключами будут строки (названия городов), а значениями — целые числа (их население)
var cityPopulation: [String: Int] = ["Moscow": 12615279, "Saint Petersburg": 5383890, "Novosibirsk": 1620162]

// Добавление нескольких пар ключ-значение в словарь
cityPopulation["Ekaterinburg"] = 1484456
cityPopulation["Nizhny Novgorod"] = 1259017

// Удаление одной пары ключ-значение
cityPopulation.removeValue(forKey: "Novosibirsk")

// Обновление значения для одного из ключей
cityPopulation["Moscow"] = 12620000

// Получение значения для одного из ключей
if let population = cityPopulation["Saint Petersburg"] {
    print("The population of Saint Petersburg is \(population)")
}

// Печать обновленного словаря
print("Updated city population dictionary: \(cityPopulation)")
