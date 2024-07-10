import Foundation

enum MaterialType: String {
    case brick = "Кирпич"
    case board = "Доска"
    case insulation = "Утеплитель"
    case cement = "Цемент"

    var manHours: Int {
        switch self {
        case .brick: return 7
        case .board: return 6
        case .insulation: return 9
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

    init(person: Person, passport: Passport, willDo: MaterialType) {
        self.willDo = willDo
        self.person = person
        self.passport = passport
        person.passport = passport
        passport.person = person
        print("\(person.fullName) готов устроиться на завод, чтобы изготавливать \(willDo.rawValue).")
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
    var balance: Double
    let needsTo: MaterialType
    var quantity: Double

    init(fullName: String, age: Int, needsTo: MaterialType, quantity: Double, balance: Double) {
        self.balance = balance
        self.needsTo = needsTo
        self.quantity = quantity
        super.init(fullName: fullName, age: age)
        print("Заказчик \(fullName) хочет купить \(needsTo.rawValue).")
    }

    deinit {
        quantity == 0 ? print("Заказчик \(fullName) купил всё, что хотел.") : print("Заказчик \(fullName) ничего не купил.")
    }

    func earnMoney(amount: Double) {
        balance += amount
        print("Заказчик \(fullName) заработал \(amount) рублей, теперь у него \(balance) рублей.")
    }
}

class Factory {
    var materials: [MaterialType: Double] = [:]
    var employees: [Employee] = []
    var customers: [Customer] = []

    func hireEmployee(employee: Employee) {
        employees.append(employee)
        print("\(employee.person.fullName) принят на работу")
    }

    func addCustomer(customer: Customer) {
        customers.append(customer)
    }

    func sellMaterials() {
        produceMaterial()
        for customer in customers {
            guard let availableAmount = materials[customer.needsTo], availableAmount >= customer.quantity else {
                print(" \(customer.needsTo.rawValue) пока не готов. Нужно отправить на работу больше сотрудников.")
                continue
            }

            let cost = customer.needsTo.price * customer.quantity
            if customer.balance >= cost {
                customer.balance -= cost
                materials[customer.needsTo] = availableAmount - customer.quantity
                customer.quantity = 0
                print("Материал \(customer.needsTo.rawValue) продан заказчику \(customer.fullName) за \(cost) рублей.")
            } else {
                print("У \(customer.fullName) недостаточно средств для покупки \(customer.needsTo.rawValue). Пусть поработает ещё.")
            }
        }
    }

    private func produceMaterial() {
        for employee in employees {
            let producedAmount = Double(employee.workedHours) / Double(employee.willDo.manHours)
            if producedAmount > 0 {
                if let currentAmount = materials[employee.willDo] {
                    materials[employee.willDo] = currentAmount + producedAmount
                } else {
                    materials[employee.willDo] = producedAmount
                }
                employee.workedHours = 0
            }
        }
    }
}




func example() {
 
    let factory = Factory()

    let person = Person(fullName: "Иван Иванов", age: 35)
    let passport = Passport(series: "5678", number: "123456", issueDate: Date(), person: person)
    let worker1 = Employee(person: person, passport: passport, willDo: .brick)

    factory.hireEmployee(employee: worker1)


    let customer1 = Customer(fullName: "Максим Васильев", age: 30, needsTo: .brick, quantity: 2.4, balance: 500.0)

    factory.addCustomer(customer: customer1)
    worker1.workEightHours()
    
    factory.sellMaterials()
    
    worker1.workEightHours()
    worker1.workEightHours()
    
    factory.sellMaterials()
}


example()

