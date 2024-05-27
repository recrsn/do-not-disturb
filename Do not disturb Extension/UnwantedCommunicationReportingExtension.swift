//
//  UnwantedCommunicationReportingExtension.swift
//  Junk Report Extension
//
//  Created by Amitosh Swain Mahapatra on 25/05/24.
//

import IdentityLookup
import IdentityLookupUI
import UIKit

class UnwantedCommunicationReportingExtension: ILClassificationUIExtensionViewController {
  @IBOutlet weak var titileLabel: UILabel!
  @IBOutlet weak var menuButton: UIButton!

  var selectedCategory: SpamCategory = .other

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    var menuItems: [UIMenuElement] = []
    for category in SpamCategory.allCases {
      let action = UIAction(
        title: category.displayName,
        handler: { _ in
          self.selectedCategory = category
          self.menuButton.setTitle(category.displayName, for: .normal)

          // Notify the system that you have gathered all the information needed
          // to classify the communication
          self.extensionContext.isReadyForClassificationResponse = true
        })
      menuItems.append(action)
    }

    let menu = UIMenu(title: "Select Category", children: menuItems)
    menuButton.menu = menu
    menuButton.showsMenuAsPrimaryAction = true
  }

  override func prepare(for request: ILClassificationRequest) {
    switch request {
    case let request as ILMessageClassificationRequest:
      self.titileLabel.text = "Report \(request.messageCommunications.first?.sender ?? "")"
    case let request as ILCallClassificationRequest:
      self.titileLabel.text = "Report \(request.callCommunications.first?.sender ?? "")"
    default:
      fatalError("Unknown classification request")
    }
  }

  private func generateReport(sender: String, date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yy"

    return
      "\(self.selectedCategory.reportValue), \(sender.deletingPrefix("+91")), \(formatter.string(from: date))"
  }

  // Provide a classification response for the classification request
  override func classificationResponse(for request: ILClassificationRequest)
    -> ILClassificationResponse
  {
    let response = ILClassificationResponse(action: .reportJunk)

    switch request {
    case let request as ILMessageClassificationRequest:
      if let message = request.messageCommunications.first {
        response.userString = generateReport(
          sender: message.sender ?? "", date: message.dateReceived)
      }
    case let request as ILCallClassificationRequest:
      if let call = request.callCommunications.first {
        response.userString = generateReport(sender: call.sender ?? "", date: call.dateReceived)
      }
    default:
      fatalError("Unknown classification request")
    }

    return response
  }
}

extension String {
  func deletingPrefix(_ prefix: String) -> String {
    guard self.hasPrefix(prefix) else { return self }
    return String(self.dropFirst(prefix.count))
  }
}
