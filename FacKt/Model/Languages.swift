//
//  Languages.swift
//  FacKt
//
//  Created by ahmet on 07.07.22.
//

import Foundation

struct Languages {
    var languageTitle:String
    var randomTitle:String
    var dailyTitle:String
    var alarmTitle:String
    var alarmMessage:String
}

var languagesArray:[Languages] = [Languages(
                                     languageTitle: "en",
                                     randomTitle: "Random Fact",
                                     dailyTitle: "Daily Fact",
                                     alarmTitle: "Error",
                                     alarmMessage: "Facts cannot be retrieved at this time. Please try again later."),
                                 Languages(
                                    languageTitle: "de",
                                     randomTitle: "Zufälliger Fakt",
                                     dailyTitle: "Täglich Fakt",
                                     alarmTitle: "Fehler",
                                     alarmMessage: "Fakten können zurzeit nicht abgerufen werden.Versuche es bitte später erneut.")]

