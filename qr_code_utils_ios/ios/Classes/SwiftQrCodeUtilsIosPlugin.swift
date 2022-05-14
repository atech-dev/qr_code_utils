import Flutter
import UIKit

public class SwiftQrCodeUtilsIosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dev.atech/qr_code_utils", binaryMessenger: registrar.messenger())
    let instance = SwiftQrCodeUtilsIosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "decoder") {
      guard let args = call.arguments else {
        result("")
        return;
      };

      let filePath: String = (args as! [String: Any])["file"] as! String;
      let qrCodeData = messageFromQRCodeImage(path: filePath);
      result(qrCodeData);
    }
    result("iOS " + UIDevice.current.systemVersion)
  }

  public func messageFromQRCodeImage(path: String) -> String? {

    let image: UIImage? = UIImage.init(contentsOfFile: path);
    if (image == nil) {
      return nil;
    }

    let ciContext: CIContext = CIContext.init();
    let ciDetector: CIDetector? = CIDetector.init(ofType: CIDetectorTypeQRCode, context: ciContext, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh]);
    let ciImage: CIImage? = CIImage.init(image: image!);
    let ciFeature: [CIFeature]? = ciDetector?.features(in: ciImage!);

    if (ciFeature?.count == 0) {
      return nil;
    }

    for feature in ciFeature! {
      if (feature is CIQRCodeFeature) {
        return (feature as! CIQRCodeFeature).messageString;
      }
    }

    return nil;

  }
}
