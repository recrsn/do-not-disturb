//
//  ContentView.swift
//  Junk Report
//
//  Created by Amitosh Swain Mahapatra on 25/05/24.
//

import SwiftUI

struct ContentView: View {
  @State var reportCallOpen = true
  @State var reportSMSOpen = true
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        DisclosureGroup("Report spam call") {
          VStack(alignment: .leading) {
            Label("Open **Phone**", systemImage: "phone.fill")
              .symbolRenderingMode(.multicolor)
            Label("Tap on **Recents**", systemImage: "clock.fill")
              .symbolRenderingMode(.multicolor)
            Label("Left swipe on the spam call", systemImage: "chevron.left.2")
              .symbolRenderingMode(.multicolor)

            Label(
              title: { Text("Tap the report button") },
              icon: {
                Image(systemName: "hand.raised.fill")
                  .foregroundStyle(.orange)
              }
            )

            Spacer()
              .frame(maxWidth: .infinity, maxHeight: 0)
          }

        }

        DisclosureGroup("Report spam SMS") {
          VStack(alignment: .leading) {

            Label("Open **Messages**", systemImage: "message.fill")
              .symbolRenderingMode(.multicolor)
            Label("Tap on the spam message", systemImage: "hand.tap.fill")
              .symbolRenderingMode(.multicolor)
            Label("Scroll down and tap on **Report All Messages**", systemImage: "chevron.down")
              .symbolRenderingMode(.multicolor)

            Spacer()
              .frame(maxWidth: .infinity, maxHeight: 0)
          }
        }

        DisclosureGroup("Setup") {

          VStack(alignment: .leading) {

            Label("Open iPhone **Settings**", systemImage: "gear")
              .symbolRenderingMode(.multicolor)
            Label("Tap on **Phone**", systemImage: "phone.fill")
              .symbolRenderingMode(.multicolor)
            Label("Open **SMS/Call reporting**", systemImage: "chevron.right.square")
              .symbolRenderingMode(.multicolor)
            Label("Select **Do not disturb**", systemImage: "checkmark.square")
              .symbolRenderingMode(.multicolor)

            Button("Open Settings") {
              UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }.buttonStyle(BorderedButtonStyle())
            Spacer()
              .frame(maxWidth: .infinity, maxHeight: 0)
          }
        }

        DisclosureGroup("How it works?") {
          VStack(alignment: .leading) {
            Text(
              "If you are registered on your network provider's DND list, you can report any spam calls or SMS (UCC) you receive."
            )

            Text("Reporting an UCC will send an SMS to 1909 which is absolutely free of cost.")

            NavigationLink(
              "Register for DND",
              destination: {
                DndRegistrationView()
              }
            ).buttonStyle(BorderedButtonStyle())

            Spacer()
              .frame(maxWidth: .infinity, maxHeight: 0)
          }
        }

        Spacer()

        HStack {
          Spacer()
          Text("Crafted with ❤️ by Input Forge\nNot affiliated with TRAI").multilineTextAlignment(
            .center
          )
          .font(.footnote)
          Spacer()
        }
      }
      .navigationTitle("Do not disturb")
      .padding()
    }
  }
}

#Preview {
  NavigationStack {
    ContentView()
  }
}
