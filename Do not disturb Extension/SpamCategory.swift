//
//  SpamCategory.swift
//  Junk Report Extension
//
//  Created by Amitosh Swain Mahapatra on 26/05/24.
//

import Foundation

enum SpamCategory: String, CaseIterable, Equatable {
    case other
    case automobiles
    case consumerGoods
    case creditCards
    case education
    case entertainment
    case healthCare
    case insurance
    case investments
    case loans
    case realEstate
    case tourism

    var displayName: String {
        switch self {
        case .other:
            return "Other"
        case .automobiles:
            return "Automobiles"
        case .consumerGoods:
            return "Consumer Goods"
        case .creditCards:
            return "Credit Cards"
        case .education:
            return "Education"
        case .entertainment:
            return "Entertainment"
        case .healthCare:
            return "Health Care"
        case .insurance:
            return "Insurance"
        case .investments:
            return "Investments"
        case .loans:
            return "Loans"
        case .realEstate:
            return "Real Estate"
        case .tourism:
            return "Tourism & Leisure"
        }
    }

    var reportValue: String {
        switch self {
        case .other:
            return "Unsolicited commercial communication"
        case .automobiles:
            return "Automobile advertisements"
        case .consumerGoods:
            return "Advertisement for consumer goods"
        case .creditCards:
            return "Credit card offers"
        case .education:
            return "Educational advertisements"
        case .entertainment:
            return "Entertainment advertisements and promotions"
        case .healthCare:
            return "Healthcare advertisements"
        case .insurance:
            return "Unsolicited insurance offers"
        case .investments:
            return "Unsolicited investment offers"
        case .loans:
            return "Unsolicited loan offers"
        case .realEstate:
            return "Real estate advertisements"
        case .tourism:
            return "Tourism and leisure advertisements"
        }
    }
}
