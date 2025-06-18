//
//  OnboardTipStepOne.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 18.06.25.
//

import TipKit

struct OnboardTipOne: Tip {
    
    static var buttonClicked = Event(id: "buttonClicked")
    
    // Falls wir eine Action in unserem Tip haben wollen, dann können wir bei der Erstellung des Tips eine Closure mitgeben, welche bei klick auf einer Action passieren soll
    var performableAction: @Sendable () -> Void
    
    var title: Text {
        Text("Klick hier für Likes")
    }
    
    var message: Text? {
        Text("Um Likes zu sehen klicke hier drauf.")
    }
    
    // Rules sind im Zusammenhand mit Events dafür da die Tips unter bestimmten Bedingungen anzeigen zu lassen.
    var rules: [Rule] {
        // Wir benutzen hier das große "Self", da wir auf eine statische Variable innerhalb der Klasse zugreifen, dies ist nicht über das kleine self möglich, da dies sich auf eine Instanz beziehen würde.
        #Rule(Self.buttonClicked) { event in
            event.donations.count > 2
        }
    }
    
    // Actions sind im Endeffekt Buttons, welche in unserem Tip angezeigt werden, mit denen wir bestimmte Aktionen ausführen können.
    var actions: [Action] {
        Action(title: "Testaction", perform: performableAction)
    }
}


struct OnboardTipTwo: Tip {
    var title: Text {
        Text("Das ist ein Zweiter Tip")
    }
    
    var message: Text? {
        Text("Cool oder?")
    }

}

struct OnboardTipThree: Tip {
    var title: Text {
        Text("Das ist ein Dritter Tip")
    }
    
    var message: Text? {
        Text("Cool oder?")
    }
}
