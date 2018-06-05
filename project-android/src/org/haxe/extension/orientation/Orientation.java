package org.haxe.extension.orientation;

import android.content.pm.ActivityInfo;
import org.haxe.extension.Extension;

public class Orientation extends Extension {
    public static final int ORIENTATION_UNSPECIFIED = 0;
    public static final int ORIENTATION_PORTRAIT = 1;
    public static final int ORIENTATION_LANDSCAPE = 2;

    private static int fixedOrientation = 0;

    public static void setRequestedOrientation(int haxeScreenOrientation) {
        int requestedOrientation;

        switch (haxeScreenOrientation) {
            case ORIENTATION_PORTRAIT:
                requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
                break;

            case ORIENTATION_LANDSCAPE:
                requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE;
                break;

            default:
                requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
        }

        Extension.mainActivity.setRequestedOrientation(requestedOrientation);
        fixedOrientation = requestedOrientation;
    }

    @Override
    public void onResume() {
        super.onResume();

        if (fixedOrientation != 0) {
            Extension.mainActivity.setRequestedOrientation(fixedOrientation);
        }
    }
}
