#!/usr/bin/env python3.7

import iterm2
import re

async def main(connection):
    app = await iterm2.async_get_app(connection)
    # This regex splits the font into its name and size. Fonts always end with
    # their size in points, preceded by a space.
    r = re.compile(r'^(.* )(\d*)$')

    session=app.current_terminal_window.current_tab.current_session
    # profile=await session.async_get_profile()
    profile = await iterm2.Profile.async_get_default(connection)
    print(profile.normal_font)
    replacement = 'MesloLGMDZForPowerline-Regular 13'
    print(replacement)
    change = iterm2.LocalWriteOnlyProfile()
    await profile.async_set_normal_font(replacement)
    preset = await iterm2.ColorPreset.async_get(connection, "Brogrammer")
    await profile.async_set_color_preset(preset)
    await session.async_set_profile_properties(change)

    profile=await session.async_get_profile()
    print(profile.normal_font)

iterm2.run_until_complete(main)