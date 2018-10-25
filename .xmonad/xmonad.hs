import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run(spawnPipe)
import System.IO
import qualified Data.Map as M


--myTerminal = "urxvt256c-ml" -- Solarized terminal
myTerminal = "terminator"

-- The default number of workspaces (virtual screens) and their names.
-- -- By default we use numeric strings, but any string may be used as a
-- -- workspace name. The number of workspaces is determined by the length
-- -- of this list.
-- --
-- -- A tagging example:
-- --
-- -- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
-- --
myWorkspaces = ["code", "database", "mail", "web"] ++ map show [5..10]
myNormalBorderColor  = "#cccccc"
myFocusedBorderColor = "#cd8b00"
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
        [ ((modMask .|. controlMask, xK_l), spawn "xtrlock -b")
          , ((modMask, xK_s), spawn "systemctl suspend")
          , ((modMask .|. controlMask, xK_h), spawn "xtrlock -b -f && systemctl suspend")
          , ((0, xK_F1), spawn "screen-refresh && monitor-setup single")
          , ((0, xK_F2), spawn "screen-refresh && monitor-setup double")
          , ((0, xK_F3), spawn "screen-refresh && monitor-setup triple")
        ]

-- Now run xmonad with all the defaults we set up.
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ withUrgencyHook NoUrgencyHook defaultConfig {
    -- simple stuff
        terminal            = myTerminal,
        modMask             = mod4Mask,
        workspaces          = myWorkspaces,
        normalBorderColor   = myNormalBorderColor,
        focusedBorderColor  = myFocusedBorderColor,
        keys                = \c -> myKeys c `M.union` keys defaultConfig c,
  -- hooks, layouts
        manageHook          = manageDocks <+> manageHook defaultConfig,
        layoutHook          = avoidStruts $ layoutHook defaultConfig,
        handleEventHook     = handleEventHook defaultConfig <+> docksEventHook,
        logHook             = dynamicLogWithPP xmobarPP
                                { ppOutput = hPutStrLn xmproc
                                , ppTitle = xmobarColor "lightgreen" ""
                                },
        startupHook         = setWMName "LG3D"
}
