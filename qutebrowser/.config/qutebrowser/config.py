# Set catppuccin colors as your theme
import os
from urllib.request import urlopen

# load your autoconfig, use this, if the rest of your config is empty!
config.load_autoconfig()

# if not os.path.exists(config.configdir / "theme.py"):
#     theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
#     with urlopen(theme) as themehtml:
#         with open(config.configdir / "theme.py", "a") as file:
#             file.writelines(themehtml.read().decode("utf-8"))
#
# if os.path.exists(config.configdir / "theme.py"):
#     import theme
#     theme.setup(c, 'mocha', True)

# The path to the theme file
theme_file = '/home/krish/.config/qutebrowser/gruvbox_material.py'

# Load the theme
exec(open(theme_file).read())

# Check if the theme file exists or not
if os.path.exists(theme_file):
    exec(open(theme_file).read())
else:
    print("Error: gruvbox_material.py not found")

c.tabs.background = True
c.downloads.position = 'bottom'

config.bind('<Ctrl+/>', 'hint links spawn --detach mpv {hint-url}')

# For yt-dl
# Download audio
config.bind('ya', 'spawn --userscript audio_download')
# Download video
config.bind('yv', 'spawn --userscript video_download')

# Get some linux search engines
c.url.searchengines['gw'] = 'https://wiki.gentoo.org/index.php?search={}'
c.url.searchengines['mynixos'] = 'https://mynixos.com/search?q={}'
