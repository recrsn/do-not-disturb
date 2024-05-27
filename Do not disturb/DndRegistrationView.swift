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
    let vc = UIApplication.shared.keyWindow?.rootViewController
    let composeVC = MFMessageComposeViewController()
    composeVC.recipients = [to]
    composeVC.body = body
    composeVC.messageComposeDelegate = messageComposeDelegate

    vc?.present(composeVC, animated: true)
  }
}

extension UIApplication {

  var keyWindow: UIWindow? {
    // Get connected scenes
    return self.connectedScenes
      // Keep only active scenes, onscreen and visible to the user
      .filter { $0.activationState == .foregroundActive }
      // Keep only the first `UIWindowScene`
      .first(where: { $0 is UIWindowScene })
      // Get its associated windows
      .flatMap({ $0 as? UIWindowScene })?.windows
      // Finally, keep only the key window
      .first(where: \.isKeyWindow)
  }

}

#Preview {
  NavigationStack {
    DndRegistrationView()
  }
}
