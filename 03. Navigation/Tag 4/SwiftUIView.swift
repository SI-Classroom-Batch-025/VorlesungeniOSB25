//
//  SwiftUIView.swift
//  03. Navigation
//
//  Created by Felix B on 17.06.25.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var navPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            Button("Test") {
                navPath.append(ViewTypes.categoryView)
            }
            .navigationDestination(for: ViewTypes.self) { type in
                if type == .categoryView {
                    CategoryView(navPath: $navPath)
                }
            }
        }
    }
}

#Preview {
    SwiftUIView()
}


struct CategoryView: View { 
    
    private let cats = [
        Category(name: "TESTCAT1", subCategories: [
            SubCategory(name: "TESTSUB1")
        ])
    ]
    
    @Binding var navPath: NavigationPath
    
    var body: some View {
        Text("Category VIEW")
        List(cats) { category in
            Button(category.name) {
                navPath.append(category)
            }
        }
        .navigationDestination(for: Category.self) { category in
            SubCategoryView(category: category, navPath: $navPath)
        }
    }
}

struct SubCategoryView: View {
    
    let category: Category
    @Binding var navPath: NavigationPath
    
    var body: some View {
        Text("Subcategory VIEW")
        List(category.subCategories) { subCategory in
            Button(subCategory.name) {
                navPath.append(subCategory)
            }
        }
        .navigationDestination(for: SubCategory.self) { subCategory in
            CreateNewJobView(category: category, subCategory: subCategory, navPath: $navPath)
        }
    }
}

struct CreateNewJobView: View {
    
    let category: Category
    let subCategory: SubCategory
    @Binding var navPath: NavigationPath
    
    var body: some View {
        Text("Create job view")
        Button("Return") {
            navPath.removeLast(navPath.count)
        }
    }
}


struct Category: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var subCategories: [SubCategory]
}

struct SubCategory: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

enum ViewTypes: Hashable {
    case categoryView
}
