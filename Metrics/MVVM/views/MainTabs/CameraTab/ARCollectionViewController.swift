//
//  ARCollectionViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 10/04/23.
//

import UIKit
import QuickLook

class ARCollectionViewController: UICollectionViewController {

    weak var tappedCell: ARCollectionViewCell?
    let files = File.loadFiles()

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      files.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: ARCollectionViewCell.reuseIdentifier,
        for: indexPath) as? ARCollectionViewCell
        else {
          return UICollectionViewCell()
      }
      cell.update(with: files[indexPath.row])
      return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      collectionView.deselectItem(at: indexPath, animated: true)
      let quickLookViewController = QLPreviewController()
      quickLookViewController.dataSource = self
      quickLookViewController.delegate = self
      tappedCell = collectionView.cellForItem(at: indexPath) as? ARCollectionViewCell
      quickLookViewController.currentPreviewItemIndex = indexPath.row
      present(quickLookViewController, animated: true)
    }
}

// MARK: - QLPreviewControllerDataSource
extension ARCollectionViewController: QLPreviewControllerDataSource {
  func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
    files.count
  }

  func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
    files[index]
  }
}

// MARK: - QLPreviewControllerDelegate
extension ARCollectionViewController: QLPreviewControllerDelegate {
  func previewController(_ controller: QLPreviewController, transitionViewFor item: QLPreviewItem) -> UIView? {
    tappedCell?.thumbnailImageView
  }

  func previewController(_ controller: QLPreviewController, editingModeFor previewItem: QLPreviewItem) -> QLPreviewItemEditingMode {
    .updateContents
  }

  func previewController(_ controller: QLPreviewController, didUpdateContentsOf previewItem: QLPreviewItem) {
    guard let file = previewItem as? File else { return }
    DispatchQueue.main.async {
      self.tappedCell?.update(with: file)
    }
  }
}
