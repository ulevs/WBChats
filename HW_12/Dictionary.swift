//
//  DictionaryOperations.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 06.08.2024.
//
//4. Dictionary:
//Создайте словарь, где ключами будут строки (названия городов), а значениями — целые числа (их население).
//Добавьте несколько пар ключ-значение в словарь.
//Удалите одну пару ключ-значение.
//Обновите значение для одного из ключей.
import Foundation

struct DictionaryOperation {
    // Словарь, где ключами являются строки (названия городов), а значениями — целые числа (их население)
    var cityPopulation = ["Moscow": 12615279, "Saint Petersburg": 5383890, "Novosibirsk": 1620162]

// Добавляю несколько  пар ключ-значение в словарь
    mutating func insert(_ cities: [String: Int]...) {
        for cityDict in cities {
            for (city, population) in cityDict {
                cityPopulation[city] = population
            }
        }
        print("Элемент(ы) добавлен(ы), теперь словарь выглядит так: \(cityPopulation)")
    }

// Удаление одной пары ключ-значение
    mutating func delete(_ city: String) {
        guard (cityPopulation[city] != nil) else {
            print("Элемент \(city) не найден")
            return
        }
        cityPopulation.removeValue(forKey: city)
        print("Элемент \(city) удален, теперь словарь выглядит так: \(cityPopulation)")
    }
    
// Обновляю значение для одного из ключей
    mutating func update(_ city: String, _ population: Int) {
        cityPopulation[city] = population
        print("Элемент \(city) изменён, теперь словарь выглядит так: \(cityPopulation)")
    }
}


