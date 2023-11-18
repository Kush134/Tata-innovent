//
//  File.swift
//  Metrics
//
//  Created by Agrim Srivastava on 10/04/23.
//


import UIKit
import QuickLook

class File: NSObject {
  let url: URL

  init(url: URL) {
    self.url = url
  }

  var name: String {
    url.deletingPathExtension().lastPathComponent
  }
}

// MARK: - QLPreviewItem
extension File: QLPreviewItem {
  var previewItemURL: URL? {
    url
  }
}

// MARK: - QuickLookThumbnailing
extension File {
  func generateThumbnail(completion: @escaping (UIImage) -> Void) {
    // 1
    let size = CGSize(width: 128, height: 102)
    let scale = UIScreen.main.scale

    // 2
    let request = QLThumbnailGenerator.Request(
      fileAt: url,
      size: size,
      scale: scale,
      representationTypes: .all)

    // 3
    let generator = QLThumbnailGenerator.shared
    generator.generateRepresentations(for: request) { thumbnail, _, error in
      if let thumbnail = thumbnail {
        completion(thumbnail.uiImage)
      } else if let error = error {
        // Handle error
        print(error)
      }
    }
  }
}

// MARK: - Helper extension
extension File {
  static func loadFiles() -> [File] {
    let fileManager = FileManager.default
    guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return [] }

    let urls: [URL]
    do {
      urls = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
    } catch {
      fatalError("Couldn't load files from documents directory")
    }

    return urls.map { File(url: $0) }
  }

  static func copyResourcesToDocumentsIfNeeded() {
    guard UserDefaults.standard.bool(forKey: "didCopyResources") else {
      let files = [
        Bundle.main.url(forResource: "AirForce", withExtension: "usdz"),
        Bundle.main.url(forResource: "chair_swan", withExtension: "usdz"),
        Bundle.main.url(forResource: "Room 2", withExtension: "usdz"),
        Bundle.main.url(forResource: "hostelChair_medium", withExtension: "usdz"),
        Bundle.main.url(forResource: "sample", withExtension: "usdz")
      ]
      files.forEach {
        guard let url = $0 else { return }
        do {
          let newURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(url.lastPathComponent)
          try FileManager.default.copyItem(at: url, to: newURL)
        } catch {
          print(error.localizedDescription)
        }
      }

      UserDefaults.standard.set(true, forKey: "didCopyResources")
      return
    }
  }
}
