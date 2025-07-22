config.load_autoconfig()

# QtWebEngine argumentumok (helyettesíti a korábbi QTWEBENGINE_CHROMIUM_FLAGS környezeti változót!)
config.set("qt.args", [
    "--use-gl=desktop",
    "--ozone-platform=wayland",
    "--enable-features=VaapiVideoDecoder",
    "--enable-gpu-rasterization",
    "--enable-zero-copy",
    "--ignore-gpu-blocklist"
])

# Extra biztonság / kinézet
config.set("content.webgl", True)
config.set("content.canvas_reading", True)
config.set("content.notifications.enabled", False)
config.set("content.autoplay", False)

c.qt.highdpi = True
c.fonts.default_size = "10pt"
c.colors.webpage.darkmode.enabled = True

