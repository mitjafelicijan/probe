// This is here just for reference. It is not required for this example.

#include <X11/Xlib.h>
#include <unistd.h>

int main() {
    Display *MainDisplay = XOpenDisplay(0);
    Window RootWindow = XDefaultRootWindow(MainDisplay);

    Window MainWindow = XCreateSimpleWindow(MainDisplay, RootWindow, 0, 0, 800, 600, 0, 0, 0xFF0000);
    XMapWindow(MainDisplay, MainWindow);
    XFlush(MainDisplay);

    for (;;) {
        sleep(1);
    }
}
