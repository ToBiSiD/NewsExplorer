//
//  LanguageOption.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 29.07.2023.
//

import Foundation

protocol SearchingOption: CaseIterable, Equatable, Hashable {
    var caseTitle: String { get }
}

enum LanguageOption: String, SearchingOption {
    case ar
    case de
    case en
    case es
    case fr
    case he
    case it
    case nl
    case no
    case pt
    case ru
    case sv
    case ud
    case zh = "zh"
    
    var caseTitle: String {
        switch self {
        case .ar: return "Arabic"
        case .de: return "German"
        case .en: return "English"
        case .es: return "Spanish"
        case .fr: return "French"
        case .he: return "Hebrew"
        case .it: return "Italian"
        case .nl: return "Dutch"
        case .no: return "Norwegian"
        case .pt: return "Portuguese"
        case .ru: return "Russian"
        case .sv: return "Swedish"
        case .ud: return "Undefined"
        case .zh: return "Chinese"
        }
    }
}
