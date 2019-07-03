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