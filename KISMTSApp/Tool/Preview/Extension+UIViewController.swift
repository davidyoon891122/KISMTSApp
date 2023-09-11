//
//  Extension+UIViewController.swift
//  LifeOfResearch
//
//  Created by Jiwon Yoon on 2023/05/25.
//

import UIKit

// SwiftUI Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }

    func showPreview(_ deviceType: DeviceType = .iPhone14Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }

    func getPopAlert(
        title: String?,
        contents: String,
        leftButtonText: String?,
        rightButtonText: String?,
        rightButtonAction: @escaping (() -> Void) = {},
        preferredStyle: UIAlertController.Style = .alert
    ) -> UIAlertController {
        let alertController = UIAlertController(
            title: title,
            message: contents,
            preferredStyle: preferredStyle
        )

        if let leftButtonText = leftButtonText {
            let alertAction = UIAlertAction(title: leftButtonText, style: .cancel)
            alertController.addAction(alertAction)
        }

        if let rightButtonText = rightButtonText {
            let alertAction = UIAlertAction(title: rightButtonText, style: .default) {_ in
                rightButtonAction()
            }
            alertController.addAction(alertAction)
        }

        return alertController
    }
}
#endif


