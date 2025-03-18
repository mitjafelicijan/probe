import core.sys.posix.unistd;
import core.stdc.stdlib;

extern(C) {
	struct Display;
	struct Screen;
	alias Window = ulong;

	Display* XOpenDisplay(const char*);
	Window XDefaultRootWindow(Display*);
	Window XCreateSimpleWindow(Display*, Window, int, int, uint, uint, uint, ulong, ulong);
	int XMapWindow(Display*, Window);
	int XFlush(Display*);
	int XCloseDisplay(Display*);
}

void main() {
	Display* mainDisplay = XOpenDisplay(null);
	if (mainDisplay is null) {
		exit(1);
	}

	Window rootWindow = XDefaultRootWindow(mainDisplay);

	Window mainWindow = XCreateSimpleWindow(
		mainDisplay, rootWindow,
		0, 0,         // x, y position
		800, 600,     // width, height
		0,            // border width
		0,            // border color (ignored)
		0xFF0000      // background color (red)
	);

	XMapWindow(mainDisplay, mainWindow);
	XFlush(mainDisplay);

	while(true) {
		sleep(1);
	}
}
