//
//  ViewController.swift
//  WebContainerApp
//
//  Created by Calin Radu Calin on 11/08/2020.
//  Copyright © 2020 Yummly. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

  @IBOutlet private weak var textView: UITextView!
  private let defaultURLString = "google.com"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    textView.text = defaultURLString
  }

  @IBAction private func openURLButtonAction(_ sender: Any) {
    guard var urlComponents = URLComponents(string: textView.text) else { return }

    if urlComponents.scheme == nil {
      urlComponents.scheme = "https"
    }

    openURL(urlComponents.url)
  }


  private func openURL(_ url: URL?) {
    guard let url = url else { return }
    let config = SFSafariViewController.Configuration()
    config.entersReaderIfAvailable = true

    let vc = SFSafariViewController(url: url, configuration: config)
    present(vc, animated: true)
  }
}

