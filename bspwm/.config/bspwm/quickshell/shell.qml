//@ pragma UseQApplication
import Quickshell

ShellRoot {
    Variants {
        model: Quickshell.screens.filter(screen => screen.name === "HDMI-A-0")
        Bar {}
    }
}
