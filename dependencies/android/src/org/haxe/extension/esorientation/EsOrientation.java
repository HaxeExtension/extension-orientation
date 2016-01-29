package org.haxe.extension.esorientation;

import android.content.pm.ActivityInfo;
import org.haxe.extension.Extension;

public class EsOrientation extends Extension {
    public static final int ORIENTATION_UNSPECIFIED = 0;
    public static final int ORIENTATION_PORTRAIT = 1;
    public static final int ORIENTATION_LANDSCAPE = 2;

    public static void setRequestedOrientation(int haxeScreenOrientation) {
        int requestedOrientation;

        switch (haxeScreenOrientation) {
            case ORIENTATION_PORTRAIT:
                requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
                break;

            case ORIENTATION_LANDSCAPE:
                requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE;
                break;

            default:
                requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
        }

        Extension.mainActivity.setRequestedOrientation(requestedOrientation);
    }
}
