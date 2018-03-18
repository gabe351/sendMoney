//
//  ContactList.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

public func getImageBy(id: Int) -> UIImage {
    for contact in buildContacts() {
        if id == contact.id {
            return contact.image
        }
    }
    return #imageLiteral(resourceName: "placeholderUser")
}

public func buildContacts() -> [Contact] {
    
    var contacts = [Contact]()
    
    let contact01 = Contact(id: 01,
                            name: "João das Neves",
                            email: "queriaserstark@gmail.com",
                            phoneNumber: "(11) 98485-0381" ,
                            image: #imageLiteral(resourceName: "contact1"))
    let contact02 = Contact(id: 02,
                            name: "Geraldo da Riveira",
                            email: "sanguedelobo@gmail.com",
                            phoneNumber: "(11) 98371-3764",
                            image: #imageLiteral(resourceName: "contact2"))
    let contact03 = Contact(id: 03,
                            name: "Maria Cirila",
                            email: "cirilamagica@gmail.com",
                            phoneNumber: "(82) 99463-9703",
                            image: #imageLiteral(resourceName: "contact3"))
    let contact04 = Contact(id: 04,
                            name: "Alexandre Henrique",
                            email: "alexandrehcdc@gmail.com",
                            phoneNumber: "(82) 997747-4828",
                            image: #imageLiteral(resourceName: "contact4"))
    let contact05 = Contact(id: 05,
                            name: "Arthur Jatobá",
                            email: "jatobaarthur@gmail.com",
                            phoneNumber: "(82) 99483-8384",
                            image: #imageLiteral(resourceName: "contact5"))
    let contact06 = Contact(id: 06,
                            name: "Aleatoriana da Silva",
                            email: "sourandom@gmail.com",
                            phoneNumber: "(81) 99577-0033",
                            image: #imageLiteral(resourceName: "contact6"))
    let contact07 = Contact(id: 07,
                            name: "Joana Silva",
                            email: "joaninhasilva@gmail.com",
                            phoneNumber: "(11) 98766-4433",
                            image: #imageLiteral(resourceName: "contact7"))
    let contact08 = Contact(id: 08,
                            name: "Cássia Cruz",
                            email: "cassiacruz@gmail.com",
                            phoneNumber: "(41) 98894-0332",
                            image: #imageLiteral(resourceName: "contact8"))
    let contact09 = Contact(id: 09,
                            name: "Késsia Castro",
                            email: "kessiacastrolima@gmail.com",
                            phoneNumber: "(32) 95766-0987",
                            image: #imageLiteral(resourceName: "contact9"))
    let contact10 = Contact(id: 10,
                            name: "Jorge Vercilo",
                            email: "contato@jorgevercillo.com.br",
                            phoneNumber: "(11) 99654-9461",
                            image: #imageLiteral(resourceName: "contact10"))
    let contact11 = Contact(id: 11,
                            name: "Devinho Novaes",
                            email: "oboyzinho@gmail.com",
                            phoneNumber: "(11) 99503-0291",
                            image: #imageLiteral(resourceName: "contact11"))
    let contact12 = Contact(id: 12,
                            name: "Raj Mackenzie",
                            email: "rajmac10@gmail.com",
                            phoneNumber: "(31) 95543-0029",
                            image: #imageLiteral(resourceName: "contact12"))
    let contact13 = Contact(id: 13,
                            name: "Nelson Gonsalves",
                            email: "nelsonG@gmail.com",
                            phoneNumber: "(42) 99422-4329",
                            image: #imageLiteral(resourceName: "contact13"))
    let contact14 = Contact(id: 14,
                            name: "Flora de magalhães",
                            email: "floradm@bol.com",
                            phoneNumber: "(21) 99653-1235",
                            image: #imageLiteral(resourceName: "contact14"))
    let contact15 = Contact(id: 15,
                            name: "Hebert Santana",
                            email: "herb361@gmail.com",
                            phoneNumber: "(83) 99432-5584",
                            image: #imageLiteral(resourceName: "contact15"))
    let contact16 = Contact(id: 16,
                            name: "Emílio Serafim",
                            email: "emilioSer@gmail.com",
                            phoneNumber: "(11) 99644-2412",
                            image: #imageLiteral(resourceName: "contact16"))
    let contact17 = Contact(id: 17,
                            name: "Miguel Jatobá",
                            email: "jatobamiguel@gmail.com",
                            phoneNumber: "(33) 99644-9421",
                            image: #imageLiteral(resourceName: "contact17"))
    let contact18 = Contact(id: 18,
                            name: "Emma Waltson",
                            email: "hermionegrenger@gmail.com",
                            phoneNumber: "(23) 99504-3125",
                            image: #imageLiteral(resourceName: "contact18"))
    let contact19 = Contact(id: 19,
                            name: "Klécia Tinto",
                            email: "kleeh@gmail.com",
                            phoneNumber: "(22) 99574-3321",
                            image: #imageLiteral(resourceName: "contact19"))
    let contact20 = Contact(id: 20,
                            name: "Kell da silva",
                            email: "kenanrenato@gmail.com",
                            phoneNumber: "(84) 99695-0975",
                            image: #imageLiteral(resourceName: "contact20"))
    let contact21 = Contact(id: 21,
                            name: "Laurentina Maia",
                            email: "laurentina@gmail.com",
                            phoneNumber: "(23) 99504-4928",
                            image: #imageLiteral(resourceName: "contact21"))
    let contact22 = Contact(id: 22,
                            name: "Yoko Kenji",
                            email: "yokoKenji@gmail.com",
                            phoneNumber: "(42) 99604-8232",
                            image: #imageLiteral(resourceName: "contact22"))
    let contact23 = Contact(id: 23,
                            name: "Nami Kazuya",
                            email: "namidoonepiece@gmail.com",
                            phoneNumber: "(22) 9429-0483",
                            image: #imageLiteral(resourceName: "contact23"))
    let contact24 = Contact(id: 24,
                            name: "Samuel Jatobá",
                            email: "jatobasamuel@gmail.com",
                            phoneNumber: "(33) 99644-9421",
                            image: #imageLiteral(resourceName: "contact17"))
    let contact25 = Contact(id: 25,
                            name: "Pablo Mascarenhas",
                            email: "mascarenhasp@gmail.com",
                            phoneNumber: "(44) 98755-0393",
                            image: #imageLiteral(resourceName: "contact25"))
    
    contacts.append(contact01)
    contacts.append(contact02)
    contacts.append(contact03)
    contacts.append(contact04)
    contacts.append(contact05)
    contacts.append(contact06)
    contacts.append(contact07)
    contacts.append(contact08)
    contacts.append(contact09)
    contacts.append(contact10)
    contacts.append(contact11)
    contacts.append(contact12)
    contacts.append(contact13)
    contacts.append(contact14)
    contacts.append(contact15)
    contacts.append(contact16)
    contacts.append(contact17)
    contacts.append(contact18)
    contacts.append(contact19)
    contacts.append(contact20)
    contacts.append(contact21)
    contacts.append(contact22)
    contacts.append(contact23)
    contacts.append(contact24)
    contacts.append(contact25)
    
    return contacts
}

