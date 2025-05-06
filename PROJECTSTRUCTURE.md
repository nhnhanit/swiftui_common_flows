# SwiftUI_0325 Project Structure

```
SwiftUI_0325
│
├── App
│   ├── ContentView.swift
│   ├── EnvironmentContainer.swift
│   ├── RootView.swift
│   └── SwiftUI_0325App.swift
│
├── Coordinators
│   ├── AppCoordinator.swift
│   └── PreviewAppCoordinator.swift
│
├── Core
│   ├── Extensions
│   ├── Managers
│   │   └── SessionManager.swift
│   ├── Networking
│   │   ├── APIRequest.swift
│   │   ├── AuthorizedRequestBuilder.swift
│   │   ├── DefaultNetworkService.swift
│   │   ├── NetworkError.swift
│   │   ├── NetworkLogger.swift
│   │   └── NetworkService.swift
│   └── Utils
│   │    ├── Constants.swift
│   │    ├── ImageLoader.swift
│   │    └── Utils.swift
│   │
│   ├── CustomViews
│       ├── AppAlert
│       │   ├── AppAlert.swift
│       │   ├── AppAlertManager.swift
│       │   ├── AppAlertView.swift
│       │   └── PreviewAppAlertManager.swift
│       ├── EmptyStateView.swift
│       ├── LoadingView.swift
│       └── TopBarView.swift
│
├── Modules
│   ├── Authentication
│   │
│   ├── MainTab
│   │   ├── MainTabModule.swift
│   │   ├── MainTabView.swift
│   │   └── MainTabViewModel.swift
│   │
│   ├── Post
│   │   ├── Builders
│   │   │   └── PostsListModule.swift
│   │   ├── Coordinators
│   │   │   ├── PostCoordinator.swift
│   │   │   ├── PostRoute.swift
│   │   │   └── PostRouteViewBuilder.swift
│   │   ├── Models
│   │   │   ├── Post.swift
│   │   │   ├── PostComment.swift
│   │   │   ├── RealmPost.swift
│   │   │   └── UserInfo.swift
│   │   ├── PreviewMocks
│   │   │   ├── PreviewPostRepository.swift
│   │   │   └── SamplePosts.swift
│   │   ├── Repositories
│   │   │   ├── PostAPI.swift
│   │   │   ├── PostLocalStore.swift
│   │   │   └── PostRepository.swift
│   │   ├── ViewModels
│   │   │   ├── CellViewModels/
│   │   │   ├── PostDetailViewModel.swift
│   │   │   └── PostsListViewModel.swift
│   │   └── Views
│   │       ├── CellViews/
│   │       ├── PostDetailView.swift
│   │       └── PostsListView.swift
│   │
│   ├── Setting
│   └── Splash
```
