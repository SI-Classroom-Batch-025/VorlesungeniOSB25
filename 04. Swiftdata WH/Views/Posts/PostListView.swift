//
//  PostListView.swift
//  04. Swiftdata WH
//
//  Created by Felix B on 04.04.25.
//

import SwiftUI
import SwiftData

struct PostListView: View {
    
    @Binding var loggedInUser: AppUser?
    
    @Environment(\.modelContext) private var context
    
    @State private var showAddSheet = false
    @State private var titleInput = ""
    @State private var contentInput = ""
    @State private var imageInput = ""
    
    @Query(sort: \Post.timestamp) private var posts: [Post]
    
    var body: some View {
        NavigationStack {
            VStack {
                if posts.isEmpty {
                    Text("Noch gibt es keine Posts!")
                        .font(.largeTitle)
                        .foregroundStyle(.yellow)
                } else {
                    List(posts) { post in
                        NavigationLink {
                            PostDetailView(post: post, loggedInUser: $loggedInUser)
                        } label: {
                            PostListItem(post: post)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(
                            .init(
                                top: 2,
                                leading: 0,
                                bottom: 2,
                                trailing: 0
                            )
                        )
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.purple.mix(with: .black, by: 0.4))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        loggedInUser = nil
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                sheetView()
            }
        }
        .tint(.yellow)
    }
    
    
    @ViewBuilder
    private func sheetView() -> some View {
        VStack(spacing: 15) {
            TextField("Titel", text: $titleInput)
                .textFieldStyle(.appStyle)
            TextField("Inhalt", text: $contentInput)
                .textFieldStyle(.appStyle)
            TextField("Image", text: $imageInput)
                .textFieldStyle(.appStyle)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            Button {
                createPost()
            } label: {
                Text("Posten")
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .buttonStyle(.appStyle)
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.purple.mix(with: .black, by: 0.2))
        .presentationDetents([.medium])
    }
    
    func createPost() {
        if titleInput.isEmpty || contentInput.isEmpty {
            return
        }
        let newPost = Post(title: titleInput, content: contentInput)
        if !imageInput.isEmpty {
            newPost.image = imageInput
        }
        context.insert(newPost)
        titleInput = ""
        contentInput = ""
        imageInput = ""
        showAddSheet = false
    }
}

#Preview {
    PostListView(loggedInUser: .constant(nil))
        .modelContainer(for: AppUser.self, inMemory: true)
}
