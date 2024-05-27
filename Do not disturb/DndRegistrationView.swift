//
//  DndRegistration.swift
//  Junk Report
//
//  Created by Amitosh Swain Mahapatra on 25/05/24.
//

import MessageUI
import SwiftUI

struct DndRegistrationView: View {
  @Environment(\.dismiss) private var dismiss
  @AppStorage("ucc.block.all") var blockAll = false

  private let messageComposeDelegate = MessageComposerDelegate()

  var body: some View {
    Form {
      Section {
        Toggle("Block all communications", isOn: $blockAll)
      } footer: {
        Text("Block all communications except transactions and OTPs")
      }

      Section {
        NavigationLink("Customize on carrier portal") {
          CarrierDndLinksView()
        }
      } header: {
        Text("Customize")
      } footer: {
        Text(
          "You can customize your preferences to allow certain categories of commercial communications."
        )
      }

      Section {
      } footer: {

        Text(
          "Registering for DND is free of charge. We will send an SMS to 1909 to add your number to the list."
        )
      }
    }
    .toolbar {
      ToolbarItem(placement: .confirmationAction) {
        Button {
          presentMessageCompose(to: "1909", body: "START 0")
          dismiss()
        } label: {
          Text("Save")
        }

      }
    }
    .navigationTitle("Register for DND").navigationBarTitleDisplayMode(.inline)
  }
}

extension DndRegistrationView {

  private class MessageComposerDelegate: NSObject, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(
      _ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult
    ) {
      // Customize here
      controller.dismiss(animated: true)
    }
  }
  /// Present an message compose view controller modally in UIKit environment
  private func presentMessageCompose(to: String, body: String) {
    guard MFMessageComposeViewController.canSendText() else {
      return
    }
    let vc = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController
    let composeVC = MFMessageComposeViewController()
    composeVC.recipients = [to]
    composeVC.body = body
    composeVC.messageComposeDelegate = messageComposeDelegate

    vc?.present(composeVC, animated: true)
  }
}

#Preview {
  NavigationStack {
    DndRegistrationView()
  }
}
