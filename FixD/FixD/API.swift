//  This file was automatically generated and should not be edited.

import Apollo

public final class AllIssuesQuery: GraphQLQuery {
  public let operationDefinition =
    "query AllIssues {\n  allIssues {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n  }\n}"

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
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("userId", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String? = nil, location: String? = nil, image: String? = nil, userId: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId])
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

      public var description: String? {
        get {
          return resultMap["description"] as? String
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
    }
  }
}

public final class IssueByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssueById($id: Int!) {\n  issueById(id: $id) {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n  }\n}"

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
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("userId", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String? = nil, location: String? = nil, image: String? = nil, userId: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId])
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

      public var description: String? {
        get {
          return resultMap["description"] as? String
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
    }
  }
}

public final class IssuesByTypeQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssuesByType($type: String!) {\n  issuesByType(type: $type) {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n  }\n}"

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
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("userId", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String? = nil, location: String? = nil, image: String? = nil, userId: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId])
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

      public var description: String? {
        get {
          return resultMap["description"] as? String
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
    }
  }
}

public final class IssuesByUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssuesByUser($userId: Int!) {\n  issuesByUser(userId: $userId) {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n  }\n}"

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
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("userId", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String? = nil, location: String? = nil, image: String? = nil, userId: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId])
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

      public var description: String? {
        get {
          return resultMap["description"] as? String
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

public final class IssueByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query IssueById {\n  allIssues {\n    __typename\n    id\n    title\n    description\n    location\n    image\n    userId\n  }\n}"

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
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
        GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, description: String, location: String, image: String, userId: Int) {
        self.init(unsafeResultMap: ["__typename": "Issue", "id": id, "title": title, "description": description, "location": location, "image": image, "userId": userId])
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

      public var title: String {
        get {
          return resultMap["title"]! as! String
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

      public var location: String {
        get {
          return resultMap["location"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location")
        }
      }

      public var image: String {
        get {
          return resultMap["image"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
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
    }
  }
}