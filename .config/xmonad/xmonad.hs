-- MagyArch xmonad.hs configuration

--import XMonad
import XMonad hiding ((|||))
import XMonad.ManageHook

--SYSTEM
import System.Exit
import System.IO (Handle, hPutStrLn)

--HOOKS
import XMonad.Hooks.ManageHelpers(doFullFloat, doCenterFloat, isFullscreen, isDialog)
import XMonad.Hooks.ServerMode
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Minimize
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.InsertPosition
--import XMonad.Actions.CycleWS

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
import XMonad.Util.EZConfig
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
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "kitty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 3

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask   = mod4Mask

-- Border colors for unfocused and focused windows, respectively.

myNormalBorderColor  = "#282a36"
myFocusedBorderColor = "#6272a4"

------------------------------------------------------------------------
-- LAYOUTS

myLayout = avoidStruts $ smartBorders $ spacingRaw True (Border 0 0 0 0) True (Border 0 0 0 0) True $ gaps [(U,10), (D,10), (R,10), (L,10)] $

           mkToggle (NBFULL ?? NOBORDERS ?? EOT)

           tiled ||| ResizableTall 1 (3/100) (1/2) [] ||| twopane ||| Grid ||| tabbed shrinkText myTabConfig ||| ThreeCol 1 (3/100) (1/2) ||| ThreeColMid 1 (3/100) (1/2) ||| Full

     where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = smartSpacing 5 $ Tall nmaster delta ratio

     -- In this layout the second pane will only show the focused window.
     twopane = spacing 3 $ TwoPane delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
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
myScratchPads = [
    NS "scratchpad" "kitty --class=kitty -T scratchpad" (title =? "scratchpad")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "ncmpcpp" "kitty --class=kitty -T ncmpcpp -e ncmpcpp" (title =? "ncmpcpp")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "pavucontrol" "pavucontrol" (className =? "pavucontrol")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4))
  ]



----------------------------------------------------------------------

-- WORKSPACES

--xmobarEscape = concatMap doubleLts
 ---   where doubleLts '<' = "<<"
    --      doubleLts x = [x]

--myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]
--myWorkspaces = clickable . (map xmobarEscape) $ ["\61612","\61899","\61947","\61635","\61502","\61501","\61705","\61564","\62150","\61872"]
  --   where
    --           clickable l = [ "<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>" | (i,ws) <- zip [1..9] l, let n = i ]    

myWorkspaces    = clickable $ ["\61612","\61899","\61947","\61635","\61502","\61501","\61705","\61564","\62150","\61872"]

        where
                  clickable l = [ "%{A1:xdotool key super+" ++ show n ++ " &:}" ++ ws ++ "%{A}" | (i, ws) <- zip [1..9] l, let n = i ]
----------------------------------------------------------------------

-- HOOKS

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
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
    --, [className =? "Steam" --> doCenterFloat]
    --, [className =? "steam" --> doCenterFloat]
    , [className =? "Zathura" --> doCenterFloat]
    , [className =? "firefox" --> doShift (myWorkspaces !! 0) <+> viewShift (myWorkspaces !! 0)]
    , [className =? "discord" --> doShift (myWorkspaces !! 1) <+> viewShift (myWorkspaces !! 1)]
    , [className =? "Sublime_text"  --> doShift (myWorkspaces !! 2) <+> viewShift (myWorkspaces !! 2)]
    , [className =? "steam" --> doShift (myWorkspaces !! 6) <+> viewShift (myWorkspaces !! 6)]
    , [className =? "Vlc" --> doShift (myWorkspaces !! 4) <+> viewShift (myWorkspaces !! 4)]
    , [className =? "mpv" --> doCenterFloat <+> doShift (myWorkspaces !! 5) <+> viewShift (myWorkspaces !! 5)]
    , [className =? "Virtualbox" --> doShift (myWorkspaces !! 6) <+> viewShift (myWorkspaces !! 6)]
    , [className =? "Thunar" --> doShift (myWorkspaces !! 7) <+> viewShift (myWorkspaces !! 7)]
    , [className =? "mkvtoolnix-gui" --> doShift (myWorkspaces !! 8) <+> viewShift (myWorkspaces !! 8)]
    ] where viewShift = doF . liftM2 (.) W.greedyView W.shift

-----------------------------------------------------------------------

-- Colours on bar

green     = "#2e8b57"
red       = "#fb4934"
yellow    = "#fabd2f"
blue      = "#83a598"
white     = "#c3cdc8"



------------------------------------------------------------------------

myEventHook = serverModeEventHook <+> serverModeEventHookCmd <+> serverModeEventHookF "XMONAD_PRINT" (io . putStrLn) <+> minimizeEventHook <+> handleEventHook def 

--docksEventHook <+> fullscreenEventHook
------------------------------------------------------------------------
-- Status bars and logging

-- Command to launch the bar.
--myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
--myPP = xmobarPP { ppCurrent = xmobarColor "#2e8b57" "" . wrap "["  "]" }

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--myLogHook = return ()

myLogHook :: D.Client -> PP
myLogHook dbus = def
    { ppOutput = dbusOutput dbus
    , ppCurrent = wrap ("%{F" ++ green ++ "} ") " %{F-}"
    , ppVisible = wrap ("%{F" ++ blue ++ "} ") " %{F-}"
    , ppUrgent = wrap ("%{F" ++ red ++ "} ") " %{F-}"
    , ppHidden = wrap " " " "
    , ppWsSep = ""
    , ppSep = " | "
    }


-- Emit a DBus signal on log updates
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }

    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"


------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
--myStartupHook = return ()
myStartupHook = do
     spawnOnce "(sleep 1s && ~/.config/polybar/launch.sh) &"
     spawnOnce "sxhkd -c ~/.config/xmonad/sxhkdrc &"
     spawnOnce "compfy --config $HOME/.config/compfy.conf &"
------------------------------------------------------------------------
-- Command to launch the bar.
--myBar = "xmobar"

 --Custom PP, configure it as you like. It determines what is being written to the bar.
--myPP = xmobarPP { ppCurrent = xmobarColor "#6272a4" "" . wrap "["  "]" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

main :: IO ()
main = do
    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

    xmonad $ ewmh $ ewmhFullscreen $ docks $ defaults { logHook = dynamicLogWithPP (myLogHook dbus) }




defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = (insertPosition Below Newer <+> myManageHook <+> namedScratchpadManageHook myScratchPads),
        handleEventHook    = myEventHook,
        startupHook        = myStartupHook
    }

------------------------------------------------------------------------

-- Key bindings. Add, modify or remove key bindings here

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    -- [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- close focused window
    -- [ ((modm,               xK_q     ), kill)

    -- toggle noboderfull
    [ ((modm, xK_f), sendMessage $ Toggle NBFULL)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    -- , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    -- , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    -- , ((modm .|. shiftMask, xK_m     ), windows W.swapMaster)

    -- Swap the focused window with the next window
    -- , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    -- , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
     , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
     , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    -- , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    --  Jump directly to favorite layout
    , ((modm .|. shiftMask, xK_t), sendMessage $ JumpToLayout "Tabbed Simplest") -- jump directly to the Tabbed layout

    , ((modm .|. shiftMask, xK_f), sendMessage $ JumpToLayout "Full")  -- jump directly to the Full layout

    , ((modm .|. shiftMask, xK_g), sendMessage $ JumpToLayout "Grid")

    , ((modm .|. shiftMask, xK_u), sendMessage $ JumpToLayout "Mirror Tall")

    , ((modm .|. shiftMask, xK_s), sendMessage $ JumpToLayout "Spacing TwoPane")

    , ((modm .|. shiftMask, xK_z), sendMessage $ JumpToLayout  "ThreeCol")



    -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Scratchpad keybinds
    , ((modm .|. shiftMask, xK_Return), namedScratchpadAction myScratchPads "scratchpad")
    , ((modm .|. controlMask, xK_h), namedScratchpadAction myScratchPads "pavucontrol")
    , ((modm .|. shiftMask, xK_n), namedScratchpadAction myScratchPads "ncmpcpp")

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    -- , ((modm              , xK_g     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
   --     , ((modm               , xK_r ), spawn "$TERMINAL -e $FILE")
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_a, xK_y, xK_z] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]


