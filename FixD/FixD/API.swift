//  This file was automatically generated and should not be edited.

import Apollo

public final class AllIssuesQuery: GraphQLQuery {
  public let operationDefinition =
    "query AllIssues {\n  allIssues {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n    likes\n    favorites\n    createdAt\n    type\n    user {\n      __typename\n      id\n      name\n      netid\n      phone\n      picture\n    }\n    comments {\n      __typename\n      id\n      body\n      issueId\n      userId\n      image\n      createdAt\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allIssues", type: .nonNull(.list(.nonNull(.object(AllIssue.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allIssues: [AllIssue]) {
      self.init(unsafeResultMap: ["__typename": "Query", "allIssues": allIssues.map { (value: AllIssue) -> ResultMap in value.resultMap }])
    }

    /// Return all Issues
    public var allIssues: [AllIssue] {
      get {
        return (resultMap["allIssues"] as! [ResultMap]).map { (value: ResultMap) -> AllIssue in AllIssue(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: AllIssue) -> ResultMap in value.resultMap }, forKey: "allIssues")
      }
    }

    public struct AllIssue: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("userId", type: .scalar(Int.self)),
        GraphQLField("likes", type: .scalar(Int.self)),
        GraphQLField("favorites", type: .scalar(Int.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("comments", type: .list(.nonNull(.object(Comment.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil, createdAt: String? = nil, type: String? = nil, user: User, comments: [Comment]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites, "createdAt": createdAt, "type": type, "user": user.resultMap, "comments": comments.flatMap { (value: [Comment]) -> [ResultMap] in value.map { (value: Comment) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var location: String? {
        get {
          return resultMap["location"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var userId: Int? {
        get {
          return resultMap["userId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var likes: Int? {
        get {
          return resultMap["likes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var favorites: Int? {
        get {
          return resultMap["favorites"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "favorites")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var comments: [Comment]? {
        get {
          return (resultMap["comments"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Comment] in value.map { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Comment]) -> [ResultMap] in value.map { (value: Comment) -> ResultMap in value.resultMap } }, forKey: "comments")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("netid", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("picture", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, netid: String, phone: String? = nil, picture: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "netid": netid, "phone": phone, "picture": picture])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var netid: String {
          get {
            return resultMap["netid"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "netid")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var picture: String? {
          get {
            return resultMap["picture"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "picture")
          }
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes = ["Comment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("body", type: .scalar(String.self)),
          GraphQLField("issueId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, body: String? = nil, issueId: Int, userId: Int, image: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "body": body, "issueId": issueId, "userId": userId, "image": image, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var body: String? {
          get {
            return resultMap["body"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "body")
          }
        }

        public var issueId: Int {
          get {
            return resultMap["issueId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "issueId")
          }
        }

        public var userId: Int {
          get {
            return resultMap["userId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class IssueByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssueById($id: Int!) {\n  issueById(id: $id) {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n    likes\n    favorites\n    createdAt\n    type\n    user {\n      __typename\n      id\n      name\n      netid\n      phone\n      picture\n    }\n    comments {\n      __typename\n      id\n      body\n      issueId\n      userId\n      image\n      createdAt\n    }\n  }\n}"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("issueById", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(IssueById.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(issueById: IssueById) {
      self.init(unsafeResultMap: ["__typename": "Query", "issueById": issueById.resultMap])
    }

    /// Return the Issue by ID
    public var issueById: IssueById {
      get {
        return IssueById(unsafeResultMap: resultMap["issueById"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "issueById")
      }
    }

    public struct IssueById: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("userId", type: .scalar(Int.self)),
        GraphQLField("likes", type: .scalar(Int.self)),
        GraphQLField("favorites", type: .scalar(Int.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("comments", type: .list(.nonNull(.object(Comment.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil, createdAt: String? = nil, type: String? = nil, user: User, comments: [Comment]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites, "createdAt": createdAt, "type": type, "user": user.resultMap, "comments": comments.flatMap { (value: [Comment]) -> [ResultMap] in value.map { (value: Comment) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var location: String? {
        get {
          return resultMap["location"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var userId: Int? {
        get {
          return resultMap["userId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var likes: Int? {
        get {
          return resultMap["likes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var favorites: Int? {
        get {
          return resultMap["favorites"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "favorites")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var comments: [Comment]? {
        get {
          return (resultMap["comments"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Comment] in value.map { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Comment]) -> [ResultMap] in value.map { (value: Comment) -> ResultMap in value.resultMap } }, forKey: "comments")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("netid", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("picture", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, netid: String, phone: String? = nil, picture: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "netid": netid, "phone": phone, "picture": picture])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var netid: String {
          get {
            return resultMap["netid"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "netid")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var picture: String? {
          get {
            return resultMap["picture"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "picture")
          }
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes = ["Comment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("body", type: .scalar(String.self)),
          GraphQLField("issueId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, body: String? = nil, issueId: Int, userId: Int, image: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "body": body, "issueId": issueId, "userId": userId, "image": image, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var body: String? {
          get {
            return resultMap["body"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "body")
          }
        }

        public var issueId: Int {
          get {
            return resultMap["issueId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "issueId")
          }
        }

        public var userId: Int {
          get {
            return resultMap["userId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class IssuesByTypeQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssuesByType($type: String!) {\n  issuesByType(type: $type) {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n    likes\n    favorites\n    createdAt\n    type\n    user {\n      __typename\n      id\n      name\n      netid\n      phone\n      picture\n    }\n    comments {\n      __typename\n      id\n      body\n      issueId\n      userId\n      image\n      createdAt\n    }\n  }\n}"

  public var type: String

  public init(type: String) {
    self.type = type
  }

  public var variables: GraphQLMap? {
    return ["type": type]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("issuesByType", arguments: ["type": GraphQLVariable("type")], type: .nonNull(.list(.nonNull(.object(IssuesByType.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(issuesByType: [IssuesByType]) {
      self.init(unsafeResultMap: ["__typename": "Query", "issuesByType": issuesByType.map { (value: IssuesByType) -> ResultMap in value.resultMap }])
    }

    /// Return all Issues of a specific Type
    public var issuesByType: [IssuesByType] {
      get {
        return (resultMap["issuesByType"] as! [ResultMap]).map { (value: ResultMap) -> IssuesByType in IssuesByType(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: IssuesByType) -> ResultMap in value.resultMap }, forKey: "issuesByType")
      }
    }

    public struct IssuesByType: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("userId", type: .scalar(Int.self)),
        GraphQLField("likes", type: .scalar(Int.self)),
        GraphQLField("favorites", type: .scalar(Int.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("comments", type: .list(.nonNull(.object(Comment.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil, createdAt: String? = nil, type: String? = nil, user: User, comments: [Comment]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites, "createdAt": createdAt, "type": type, "user": user.resultMap, "comments": comments.flatMap { (value: [Comment]) -> [ResultMap] in value.map { (value: Comment) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var location: String? {
        get {
          return resultMap["location"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var userId: Int? {
        get {
          return resultMap["userId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var likes: Int? {
        get {
          return resultMap["likes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var favorites: Int? {
        get {
          return resultMap["favorites"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "favorites")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var comments: [Comment]? {
        get {
          return (resultMap["comments"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Comment] in value.map { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Comment]) -> [ResultMap] in value.map { (value: Comment) -> ResultMap in value.resultMap } }, forKey: "comments")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("netid", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("picture", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, netid: String, phone: String? = nil, picture: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "netid": netid, "phone": phone, "picture": picture])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var netid: String {
          get {
            return resultMap["netid"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "netid")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var picture: String? {
          get {
            return resultMap["picture"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "picture")
          }
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes = ["Comment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("body", type: .scalar(String.self)),
          GraphQLField("issueId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, body: String? = nil, issueId: Int, userId: Int, image: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "body": body, "issueId": issueId, "userId": userId, "image": image, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var body: String? {
          get {
            return resultMap["body"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "body")
          }
        }

        public var issueId: Int {
          get {
            return resultMap["issueId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "issueId")
          }
        }

        public var userId: Int {
          get {
            return resultMap["userId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class IssuesByUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssuesByUser($userId: Int!) {\n  issuesByUser(userId: $userId) {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n    likes\n    favorites\n    createdAt\n    type\n    user {\n      __typename\n      id\n      name\n      netid\n      phone\n      picture\n    }\n    comments {\n      __typename\n      id\n      body\n      issueId\n      userId\n      image\n      createdAt\n    }\n  }\n}"

  public var userId: Int

  public init(userId: Int) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("issuesByUser", arguments: ["userId": GraphQLVariable("userId")], type: .nonNull(.list(.nonNull(.object(IssuesByUser.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(issuesByUser: [IssuesByUser]) {
      self.init(unsafeResultMap: ["__typename": "Query", "issuesByUser": issuesByUser.map { (value: IssuesByUser) -> ResultMap in value.resultMap }])
    }

    /// Return all Issues of a specific User
    public var issuesByUser: [IssuesByUser] {
      get {
        return (resultMap["issuesByUser"] as! [ResultMap]).map { (value: ResultMap) -> IssuesByUser in IssuesByUser(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: IssuesByUser) -> ResultMap in value.resultMap }, forKey: "issuesByUser")
      }
    }

    public struct IssuesByUser: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("userId", type: .scalar(Int.self)),
        GraphQLField("likes", type: .scalar(Int.self)),
        GraphQLField("favorites", type: .scalar(Int.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("comments", type: .list(.nonNull(.object(Comment.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil, createdAt: String? = nil, type: String? = nil, user: User, comments: [Comment]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites, "createdAt": createdAt, "type": type, "user": user.resultMap, "comments": comments.flatMap { (value: [Comment]) -> [ResultMap] in value.map { (value: Comment) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var location: String? {
        get {
          return resultMap["location"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var userId: Int? {
        get {
          return resultMap["userId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var likes: Int? {
        get {
          return resultMap["likes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var favorites: Int? {
        get {
          return resultMap["favorites"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "favorites")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var comments: [Comment]? {
        get {
          return (resultMap["comments"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Comment] in value.map { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Comment]) -> [ResultMap] in value.map { (value: Comment) -> ResultMap in value.resultMap } }, forKey: "comments")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("netid", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("picture", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, netid: String, phone: String? = nil, picture: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "netid": netid, "phone": phone, "picture": picture])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var netid: String {
          get {
            return resultMap["netid"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "netid")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var picture: String? {
          get {
            return resultMap["picture"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "picture")
          }
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes = ["Comment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("body", type: .scalar(String.self)),
          GraphQLField("issueId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, body: String? = nil, issueId: Int, userId: Int, image: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "body": body, "issueId": issueId, "userId": userId, "image": image, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var body: String? {
          get {
            return resultMap["body"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "body")
          }
        }

        public var issueId: Int {
          get {
            return resultMap["issueId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "issueId")
          }
        }

        public var userId: Int {
          get {
            return resultMap["userId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class CommentByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query CommentById($id: Int!) {\n  commentById(id: $id) {\n    __typename\n    body\n    userId\n    issueId\n    createdAt\n    image\n    user {\n      __typename\n      id\n      name\n      netid\n      phone\n      picture\n    }\n    issue {\n      __typename\n      id\n      title\n      description\n      location\n      image\n      userId\n      likes\n      favorites\n      createdAt\n    }\n  }\n}"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("commentById", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(CommentById.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(commentById: CommentById) {
      self.init(unsafeResultMap: ["__typename": "Query", "commentById": commentById.resultMap])
    }

    /// Return Comment of specific ID
    public var commentById: CommentById {
      get {
        return CommentById(unsafeResultMap: resultMap["commentById"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "commentById")
      }
    }

    public struct CommentById: GraphQLSelectionSet {
      public static let possibleTypes = ["Comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("body", type: .scalar(String.self)),
        GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("issueId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("issue", type: .nonNull(.object(Issue.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(body: String? = nil, userId: Int, issueId: Int, createdAt: String? = nil, image: String? = nil, user: User, issue: Issue) {
        self.init(unsafeResultMap: ["__typename": "Comment", "body": body, "userId": userId, "issueId": issueId, "createdAt": createdAt, "image": image, "user": user.resultMap, "issue": issue.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var body: String? {
        get {
          return resultMap["body"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "body")
        }
      }

      public var userId: Int {
        get {
          return resultMap["userId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var issueId: Int {
        get {
          return resultMap["issueId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "issueId")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var issue: Issue {
        get {
          return Issue(unsafeResultMap: resultMap["issue"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "issue")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("netid", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("picture", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, netid: String, phone: String? = nil, picture: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "netid": netid, "phone": phone, "picture": picture])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var netid: String {
          get {
            return resultMap["netid"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "netid")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var picture: String? {
          get {
            return resultMap["picture"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "picture")
          }
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .scalar(String.self)),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("userId", type: .scalar(Int.self)),
          GraphQLField("likes", type: .scalar(Int.self)),
          GraphQLField("favorites", type: .scalar(Int.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var location: String? {
          get {
            return resultMap["location"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "location")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var userId: Int? {
          get {
            return resultMap["userId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var likes: Int? {
          get {
            return resultMap["likes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likes")
          }
        }

        public var favorites: Int? {
          get {
            return resultMap["favorites"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "favorites")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class CommentsByIssueQuery: GraphQLQuery {
  public let operationDefinition =
    "query CommentsByIssue($issueId: Int!) {\n  commentsByIssue(issueId: $issueId) {\n    __typename\n    body\n    userId\n    issueId\n    createdAt\n    image\n    user {\n      __typename\n      id\n      name\n      netid\n      phone\n      picture\n    }\n    issue {\n      __typename\n      id\n      title\n      description\n      location\n      image\n      userId\n      likes\n      favorites\n      createdAt\n    }\n  }\n}"

  public var issueId: Int

  public init(issueId: Int) {
    self.issueId = issueId
  }

  public var variables: GraphQLMap? {
    return ["issueId": issueId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("commentsByIssue", arguments: ["issueId": GraphQLVariable("issueId")], type: .nonNull(.list(.nonNull(.object(CommentsByIssue.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(commentsByIssue: [CommentsByIssue]) {
      self.init(unsafeResultMap: ["__typename": "Query", "commentsByIssue": commentsByIssue.map { (value: CommentsByIssue) -> ResultMap in value.resultMap }])
    }

    /// Return Comments of a Specific Issue
    public var commentsByIssue: [CommentsByIssue] {
      get {
        return (resultMap["commentsByIssue"] as! [ResultMap]).map { (value: ResultMap) -> CommentsByIssue in CommentsByIssue(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: CommentsByIssue) -> ResultMap in value.resultMap }, forKey: "commentsByIssue")
      }
    }

    public struct CommentsByIssue: GraphQLSelectionSet {
      public static let possibleTypes = ["Comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("body", type: .scalar(String.self)),
        GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("issueId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("issue", type: .nonNull(.object(Issue.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(body: String? = nil, userId: Int, issueId: Int, createdAt: String? = nil, image: String? = nil, user: User, issue: Issue) {
        self.init(unsafeResultMap: ["__typename": "Comment", "body": body, "userId": userId, "issueId": issueId, "createdAt": createdAt, "image": image, "user": user.resultMap, "issue": issue.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var body: String? {
        get {
          return resultMap["body"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "body")
        }
      }

      public var userId: Int {
        get {
          return resultMap["userId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var issueId: Int {
        get {
          return resultMap["issueId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "issueId")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var issue: Issue {
        get {
          return Issue(unsafeResultMap: resultMap["issue"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "issue")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("netid", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("picture", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, netid: String, phone: String? = nil, picture: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "netid": netid, "phone": phone, "picture": picture])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var netid: String {
          get {
            return resultMap["netid"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "netid")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var picture: String? {
          get {
            return resultMap["picture"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "picture")
          }
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .scalar(String.self)),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("userId", type: .scalar(Int.self)),
          GraphQLField("likes", type: .scalar(Int.self)),
          GraphQLField("favorites", type: .scalar(Int.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var location: String? {
          get {
            return resultMap["location"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "location")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var userId: Int? {
          get {
            return resultMap["userId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var likes: Int? {
          get {
            return resultMap["likes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likes")
          }
        }

        public var favorites: Int? {
          get {
            return resultMap["favorites"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "favorites")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class UserByNetIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query UserByNetId($netid: String!) {\n  userByNetId(netid: $netid) {\n    __typename\n    id\n    name\n    netid\n    phone\n    picture\n    issues {\n      __typename\n      id\n      title\n      description\n      location\n      image\n      userId\n      likes\n      favorites\n      createdAt\n    }\n  }\n}"

  public var netid: String

  public init(netid: String) {
    self.netid = netid
  }

  public var variables: GraphQLMap? {
    return ["netid": netid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("userByNetId", arguments: ["netid": GraphQLVariable("netid")], type: .nonNull(.object(UserByNetId.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userByNetId: UserByNetId) {
      self.init(unsafeResultMap: ["__typename": "Query", "userByNetId": userByNetId.resultMap])
    }

    /// Return User From a Specific NetId
    public var userByNetId: UserByNetId {
      get {
        return UserByNetId(unsafeResultMap: resultMap["userByNetId"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "userByNetId")
      }
    }

    public struct UserByNetId: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("netid", type: .nonNull(.scalar(String.self))),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("picture", type: .scalar(String.self)),
        GraphQLField("issues", type: .list(.nonNull(.object(Issue.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, netid: String, phone: String? = nil, picture: String? = nil, issues: [Issue]? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "netid": netid, "phone": phone, "picture": picture, "issues": issues.flatMap { (value: [Issue]) -> [ResultMap] in value.map { (value: Issue) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var netid: String {
        get {
          return resultMap["netid"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "netid")
        }
      }

      public var phone: String? {
        get {
          return resultMap["phone"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phone")
        }
      }

      public var picture: String? {
        get {
          return resultMap["picture"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "picture")
        }
      }

      public var issues: [Issue]? {
        get {
          return (resultMap["issues"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Issue] in value.map { (value: ResultMap) -> Issue in Issue(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Issue]) -> [ResultMap] in value.map { (value: Issue) -> ResultMap in value.resultMap } }, forKey: "issues")
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .scalar(String.self)),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("userId", type: .scalar(Int.self)),
          GraphQLField("likes", type: .scalar(Int.self)),
          GraphQLField("favorites", type: .scalar(Int.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var location: String? {
          get {
            return resultMap["location"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "location")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var userId: Int? {
          get {
            return resultMap["userId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var likes: Int? {
          get {
            return resultMap["likes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likes")
          }
        }

        public var favorites: Int? {
          get {
            return resultMap["favorites"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "favorites")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class UserByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query UserById($id: Int!) {\n  userById(id: $id) {\n    __typename\n    id\n    name\n    netid\n    phone\n    picture\n    issues {\n      __typename\n      id\n      title\n      description\n      location\n      image\n      userId\n      likes\n      favorites\n      createdAt\n    }\n  }\n}"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("userById", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(UserById.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userById: UserById) {
      self.init(unsafeResultMap: ["__typename": "Query", "userById": userById.resultMap])
    }

    /// Return User of Specific ID
    public var userById: UserById {
      get {
        return UserById(unsafeResultMap: resultMap["userById"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "userById")
      }
    }

    public struct UserById: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("netid", type: .nonNull(.scalar(String.self))),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("picture", type: .scalar(String.self)),
        GraphQLField("issues", type: .list(.nonNull(.object(Issue.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, netid: String, phone: String? = nil, picture: String? = nil, issues: [Issue]? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "netid": netid, "phone": phone, "picture": picture, "issues": issues.flatMap { (value: [Issue]) -> [ResultMap] in value.map { (value: Issue) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var netid: String {
        get {
          return resultMap["netid"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "netid")
        }
      }

      public var phone: String? {
        get {
          return resultMap["phone"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phone")
        }
      }

      public var picture: String? {
        get {
          return resultMap["picture"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "picture")
        }
      }

      public var issues: [Issue]? {
        get {
          return (resultMap["issues"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Issue] in value.map { (value: ResultMap) -> Issue in Issue(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Issue]) -> [ResultMap] in value.map { (value: Issue) -> ResultMap in value.resultMap } }, forKey: "issues")
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .scalar(String.self)),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("userId", type: .scalar(Int.self)),
          GraphQLField("likes", type: .scalar(Int.self)),
          GraphQLField("favorites", type: .scalar(Int.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var location: String? {
          get {
            return resultMap["location"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "location")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var userId: Int? {
          get {
            return resultMap["userId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var likes: Int? {
          get {
            return resultMap["likes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likes")
          }
        }

        public var favorites: Int? {
          get {
            return resultMap["favorites"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "favorites")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateUser($name: String!, $netid: String!, $phone: String!, $picture: String!) {\n  createUser(name: $name, netid: $netid, phone: $phone, picture: $picture) {\n    __typename\n    id\n    name\n    netid\n    phone\n    picture\n  }\n}"

  public var name: String
  public var netid: String
  public var phone: String
  public var picture: String

  public init(name: String, netid: String, phone: String, picture: String) {
    self.name = name
    self.netid = netid
    self.phone = phone
    self.picture = picture
  }

  public var variables: GraphQLMap? {
    return ["name": name, "netid": netid, "phone": phone, "picture": picture]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["name": GraphQLVariable("name"), "netid": GraphQLVariable("netid"), "phone": GraphQLVariable("phone"), "picture": GraphQLVariable("picture")], type: .nonNull(.object(CreateUser.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.resultMap])
    }

    public var createUser: CreateUser {
      get {
        return CreateUser(unsafeResultMap: resultMap["createUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("netid", type: .nonNull(.scalar(String.self))),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("picture", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, netid: String, phone: String? = nil, picture: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "netid": netid, "phone": phone, "picture": picture])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var netid: String {
        get {
          return resultMap["netid"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "netid")
        }
      }

      public var phone: String? {
        get {
          return resultMap["phone"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phone")
        }
      }

      public var picture: String? {
        get {
          return resultMap["picture"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "picture")
        }
      }
    }
  }
}

public final class CreateCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateComment($body: String!, $image: String!, $userId: Int!, $issueId: Int!) {\n  createComment(body: $body, image: $image, userId: $userId, issueId: $issueId) {\n    __typename\n    id\n    body\n  }\n}"

  public var body: String
  public var image: String
  public var userId: Int
  public var issueId: Int

  public init(body: String, image: String, userId: Int, issueId: Int) {
    self.body = body
    self.image = image
    self.userId = userId
    self.issueId = issueId
  }

  public var variables: GraphQLMap? {
    return ["body": body, "image": image, "userId": userId, "issueId": issueId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createComment", arguments: ["body": GraphQLVariable("body"), "image": GraphQLVariable("image"), "userId": GraphQLVariable("userId"), "issueId": GraphQLVariable("issueId")], type: .nonNull(.object(CreateComment.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createComment: CreateComment) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createComment": createComment.resultMap])
    }

    public var createComment: CreateComment {
      get {
        return CreateComment(unsafeResultMap: resultMap["createComment"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createComment")
      }
    }

    public struct CreateComment: GraphQLSelectionSet {
      public static let possibleTypes = ["Comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("body", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, body: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "body": body])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var body: String? {
        get {
          return resultMap["body"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "body")
        }
      }
    }
  }
}

public final class AddLikeToIssueMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation AddLikeToIssue($id: Int!) {\n  addLikeToIssue(id: $id) {\n    __typename\n    id\n    likes\n  }\n}"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addLikeToIssue", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(AddLikeToIssue.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addLikeToIssue: AddLikeToIssue) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addLikeToIssue": addLikeToIssue.resultMap])
    }

    public var addLikeToIssue: AddLikeToIssue {
      get {
        return AddLikeToIssue(unsafeResultMap: resultMap["addLikeToIssue"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "addLikeToIssue")
      }
    }

    public struct AddLikeToIssue: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("likes", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, likes: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "likes": likes])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var likes: Int? {
        get {
          return resultMap["likes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }
    }
  }
}

public final class AddFavoriteToIssueMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation AddFavoriteToIssue($id: Int!) {\n  addFavoriteToIssue(id: $id) {\n    __typename\n    id\n    favorites\n  }\n}"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addFavoriteToIssue", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(AddFavoriteToIssue.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addFavoriteToIssue: AddFavoriteToIssue) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addFavoriteToIssue": addFavoriteToIssue.resultMap])
    }

    public var addFavoriteToIssue: AddFavoriteToIssue {
      get {
        return AddFavoriteToIssue(unsafeResultMap: resultMap["addFavoriteToIssue"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "addFavoriteToIssue")
      }
    }

    public struct AddFavoriteToIssue: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("favorites", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, favorites: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "favorites": favorites])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var favorites: Int? {
        get {
          return resultMap["favorites"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "favorites")
        }
      }
    }
  }
}

public final class DeleteLikeFromIssueMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation DeleteLikeFromIssue($id: Int!) {\n  deleteLikeFromIssue(id: $id) {\n    __typename\n    id\n    likes\n  }\n}"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteLikeFromIssue", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(DeleteLikeFromIssue.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteLikeFromIssue: DeleteLikeFromIssue) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteLikeFromIssue": deleteLikeFromIssue.resultMap])
    }

    public var deleteLikeFromIssue: DeleteLikeFromIssue {
      get {
        return DeleteLikeFromIssue(unsafeResultMap: resultMap["deleteLikeFromIssue"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "deleteLikeFromIssue")
      }
    }

    public struct DeleteLikeFromIssue: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("likes", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, likes: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "likes": likes])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var likes: Int? {
        get {
          return resultMap["likes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }
    }
  }
}

public final class DeleteFavoriteFromIssueMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation DeleteFavoriteFromIssue($id: Int!) {\n  deleteFavoriteFromIssue(id: $id) {\n    __typename\n    id\n    favorites\n  }\n}"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteFavoriteFromIssue", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(DeleteFavoriteFromIssue.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteFavoriteFromIssue: DeleteFavoriteFromIssue) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteFavoriteFromIssue": deleteFavoriteFromIssue.resultMap])
    }

    public var deleteFavoriteFromIssue: DeleteFavoriteFromIssue {
      get {
        return DeleteFavoriteFromIssue(unsafeResultMap: resultMap["deleteFavoriteFromIssue"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "deleteFavoriteFromIssue")
      }
    }

    public struct DeleteFavoriteFromIssue: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("favorites", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, favorites: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "favorites": favorites])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var favorites: Int? {
        get {
          return resultMap["favorites"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "favorites")
        }
      }
    }
  }
}

public final class CreateIssueMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateIssue($description: String, $image: String, $location: String, $userId: Int!, $title: String!, $type: String!, $likes: Int!, $favorites: Int!, $email: String, $phone: String, $alternatePhone: String, $group: String, $urgency: String, $sensitiveInfo: String, $campus: String, $area: String, $specificLocation: String, $roomNumber: String, $serviceAnimal: Boolean, $impact: String, $yourBuilding: String, $yourFloor: String, $yourRoom: String, $requestType: String, $issueBuilding: String, $issueFloor: String, $issueRoom: String, $serviceType: String, $fundCode: String, $topic: String, $name: String) {\n  createIssue(description: $description, image: $image, location: $location, userId: $userId, title: $title, type: $type, likes: $likes, favorites: $favorites, email: $email, phone: $phone, alternatePhone: $alternatePhone, group: $group, urgency: $urgency, sensitiveInfo: $sensitiveInfo, campus: $campus, area: $area, specificLocation: $specificLocation, roomNumber: $roomNumber, serviceAnimal: $serviceAnimal, impact: $impact, yourBuilding: $yourBuilding, yourFloor: $yourFloor, yourRoom: $yourRoom, requestType: $requestType, issueBuilding: $issueBuilding, issueFloor: $issueFloor, issueRoom: $issueRoom, serviceType: $serviceType, fundCode: $fundCode, topic: $topic, name: $name) {\n    __typename\n    id\n  }\n}"

  public var description: String?
  public var image: String?
  public var location: String?
  public var userId: Int
  public var title: String
  public var type: String
  public var likes: Int
  public var favorites: Int
  public var email: String?
  public var phone: String?
  public var alternatePhone: String?
  public var group: String?
  public var urgency: String?
  public var sensitiveInfo: String?
  public var campus: String?
  public var area: String?
  public var specificLocation: String?
  public var roomNumber: String?
  public var serviceAnimal: Bool?
  public var impact: String?
  public var yourBuilding: String?
  public var yourFloor: String?
  public var yourRoom: String?
  public var requestType: String?
  public var issueBuilding: String?
  public var issueFloor: String?
  public var issueRoom: String?
  public var serviceType: String?
  public var fundCode: String?
  public var topic: String?
  public var name: String?

  public init(description: String? = nil, image: String? = nil, location: String? = nil, userId: Int, title: String, type: String, likes: Int, favorites: Int, email: String? = nil, phone: String? = nil, alternatePhone: String? = nil, group: String? = nil, urgency: String? = nil, sensitiveInfo: String? = nil, campus: String? = nil, area: String? = nil, specificLocation: String? = nil, roomNumber: String? = nil, serviceAnimal: Bool? = nil, impact: String? = nil, yourBuilding: String? = nil, yourFloor: String? = nil, yourRoom: String? = nil, requestType: String? = nil, issueBuilding: String? = nil, issueFloor: String? = nil, issueRoom: String? = nil, serviceType: String? = nil, fundCode: String? = nil, topic: String? = nil, name: String? = nil) {
    self.description = description
    self.image = image
    self.location = location
    self.userId = userId
    self.title = title
    self.type = type
    self.likes = likes
    self.favorites = favorites
    self.email = email
    self.phone = phone
    self.alternatePhone = alternatePhone
    self.group = group
    self.urgency = urgency
    self.sensitiveInfo = sensitiveInfo
    self.campus = campus
    self.area = area
    self.specificLocation = specificLocation
    self.roomNumber = roomNumber
    self.serviceAnimal = serviceAnimal
    self.impact = impact
    self.yourBuilding = yourBuilding
    self.yourFloor = yourFloor
    self.yourRoom = yourRoom
    self.requestType = requestType
    self.issueBuilding = issueBuilding
    self.issueFloor = issueFloor
    self.issueRoom = issueRoom
    self.serviceType = serviceType
    self.fundCode = fundCode
    self.topic = topic
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["description": description, "image": image, "location": location, "userId": userId, "title": title, "type": type, "likes": likes, "favorites": favorites, "email": email, "phone": phone, "alternatePhone": alternatePhone, "group": group, "urgency": urgency, "sensitiveInfo": sensitiveInfo, "campus": campus, "area": area, "specificLocation": specificLocation, "roomNumber": roomNumber, "serviceAnimal": serviceAnimal, "impact": impact, "yourBuilding": yourBuilding, "yourFloor": yourFloor, "yourRoom": yourRoom, "requestType": requestType, "issueBuilding": issueBuilding, "issueFloor": issueFloor, "issueRoom": issueRoom, "serviceType": serviceType, "fundCode": fundCode, "topic": topic, "name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createIssue", arguments: ["description": GraphQLVariable("description"), "image": GraphQLVariable("image"), "location": GraphQLVariable("location"), "userId": GraphQLVariable("userId"), "title": GraphQLVariable("title"), "type": GraphQLVariable("type"), "likes": GraphQLVariable("likes"), "favorites": GraphQLVariable("favorites"), "email": GraphQLVariable("email"), "phone": GraphQLVariable("phone"), "alternatePhone": GraphQLVariable("alternatePhone"), "group": GraphQLVariable("group"), "urgency": GraphQLVariable("urgency"), "sensitiveInfo": GraphQLVariable("sensitiveInfo"), "campus": GraphQLVariable("campus"), "area": GraphQLVariable("area"), "specificLocation": GraphQLVariable("specificLocation"), "roomNumber": GraphQLVariable("roomNumber"), "serviceAnimal": GraphQLVariable("serviceAnimal"), "impact": GraphQLVariable("impact"), "yourBuilding": GraphQLVariable("yourBuilding"), "yourFloor": GraphQLVariable("yourFloor"), "yourRoom": GraphQLVariable("yourRoom"), "requestType": GraphQLVariable("requestType"), "issueBuilding": GraphQLVariable("issueBuilding"), "issueFloor": GraphQLVariable("issueFloor"), "issueRoom": GraphQLVariable("issueRoom"), "serviceType": GraphQLVariable("serviceType"), "fundCode": GraphQLVariable("fundCode"), "topic": GraphQLVariable("topic"), "name": GraphQLVariable("name")], type: .nonNull(.object(CreateIssue.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createIssue: CreateIssue) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createIssue": createIssue.resultMap])
    }

    public var createIssue: CreateIssue {
      get {
        return CreateIssue(unsafeResultMap: resultMap["createIssue"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createIssue")
      }
    }

    public struct CreateIssue: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class DeleteIssueMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation DeleteIssue($id: Int!) {\n  deleteIssue(id: $id) {\n    __typename\n    id\n  }\n}"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteIssue", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(DeleteIssue.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteIssue: DeleteIssue) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteIssue": deleteIssue.resultMap])
    }

    public var deleteIssue: DeleteIssue {
      get {
        return DeleteIssue(unsafeResultMap: resultMap["deleteIssue"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "deleteIssue")
      }
    }

    public struct DeleteIssue: GraphQLSelectionSet {
      public static let possibleTypes = ["Issue"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}