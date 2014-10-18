package jerry.shen.plugin;
 
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;

public class IntentManager extends CordovaPlugin {
    public static final String ACTION_OPEN_LOCATION = "openLocation";
    public static final String ACTION_OPEN_GOOGLE_PLAY = "openGooglePlay";
    public static final String ACTION_OPEN_SETTING = "openSetting";
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        try {
            if (ACTION_OPEN_LOCATION.equals(action)) { 
                JSONObject arg_object = args.getJSONObject(0);
                Intent intent = new Intent(android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                this.cordova.getActivity().startActivity(intent);
                callbackContext.success();
                return true;
            } else if (ACTION_OPEN_GOOGLE_PLAY.equals(action)) { 
                JSONObject arg_object = args.getJSONObject(0);
                Intent intent = new Intent(Intent.ACTION_VIEW,
                    Uri.parse("market://details?id="+arg_object.getString("package_name")));
                this.cordova.getActivity().startActivity(intent);
                callbackContext.success();
                return true;
            } else if (ACTION_OPEN_SETTING.equals(action)) {
                JSONObject arg_object = args.getJSONObject(0);
                Intent intent = new Intent(android.provider.Settings.ACTION_SETTINGS);
                this.cordova.getActivity().startActivity(intent);
                callbackContext.success();
                return true;
            }
            callbackContext.error("Invalid action");
            return false;
        } catch(Exception e) {
            System.err.println("Exception: " + e.getMessage());
            callbackContext.error(e.getMessage());
            return false;
        } 
    }
}