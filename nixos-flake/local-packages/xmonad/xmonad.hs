-- MagyArch xmonad.hs configuration

--import XMonad
import XMonad hiding ((|||))
import XMonad.ManageHook

--SYSTEM
import System.Exit
import System.IO (Handle, hPutStrLn)

--HOOKS
import XMonad.Hooks.ManageHelpers(doFullFloat, doCenterFloat, isFullscreen, isDialog)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Minimize
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.InsertPosition
-- (ServerMode import eltávolítva)

--LAYOUT
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleDecoration (shrinkText)
import XMonad.Layout.Fullscreen (fullscreenFull)
import XMonad.Layout.Grid
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders (noBorders, smartBorders)
import XMonad.Layout.Gaps
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.DecorationMadness
import XMonad.Layout.LayoutCombinators

--UTILS
import XMonad.Util.Themes
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedScratchpad
import XMonad.Util.SpawnOnce

-- DATA
import Data.Monoid
import Control.Monad (liftM2)

--QUALIFIED
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified Codec.Binary.UTF8.String as UTF8
import qualified DBus as D
import qualified DBus.Client as D



-- MY VARIABLES
myTerminal = "kitty"
myFocusFollowsMouse = True
myClickJustFocuses = False
myBorderWidth   = 3
myModMask   = mod4Mask

myNormalBorderColor  = "#282a36"
myFocusedBorderColor = "#6272a4"

------------------------------------------------------------------------
-- LAYOUTS

myLayout = avoidStruts $ smartBorders $ spacingRaw True (Border 0 0 0 0) True (Border 0 0 0 0) True $
           gaps [(U,10), (D,10), (R,10), (L,10)] $
           mkToggle (NBFULL ?? NOBORDERS ?? EOT)
           ( tiled
         ||| ResizableTall 1 (3/100) (1/2) []
         ||| twopane
         ||| Grid
         ||| tabbed shrinkText myTabConfig
         ||| ThreeCol 1 (3/100) (1/2)
         ||| ThreeColMid 1 (3/100) (1/2)
         ||| Full )
  where
    tiled   = smartSpacing 5 $ Tall nmaster delta ratio
    twopane = spacing 3 $ TwoPane delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

------------------------------------------------------------------------
-- TABBED THEME

myTabConfig = def {
    fontName = "xft:JetBrains Mono Nerd Font:size=11",
    activeBorderColor = "#6272a4",
    activeTextColor = "#6272a4",
    activeColor = "#282a36",
    inactiveBorderColor = "#282a36",
    inactiveTextColor = "#c3cdc8",
    inactiveColor = "#282a36"
}

------------------------------------------------------------------------------
-- SCRATCHPAD

myScratchPads :: [NamedScratchpad]
myScratchPads =
  [ NS "scratchpad" "kitty --class=kitty -T scratchpad" (title =? "scratchpad")
        (customFloating $ W.RationalRect (0.15) (0.15) (0.7) (0.7))

  , NS "ncmpcpp" "kitty --class=kitty -T ncmpcpp -e ncmpcpp" (title =? "ncmpcpp")
        (customFloating $ W.RationalRect (0.15) (0.15) (0.7) (0.7))

  , NS "pavucontrol" "pavucontrol" (className =? "pavucontrol")
        (customFloating $ W.RationalRect (0.15) (0.15) (0.7) (0.7))
  ]

----------------------------------------------------------------------

-- WORKSPACES

myWorkspaces = clickable
    ["\61612","\61899","\61947","\61635","\61502","\61501","\61705","\61564","\62150","\61872"]
  where
    clickable l =
      [ "%{A1:xdotool key super+" ++ show n ++ " &:}" ++ ws ++ "%{A}"
         | (i, ws) <- zip [1..9] l
         , let n = i ]

----------------------------------------------------------------------

-- MANAGEHOOK

myManageHook :: XMonad.Query (Endo WindowSet)
myManageHook = composeAll . concat $
    [ [isDialog --> doCenterFloat]
    , [isFullscreen --> (doF W.focusDown <+> doFullFloat)]
    , [title =? "calcurse"  --> doFloat]
    , [resource =? "Downloads" --> doFloat]
    , [resource =? "Save As..." --> doFloat]
    , [resource =? "desktop_window" --> doIgnore]
    , [resource =? "sxiv" --> doCenterFloat]
    , [className =? "Lxappearance" --> doCenterFloat]
    , [className =? "pavucontrol" --> doCenterFloat]
    , [title =? "pavucontrol" --> doFloat]
    , [className =? "Zathura" --> doCenterFloat]
    , [className =? "firefox" --> doShift(ws 0) <+> viewShift(ws 0)]
    , [className =? "discord" --> doShift(ws 1) <+> viewShift(ws 1)]
    , [className =? "Sublime_text"  --> doShift(ws 2) <+> viewShift(ws 2)]
    , [className =? "steam" --> doShift(ws 6) <+> viewShift(ws 6)]
    , [className =? "Vlc" --> doShift(ws 4) <+> viewShift(ws 4)]
    , [className =? "mpv" --> doCenterFloat <+> doShift(ws 5) <+> viewShift(ws 5)]
    , [className =? "Virtualbox" --> doShift(ws 6) <+> viewShift(ws 6)]
    , [className =? "Thunar" --> doShift(ws 7) <+> viewShift(ws 7)]
    , [className =? "mkvtoolnix-gui" --> doShift(ws 8) <+> viewShift(ws 8)]
    ]
  where
    ws i = myWorkspaces !! i
    viewShift = doF . liftM2 (.) W.greedyView W.shift

-----------------------------------------------------------------------

-- BAR COLORS

green  = "#2e8b57"
red    = "#fb4934"
yellow = "#fabd2f"
blue   = "#83a598"
white  = "#c3cdc8"

------------------------------------------------------------------------

-- (ServerMode teljesen eltávolítva)
myEventHook = minimizeEventHook <+> handleEventHook def

------------------------------------------------------------------------
-- LOGHOOK DBus → Polybar

myLogHook :: D.Client -> PP
myLogHook dbus = def
    { ppOutput  = dbusOutput dbus
    , ppCurrent = wrap ("%{F" ++ green ++ "} ") " %{F-}"
    , ppVisible = wrap ("%{F" ++ blue  ++ "} ") " %{F-}"
    , ppUrgent  = wrap ("%{F" ++ red   ++ "} ") " %{F-}"
    , ppHidden  = wrap " " " "
    , ppWsSep   = ""
    , ppSep     = " | "
    }

dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal =
            (D.signal objectPath interfaceName memberName)
                { D.signalBody = [D.toVariant $ UTF8.decodeString str] }
    D.emit dbus signal
  where
    objectPath    = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName    = D.memberName_ "Update"

------------------------------------------------------------------------
-- Startup hook

myStartupHook = do
    spawnOnce "(sleep 1s && ~/.config/polybar/launch.sh) &"
    spawnOnce "sxhkd -c ~/nixos-flake/local-packages/xmonad/sxhkdrc &"
    spawnOnce "picom --config $HOME/.config/picom.conf &"

------------------------------------------------------------------------

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

------------------------------------------------------------------------
-- MAIN
------------------------------------------------------------------------

main :: IO ()
main = do
    dbus <- D.connectSession
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

    xmonad $
      ewmh $ ewmhFullscreen $ docks $
        (defaults `additionalKeysP` [
        ("M-<Return>", spawn "alacritty")
       ,("M-d", spawn "rofi -show drun")
       ,("M-q", kill)
       ,("M-c", spawn "eww open --toggle powermenu")
        ])
          { logHook = dynamicLogWithPP (myLogHook dbus) }

------------------------------------------------------------------------
-- DEFAULTS
------------------------------------------------------------------------

defaults = def {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

        keys               = myKeys,
        mouseBindings      = myMouseBindings,

        layoutHook         = myLayout,
        manageHook         = insertPosition Below Newer
                             <+> myManageHook
                             <+> namedScratchpadManageHook myScratchPads,
        handleEventHook    = myEventHook,
        startupHook        = myStartupHook
    }

------------------------------------------------------------------------
-- KEYBINDS
------------------------------------------------------------------------

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm, xK_f), sendMessage $ Toggle NBFULL)
    , ((modm, xK_Tab), windows W.focusDown)
    , ((modm, xK_m), windows W.focusMaster)
    , ((modm, xK_h), sendMessage Shrink)
    , ((modm, xK_l), sendMessage Expand)
    , ((modm .|. shiftMask, xK_t), sendMessage $ JumpToLayout "Tabbed Simplest")
    , ((modm .|. shiftMask, xK_f), sendMessage $ JumpToLayout "Full")
    , ((modm .|. shiftMask, xK_g), sendMessage $ JumpToLayout "Grid")
    , ((modm .|. shiftMask, xK_u), sendMessage $ JumpToLayout "Mirror Tall")
    , ((modm .|. shiftMask, xK_s), sendMessage $ JumpToLayout "Spacing TwoPane")
    , ((modm .|. shiftMask, xK_z), sendMessage $ JumpToLayout "ThreeCol")
    , ((modm, xK_space), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space), setLayout $ layoutHook conf)
    , ((modm, xK_comma ), sendMessage (IncMasterN 1))
    , ((modm, xK_period), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_Return), namedScratchpadAction myScratchPads "scratchpad")
    , ((modm .|. controlMask, xK_h), namedScratchpadAction myScratchPads "pavucontrol")
    , ((modm .|. shiftMask, xK_n), namedScratchpadAction myScratchPads "ncmpcpp")
    , ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))
    ]
    ++
    [ ((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]
    ++
    [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_a, xK_y, xK_z] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]

------------------------------------------------------------------------
-- MOUSE
------------------------------------------------------------------------

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modMask, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]
