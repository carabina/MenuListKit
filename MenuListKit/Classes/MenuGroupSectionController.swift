//
//  MenuGroupSectionController.swift
//  Pods
//

import Foundation
import IGListKit

final class MenuGroupSectionController: ListBindingSectionController<ListDiffable> {

    public init(object: MenuGroup) {
        super.init()
        self.inset.top = object.marginTop
        self.inset.bottom = object.marginBottom
        self.minimumLineSpacing = object.spaceBetweenCells
        dataSource = self
        selectionDelegate = self
    }
    
}

// MARK: - ListBindingSectionControllerDataSource

extension MenuGroupSectionController: ListBindingSectionControllerDataSource {

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let menu = object as? MenuGroup else { return [] }

        var sources: [BaseMenuItem & ListDiffable] = []

        if let header = menu.header {
            sources.append(header)
        }

        sources += menu.items

        if menu.items.count == 0, let emptyItem = menu.emptyItem {
            sources.append(emptyItem)
        }

        return sources
    }

    public func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        let item = viewModel as! BaseMenuItem

        var viewCell: UICollectionViewCell?

        switch item.cell {
        case .class:
            viewCell = collectionContext?.dequeueReusableCell(of: item.cellType, for: self, at: index)
        case .xib(let identifier, let bundle):
            viewCell = collectionContext?.dequeueReusableCell(withNibName: identifier, bundle: bundle, for: self, at: index)
        }

        guard let cell = viewCell else {
            fatalError("dequeueReusableCell failed in method cellForItem")
        }

        return cell
    }

    public func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize{
        guard let context = collectionContext else { return CGSize.zero }
        let item = viewModel as! BaseMenuItem
        return CGSize(width: context.containerSize.width, height: item.height)
    }
}

// MARK: - ListBindingSectionControllerSelectionDelegate

extension MenuGroupSectionController: ListBindingSectionControllerSelectionDelegate {
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, didSelectItemAt index: Int, viewModel: Any) {
        let item = viewModel as! BaseMenuItem
        item.actionDelegate?.didSelect(item: item)
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, didHighlightItemAt index: Int, viewModel: Any) {}

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, didDeselectItemAt index: Int, viewModel: Any) {}

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, didUnhighlightItemAt index: Int, viewModel: Any) {}
}
