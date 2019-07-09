//  This file was automatically generated and should not be edited.

import Apollo

public final class AllIssuesQuery: GraphQLQuery {
  public let operationDefinition =
    "query AllIssues {\n  allIssues {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n    likes\n    favorites\n  }\n}"

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
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites])
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
    }
  }
}

public final class IssueByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssueById($id: Int!) {\n  issueById(id: $id) {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n    likes\n    favorites\n  }\n}"

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
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites])
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
    }
  }
}

public final class IssuesByTypeQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssuesByType($type: String!) {\n  issuesByType(type: $type) {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n    likes\n    favorites\n  }\n}"

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
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites])
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
    }
  }
}

public final class IssuesByUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssuesByUser($userId: Int!) {\n  issuesByUser(userId: $userId) {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n    likes\n    favorites\n  }\n}"

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
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String, location: String? = nil, image: String? = nil, userId: Int? = nil, likes: Int? = nil, favorites: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId, "likes": likes, "favorites": favorites])
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
    }
  }
}

public final class CommentByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query CommentById($id: Int!) {\n  commentById(id: $id) {\n    __typename\n    body\n    userId\n    issueId\n  }\n}"

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
        GraphQLField("body", type: .nonNull(.scalar(String.self))),
        GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("issueId", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(body: String, userId: Int, issueId: Int) {
        self.init(unsafeResultMap: ["__typename": "Comment", "body": body, "userId": userId, "issueId": issueId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var body: String {
        get {
          return resultMap["body"]! as! String
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
    }
  }
}

public final class CommentsByIssueQuery: GraphQLQuery {
  public let operationDefinition =
    "query CommentsByIssue($issueId: Int!) {\n  commentsByIssue(issueId: $issueId) {\n    __typename\n    body\n    userId\n    issueId\n  }\n}"

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
        GraphQLField("body", type: .nonNull(.scalar(String.self))),
        GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("issueId", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(body: String, userId: Int, issueId: Int) {
        self.init(unsafeResultMap: ["__typename": "Comment", "body": body, "userId": userId, "issueId": issueId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var body: String {
        get {
          return resultMap["body"]! as! String
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
    "mutation CreateIssue($description: String, $image: String, $location: String, $userId: Int!, $title: String!, $type: String!, $likes: Int!, $favorites: Int!, $email: String, $phone: String, $alternatePhone: String, $group: String, $urgency: String, $sensitiveInfo: String, $campus: String, $area: String, $specificLocation: String, $roomNumber: String, $serviceAnimal: String, $impact: Boolean, $yourBuilding: String, $yourFloor: String, $yourRoom: String, $requestType: String, $issueBuilding: String, $issueFloor: String, $issueRoom: String, $serviceType: String, $fundCode: String, $topic: String, $name: String) {\n  createIssue(description: $description, image: $image, location: $location, userId: $userId, title: $title, type: $type, likes: $likes, favorites: $favorites, email: $email, phone: $phone, alternatePhone: $alternatePhone, group: $group, urgency: $urgency, sensitiveInfo: $sensitiveInfo, campus: $campus, area: $area, specificLocation: $specificLocation, roomNumber: $roomNumber, serviceAnimal: $serviceAnimal, impact: $impact, yourBuilding: $yourBuilding, yourFloor: $yourFloor, yourRoom: $yourRoom, requestType: $requestType, issueBuilding: $issueBuilding, issueFloor: $issueFloor, issueRoom: $issueRoom, serviceType: $serviceType, fundCode: $fundCode, topic: $topic, name: $name) {\n    __typename\n    id\n  }\n}"

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
  public var serviceAnimal: String?
  public var impact: Bool?
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

  public init(description: String? = nil, image: String? = nil, location: String? = nil, userId: Int, title: String, type: String, likes: Int, favorites: Int, email: String? = nil, phone: String? = nil, alternatePhone: String? = nil, group: String? = nil, urgency: String? = nil, sensitiveInfo: String? = nil, campus: String? = nil, area: String? = nil, specificLocation: String? = nil, roomNumber: String? = nil, serviceAnimal: String? = nil, impact: Bool? = nil, yourBuilding: String? = nil, yourFloor: String? = nil, yourRoom: String? = nil, requestType: String? = nil, issueBuilding: String? = nil, issueFloor: String? = nil, issueRoom: String? = nil, serviceType: String? = nil, fundCode: String? = nil, topic: String? = nil, name: String? = nil) {
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