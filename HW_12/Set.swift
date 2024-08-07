//
//  SetOperations.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 06.08.2024.
//
//3. Set
//Создайте множество (set) из целых чисел.\/
//Добавьте несколько элементов в это множество.\/
//Удалите один элемент.\/
//Проверьте, существует ли определенный элемент в множестве.\/
//Примените операции объединения, пересечения и разности на множествах
import Foundation

struct SetOperation {
    // Создаю множество (set) из целых чисел.
    var numberSet: Set = [1, 2, 3, 4, 5]

    // Добавляю несколько элементов в множество
    mutating func insert(_ numbers: Int...) {
        for number in numbers {
            numberSet.insert(number)
        }
        print("Элемент(ы) \(numbers) добавлен(ы), теперь ваше множество выглядит так: \(numberSet)")
    }

    // Удаляю один элемент
    mutating func delete(_ number: Int) {
        guard numberSet.contains(number) else {
            print("Такого элемента в множестве нет")
            return
        }
        numberSet.remove(number)
        print("Элемент \(number) удален, теперь ваше множество выглядит так: \(numberSet)")
    }
    
    //Проверяю, существует ли определенный элемент в множестве.
    func checkElement(_ number: Int) {
        guard numberSet.contains(number) else {
            print("Такого элемента в множестве нет")
            return
        }
        print("Элемент \(number) существует в множестве \(numberSet)")
    }
    
    // Операция объединения
    func union(with anotherSet: Set<Int>) -> Set<Int> {
        let unionSet = numberSet.union(anotherSet)
        print("Результат объединения множеств: \(unionSet)")
        return unionSet
    }
    
    // Операция пересечения
    func intersection(with anotherSet: Set<Int>) -> Set<Int> {
        let intersectionSet = numberSet.intersection(anotherSet)
        print("Результат пересечения множеств: \(intersectionSet)")
        return intersectionSet
    }
    
    // Операция разности
    func difference(with anotherSet: Set<Int>) -> Set<Int> {
        let differenceSet = numberSet.subtracting(anotherSet)
        print("Разность множеств: \(differenceSet)")
        return differenceSet
    }
   

}




