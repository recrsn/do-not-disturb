//
//  CarrierDndLinksView.swift
//  Do not disturb
//
//  Created by Amitosh Swain Mahapatra on 26/05/24.
//

import SwiftUI

struct CarrierDndInfo: Identifiable {
    var id: String
    var name: String
    var link: String
}

extension CarrierDndInfo {
    static let airtel = Self(
        id: "airtel", name: "AirTel", link: "https://www.airtel.in/airtel-dnd/")
    static let jio = Self(
        id: "jio", name: "Jio",
        link:
            "https://www.jio.com/help/faq/mobile/services/dnd/how-do-i-activate-do-not-disturb-dnd#/"
    )
    static let vi = Self(id: "vi", name: "Vi", link: "https://www.myvi.in/dnd")
}

extension CarrierDndInfo: CaseIterable {
    static let allCases: [CarrierDndInfo] = [.airtel, .jio, .vi]
}

struct CarrierDndLinksView: View {
    var body: some View {
        Form {
            Section {
                ForEach(CarrierDndInfo.allCases) { carrier in
                    Button {
                        UIApplication.shared.open(URL(string: carrier.link)!)
                    } label: {
                        HStack {
                            Label(carrier.name, image: carrier.id)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                }
            } footer: {
                Text(
                    "If you can't find your carrier here, they do not provide a web portal to manage choices. Contact your carrier for the procedure to customize UCC consent."
                )
            }
        }.navigationTitle("Open carrier website")
    }
}

#Preview {
    CarrierDndLinksView()
}
