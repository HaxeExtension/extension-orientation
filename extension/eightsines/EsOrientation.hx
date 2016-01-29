package extension.eightsines;

#if cpp
    import cpp.Lib;
#end

#if android
    import openfl.utils.JNI;
#end

#if legacy
    import openfl.display.Stage;
#end

class EsOrientation {
    public static inline var ORIENTATION_UNSPECIFIED : Int = 0;
    public static inline var ORIENTATION_PORTRAIT : Int = 1;
    public static inline var ORIENTATION_LANDSCAPE : Int = 2;

    #if android
        private static var setRequestedOrientationNative = JNI.createStaticMethod(
            "org.haxe.extension.esorientation.EsOrientation",
            "setRequestedOrientation",
            "(I)V"
        );
    #elseif (ios && legacy)
        private static var recheckScreenOrientationNative = Lib.load(
            "es_orientation_legacy",
            "es_orientation_legacy_recheck_screen_orientation",
            1
        );
    #elseif ios
        private static var setRequestedOrientationNative = Lib.load(
            "es_orientation",
            "es_orientation_set_requested_orientation",
            1
        );
    #end

    public static function setScreenOrientation(screenOrientation : Int) : Void {
        #if android
            setRequestedOrientationNative(screenOrientation);
        #elseif legacy
            switch (screenOrientation) {
                case ORIENTATION_PORTRAIT:
                    Stage.setFixedOrientation(Stage.OrientationPortraitAny);

                case ORIENTATION_LANDSCAPE:
                    Stage.setFixedOrientation(Stage.OrientationLandscapeAny);

                default:
                    Stage.setFixedOrientation(Stage.OrientationAny);
            }

            #if ios
                recheckScreenOrientationNative(screenOrientation);
            #end
        #elseif ios
            setRequestedOrientationNative(screenOrientation);
        #end
    }
}
