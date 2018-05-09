using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class OdenseRunningCrewView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
        dc.fillRectangle(0,0, dc.getWidth(), dc.getHeight());
        
        drawTime(dc);
        drawLogo(dc);
    }
    
    function drawTime(dc) {
    		// Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = Sys.getClockTime();
        var hours = clockTime.hour;
        if (!Sys.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (App.getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$:$2$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Draw the time
    		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
    		var x = dc.getWidth() / 2;
    		var y = dc.getHeight() - (dc.getHeight() * 0.28);
        
		
    		dc.drawText(x, y, Gfx.FONT_SYSTEM_NUMBER_MILD, timeString, Gfx.TEXT_JUSTIFY_CENTER);
    }
    
    function drawLogo(dc) {
        	var width = 120;
    		var height = 74;
        	var x = ((dc.getWidth() / 2) - width/2);
        	var y = ((dc.getHeight() / 2)  - height/2);
        		
    		var logo = Ui.loadResource(Rez.Drawables.logo_white);
    		dc.drawBitmap(x, y, logo);
    }
    

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
