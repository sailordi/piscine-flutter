import Cocoa
import FlutterMacOS
import GoogleMaps

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    GMSServices.provideAPIKey("YOUR-API-KEY")

    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
