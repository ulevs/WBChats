import Foundation

// Пример использования функции hashString, внутри которой используется встроенная функция hash().
let myString = "Hello, my name is Ulyana, invite me for an intership please"
let hashValue = hashString(myString)
print("Hash value for '\(myString)' is \(hashValue)")

// Пример использования функции customHashValue, внутри которой реализована собственная хеш-функция для строк
let customHashValue = customHashString(myString)
print("Custom hash value for '\(myString)' is \(customHashValue)")

// Пример использования операций с множеством
var checkSetOperstion = SetOperation()
print(checkSetOperstion)
checkSetOperstion.insert(5, 6, 7)
checkSetOperstion.delete(4)
checkSetOperstion.checkElement(3)

let anotherSet: Set = [4, 5, 6, 7, 8, 9]

checkSetOperstion.union(with: anotherSet)
checkSetOperstion.intersection(with: anotherSet)
checkSetOperstion.difference(with: anotherSet)

// Пример использования операций со словарём
var checkDictionary = DictionaryOperation()
print(checkDictionary.cityPopulation)
checkDictionary.insert(["Ekaterinburg": 1484456, "Nizhny Novgorod": 1259017])
checkDictionary.delete("Moscow")
checkDictionary.update("Saint Petersburg", 5400000)

