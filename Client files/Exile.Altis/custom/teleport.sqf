//Simple Teleport
	clicked = false;
	openMap [true, true];
	uiSleep 1;
	onMapSingleClick "vehicle player setPos _pos; onMapSingleClick ''; clicked = true;";
	waitUntil{uiSleep 0.3; clicked};
	openMap [false, false];
