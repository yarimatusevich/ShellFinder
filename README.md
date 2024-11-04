# ShellFinder

![shellfinder-icon](https://github.com/user-attachments/assets/f134f414-d9eb-498a-ac6f-820cfb64d826)

Shellfinder uses artificial intelligence to identify shellfish from photos of shells taken within the application. To identify a shell you must center the shell on the camera screen with the help of the displayed bounding box. When the shell is properly centered you can take a photo which is then processed through our AI model. The AI's best prediction is then returned and displayed on the screen. The app also features user authentication, cloud storage, and a user history (which displays previous identifications made by the user).

![Capture Demo](Media/capture.mp4)

![Discover Page](Media/discover.mp4)

![Profiel Page](Media/profile.mp4)

## How was the Artificial Intelligence trained?

The Shellfinder artificial intelligence was trained using thousands of photos of shells which my partner and I collected over the course of 2 years. The model was trained in Roboflow and is able to identify the shells present within the app (the complete list of shells which the AI is able to identify can be found with in the app discover page). However, despite this our dataset is still quite small to make the AI predictions 100% accurate, so all identifications should not be taken at face value.

## What is used for cloud storage?

The app utilizes cloud Firestore in order to store user data and to retrieve said data. Additionally, all the shellfish species which the app is able to identify are stored in the cloud and retrieved upon launch of the app. This allows shells to be removed and added seamlessly. When the app queries for the shellfish the API returns a JSON which is then decoded into Shellfish objects. These objects are then passed to the views of the app which use them. History entries for the user history are processed in the same way.

## What is used for authentification?

The authentication of the app is done using the FireAuth API. Users are able to register an email, a username, and a password. By registering the user is able to see statistics regarding their use of the app, such as the shells they have identified and the number of identifications they have made.
