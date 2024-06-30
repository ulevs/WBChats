import Foundation

struct BankAccount {
    let numberBankAccount: String
    var balance: Decimal
}

class Bank {
    private var bankAccounts: [BankAccount] = []
    private var bankAccountsBeforeChanges: [BankAccount] = []

    // MARK: Methods
    func addBankAccount(numberBankAccount: String, balance: Decimal) {
        let account = BankAccount(numberBankAccount: numberBankAccount, balance: balance)
        
        guard checkNumberBankAccount(numberBankAccount) else {
            return
        }
        
        bankAccounts.append(account)
        bankAccountsBeforeChanges.append(account)
        print("новый счёт успешно добавлен")
    }

    func replenishment(accountNumber: String, sum: Decimal) {
        guard let index = bankAccounts.firstIndex(where: { $0.numberBankAccount == accountNumber }) else {
            print("Счёт с номером \(accountNumber) не найден.")
            return
        }
        
        bankAccountsBeforeChanges = bankAccounts
        bankAccounts[index].balance += sum
        print("Вы пополнили счёт \(accountNumber) на сумму \(sum) руб.")
    }

    func transferMoney(from senderAccountNumber: String, to recipientAccountNumber: String, sum: Decimal) {
        guard let senderIndex = bankAccounts.firstIndex(where: { $0.numberBankAccount == senderAccountNumber }) else {
            print("Неверный номер счёта отправителя.")
            return
        }
        
        guard let recipientIndex = bankAccounts.firstIndex(where: { $0.numberBankAccount == recipientAccountNumber }) else {
            print("Неверный номер счёта получателя.")
            return
        }
        
        guard bankAccounts[senderIndex].balance >= sum else {
            print("Недостаточно средств")
            return
        }
        
        guard sum > 0 else {
            print("Неверная сумма")
            return
        }
            
        bankAccountsBeforeChanges = bankAccounts
        bankAccounts[senderIndex].balance -= sum
        bankAccounts[recipientIndex].balance += sum
        print("Вы сделали перевод на сумму \(sum) руб со счёта \(senderAccountNumber) на счёт \(recipientAccountNumber).")

    }

    func printAccountState() {
        for i in 0..<bankAccounts.count {
            let currentAccount = bankAccounts[i]
            let beforeChangeAccount = bankAccountsBeforeChanges[i]
            
            if currentAccount.balance == beforeChangeAccount.balance {
                print("номер счёта: \(currentAccount.numberBankAccount), баланс: \(currentAccount.balance)")
            } else {
                print("номер счёта: \(currentAccount.numberBankAccount), баланс до изменений: \(beforeChangeAccount.balance), текущий баланс: \(currentAccount.balance)")
            }
        }
    }

    // MARK: Private Methods
    private func checkNumberBankAccount(_ numberBankAccount: String) -> Bool {
        let regex = "^[0-9]{20}$"
        let isValidName = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: numberBankAccount)
        
        guard isValidName else {
            print("Неправильный номер счёта, должно быть 20 цифр")
            return false
        }
        
        for account in bankAccounts {
            guard account.numberBankAccount != numberBankAccount else {
                print("Такой счёт уже существует")
                return false
            }
        }
        return true
    }
}

//// Пример
//let bank = Bank()
//bank.addBankAccount(numberBankAccount: "12345678901234567890", balance: 1000.0)
//bank.addBankAccount(numberBankAccount: "09876543210987654321", balance: 500.0)
//bank.addBankAccount(numberBankAccount: "12345678901334564532", balance: 55600.0)
//
//bank.replenishment(accountNumber: "12345678901234567890", sum: 200.0)
//bank.replenishment(accountNumber: "12345678901334564532", sum: 300.0)
//
//bank.transferMoney(from: "12345678901234567890", to: "09876543210987654321", sum: 300.0)
//bank.transferMoney(from: "12345678901234567890", to: "09876543210987654321", sum: 220.0)
//
//bank.printAccountState()
