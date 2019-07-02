
# Duke University OAuth Library for iOS

DukeOAuth is an OAuth library that allows you to interface with Duke University's OAuth service.  Authenticating with DukeOAuth opens a webview for a user to sign in with their netId. Upon success, an OAuth token is received and then stored on the device's keychain.

### Understanding OAuth at Duke

When you include this library into your app and call the authenticate() function, the app creates a ViewController with a webview
that makes a network request to a "mobile authorizer" server. The server redirects the request to a shibboleth page where the user
will enter in their credentials. Upon successful sibboleth login, the mobile authorizer server will then return back an access token (OAuth token)
and a session token. The access token is passed in the header of future network requests that require OAuth authentication, where the session token (along with the access token) is only passed in the header for a request back to the mobile authorizer server when calling the refreshToken() function to recieve a new OAuth token. The session token is used here as an extra layer of security to validate the app. 

### How to Use DukeOAuth

Described below are sample implementations and descriptions for useful functions:

Get an instance of the OAuth service.
```swift
var oAuthService: OAuthService?
...
oAuthService = OAuthService.shared
```

Set the OAuth client name for the service to use when requesting an OAuth token or logging out. This needs to be set first before calling the authenticate() function.
```swift
setClientName(oAuthClientName: "clientName")
```

Open a new view controller with a webview that opens a shibboleth page for the user to login with their netId.
On success, an OAuth token is received and stored on the device's keychain. 
```swift
oAuthService?.authenticate(navController: navController) { success in
    print(success)
}
```

Check to see if the user has received an OAuth token.
```swift
oAuthService!.isAuthenticated()
```

Retrieve the OAuth token stored on the device's keychain.
```swift
oAuthService!.getAccessToken()
```

Request a new OAuth token when the current token is expired. 
```swift
oAuthService?.refreshToken(navController: self.navigationController!) { success, statusCode in
    print(success)
    print(statusCode)
}
```

Remove the OAuth token from the keychain.
```swift
oAuthService?.logout()
```

### Passing the OAuth Token in a Network Request

The request header information required for OAuth is as follows:

"Authorization" : "Bearer <token>"

### Do Not Change!

Do not change the Debug and Release version names of your project. There are #ifdef preprocessor macros to change 
the mobile authorizer server url based on build environment at runtime.
