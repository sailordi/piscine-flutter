# favorite_images

In the first part of the exercise, you will create an `appbar` with an **IconButton**.
When the user clicks on the button, they should see two options:

- Open the camera.
- Access the gallery.

> Note: Your camera must work both in `iOS` and `Android`.

You should use the `image_picker` package to implement this functionality. Additionally, you should show a `"No images selected"` message if no images have been loaded.

> Note: Don't forget to add the special keys to the Info.plist file under the iOS folder to access the camera and gallery, see the [example](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/AboutInformationPropertyListFiles.html).

<center>
<img src="./resources/imageLibrary.01.png?raw=true" style = "width: 210px !important; height: 420px !important;"/>
</center>

### Image Gallery

In the second part of the exercise, you will add the following functionalities:

- Add the selected image or taken picture to a `GridList` to display all the images in your collection.
- Implement the ability for the user to `tap on an image` and view the entire picture, providing a better user experience.
- Add the ability for the user to `zoom in and out` of the image, allowing them to see the image details more clearly.

<center>
<img src="./resources/imageLibrary.02.png?raw=true" style = "width: 210px !important; height: 420px !important;"/>
<img src="./resources/imageLibrary.03.png?raw=true" style = "width: 210px !important; height: 420px !important;"/>
</center>