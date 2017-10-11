//
//  BaseSectionController.swift
//  Pods
//

import Foundation
import IGListKit

open class BaseMenuItemSectionController: ListSectionController {
    
    var model: BaseMenuItem!

    open override func didUpdate(to object: Any) {
        model = object as? BaseMenuItem
    }
    
    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        var viewCell: UICollectionViewCell?
        
        switch model.cell {
        case .class:
            viewCell = collectionContext?.dequeueReusableCell(of: model.cellType, for: self, at: index)
        case .xib(let identifier, let bundle):
            viewCell = collectionContext?.dequeueReusableCell(withNibName: identifier, bundle: bundle, for: self, at: index)
        }
        
        guard let cell = viewCell else {
            fatalError("dequeueReusableCell failed in method cellForItem")
        }
        model?.bind(to: cell)
        return cell
    }
    
    open override func didSelectItem(at index: Int) {
        model?.actionDelegate?.didSelect(item: model)
    }
    
    open override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return CGSize.zero }
        return CGSize(width: context.containerSize.width, height: model!.height)
    }
    
}
