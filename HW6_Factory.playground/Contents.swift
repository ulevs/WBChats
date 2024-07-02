import Foundation


enum MaterialType: String {
    case brick = "Кирпич"
    case board = "Доска"
    case insulation = "Утеплитель"
    case cement = "Цемент"

    var manHours: Int {
        switch self {
        case .brick: return 15
        case .board: return 6
        case .insulation: return 27
        case .cement: return 4
        }
    }

    var price: Double {
        switch self {
        case .brick: return 11.40
        case .board: return 230.0
        case .insulation: return 629.50
        case .cement: return 240.0
        }
    }
}


class Person {
    let fullName: String
    var age: Int
    var passport: Passport?

    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
        print("\(fullName) родился.")
    }

    deinit {
        print("\(fullName) умер.")
    }
}


class Passport {
    let series: String
    let number: String
    let issueDate: Date
    weak var person: Person?

    init(series: String, number: String, issueDate: Date, person: Person) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        self.person = person
        print("\(person.fullName) получил паспорт \(series) \(number).")
    }

    deinit {
        print("Паспорт \(series) \(number) уничтожен.")
    }
}


class Employee {
    let person: Person
    let passport: Passport
    let willDo: MaterialType
    var workedHours: Int = 0


    init(person: Person, pasport: Passport, willDo: MaterialType) {
        self.willDo = willDo
        self.person = person
        self.passport = pasport
        person.passport = pasport
        pasport.person = person
        print("\(person.fullName) готов устроиться работать на завод чтобы изготавливать \(willDo.self.rawValue).")
    }

    deinit {
        print("\(person.fullName) уволен.")
    }

    func workEightHours() {
        workedHours += 8
        print("\(person.fullName) отработал 8 часов.")
    }
}


class Customer: Person {
    let numberBankAccount: String
    var balance: Double
    let needsTo: MaterialType

    init(fullName: String, age: Int, numberBankAccount: String, needsTo: MaterialType, balance: Double) {
        self.numberBankAccount = numberBankAccount
        self.balance = balance
        self.needsTo = needsTo
        super.init(fullName: fullName, age: age)
        print("Заказчик \(fullName) хочет купить \(needsTo.self.rawValue).")
    }

    deinit {
        print("Заказчик \(fullName) завершил свои покупки.")
    }

    func earnMoney(amount: Double) {
        balance += amount
        print("Заказчик \(fullName) заработал \(amount) рублей, теперь у него \(balance) рублей.")
    }
}


class Factory {
    var materials: [MaterialType : Double] = [:]
    var employees: [Employee] = []
    var customers: [Customer] = []


    func hireEmployee(employee: Employee) {
        employees.append(employee)
        print("\(employee.person.fullName) принят на работу")
    }


    func addCustomer(customer: Customer) {
        customers.append(customer)
    }

   
    func produceMaterial(material: MaterialType) -> Double {
        var totalHours = 0.0
        for employee in employees where employee.willDo == material {
            totalHours += Double(employee.workedHours)
            employee.workedHours = 0
        }

        let producedAmount = totalHours / Double(material.manHours)
        if producedAmount > 0 {
            materials[material, default: 0.0] += producedAmount
            print("Произведено \(producedAmount) единиц материала \(material.self.rawValue).")
        } else {
            print("Материал \(material) ещё не изготовлен.")
        }
        return producedAmount
    }

 
    func sellMaterials() {
        for customer in customers {
            guard let availableAmount = materials[customer.needsTo], availableAmount > 0 else {
                print("Материал \(customer.needsTo) не доступен для продажи.")
                continue
            }

            let cost = customer.needsTo.price
            if customer.balance >= cost {
                customer.balance -= cost
                materials[customer.needsTo] = max(0, availableAmount - 1)
                print("Материал \(customer.needsTo) продан заказчику \(customer.fullName) за \(cost) рублей.")
            } else {
                print("У заказчика \(customer.fullName) недостаточно средств для покупки \(customer.needsTo).")
            }
        }
    }
}


func exampleUsage() {
 
    let factory = Factory()

    let person = Person(fullName: "Иван Иванов", age: 35)
    let passport = Passport(series: "5678", number: "123456", issueDate: Date(), person: person)
    let worker1 = Employee(person: person, pasport: passport, willDo: .brick)

    factory.hireEmployee(employee: worker1)


    let customer1 = Customer(fullName: "Максим Васильев", age: 30, numberBankAccount: "12345678901234567890", needsTo: .brick, balance: 500.0)

    factory.addCustomer(customer: customer1)
    worker1.workEightHours()
    
    factory.produceMaterial(material: .brick)
    factory.sellMaterials()
}


exampleUsage()

