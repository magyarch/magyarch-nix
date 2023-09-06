/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx       = 6;        /* border pixel of windows */
static const unsigned int gappx          = 20;        /* gaps between windows */
static const unsigned int snap           = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 3;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray             = 1;     /* 0 means no systray */
static const int showbar                 = 1;        /* 0 means no bar */
static const int topbar                  = 1;        /* 0 means bottom bar */
static const char *fonts[]               = { "JetBrains Mono Nerd:size=10" , "JoyPixels:size=8" , "FontAwesome:size=11:antialias=true:autohint=true" };
static const char dmenufont[]            = "JetBrainsMono Nerd:size=11";
static const char col_1[]                = "#282a36";  /* background color of bar and border color unfocused windows */
static const char col_2[]                = "#f8f8f2";  /* foreground color of bar and tags */
static const char col_3[]                = "#6272a4";  /* border color focused windows and tags */
static const char *colors[][3]           = {
	/*               fg     bg     border   */
	[SchemeNorm] = { col_2, col_1, col_1 },
	[SchemeSel]  = { col_2, col_3, col_3 },
};

/* tagging */
/*static const char *tags[] = { "🐧", "🔎", "⌨️", "💬", "👾", "🧲", "🖌️", "📺", "📸"};
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };*/
/*static const char *tags[] = { "I", "II", "III", "IV", "V", "VI","VII", "VIII", "IX" };*/
static const char *tags[] = { "", "", "", "", "", "", "", "", "" };


static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class           instance    title       tags mask     isfloating   monitor */
	{ "qBittorrent",    NULL,       NULL,       1 << 6,        0,           -1 },
	{ "st-256color",    NULL,       NULL,       0,             1,           -1 },
	{ "Microsoft-edge", NULL,       NULL,       1 << 0,        0,           -1 },
	{ "discord",        NULL,       NULL,       1 << 1,        0,          -1 },
	{ "Thunar",         NULL,       NULL,       1 << 7,        0,          -1 },
	{ "steam",          NULL,       NULL,       1 << 4,        0,          -1 },
    { "Pavucontrol",    NULL,       NULL,       0,             1,          -1 },
    { "upc.exe",        NULL,       NULL,       0,             1,          -1 },
    { "Sublime_text",    NULL,       NULL,      1 << 3,        0,          -1 },
    { "Lxappearance",        NULL,       NULL,       0,             1,          -1 },

};

/* layout(s) */
static const float mfact     = 0.52; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

#include "fibonacci.c"
#include "horizgrid.c"
static const Layout layouts[] = {
	/* symbol     arrange function */

    { "[]=",      tile },      /* first entry is default */
	{ "[@]",      spiral },
 	{ "[\\]",     dwindle },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "|M|",      centeredmaster },
    { ">M>",      centeredfloatingmaster },
    { "###",      horizgrid },
};

/* key definitions */
#define MODKEY Mod4Mask
#define ALTMOD Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run -c -g 1 -l 10 ", "-m", dmenumon, "-fn", dmenufont, NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "110x30", "-e", "ncmpcpp", NULL };
static const char *termcmd[] = { "st", "-g", "110x30", NULL };

#include "movestack.c"
static Key keys[] = {
	/* modifier                     key        function        argument */
	/*{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },*/
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ ALTMOD,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_Tab,    focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_i,      incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Left,   movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Right,  movestack,      {.i = -1 } },
	{ MODKEY,                       XK_z,      zoom,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ ALTMOD,                       XK_t,      setlayout,      {.v = &layouts[0]} },  /* tile */
	{ ALTMOD,                       XK_a,      setlayout,      {.v = &layouts[1]} },  /* dwindle */
	{ ALTMOD,                       XK_s,      setlayout,      {.v = &layouts[2]} },  /* spiral */
	{ ALTMOD,                       XK_f,      setlayout,      {.v = &layouts[3]} },  /* floating */
	{ ALTMOD,                       XK_m,      setlayout,      {.v = &layouts[4]} },  /* monocle */
	{ ALTMOD,                       XK_u,      setlayout,      {.v = &layouts[5]} },  /* centeredmaster */
    { ALTMOD,                       XK_o,      setlayout,      {.v = &layouts[6]} },  /* centeredfloatingmaster */
    { ALTMOD,                       XK_h,      setlayout,      {.v = &layouts[7]} },  /* horizgrid */
    { MODKEY,                       XK_g,      togglescratch,  {.v = scratchpadcmd } },
	/*{ MODKEY|ShiftMask,             XK_b,      setlayout,      {0} },*/
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_s,      togglesticky,   {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	/*{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },*/
/*	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },*/
	{ MODKEY,                       XK_Up,     setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_Down,   setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Down,   setgaps,        {.i = 0  } },
	{ MODKEY,		                XK_space,  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_v,      cyclelayout,    {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY|ShiftMask,             XK_Escape, quit,           {1} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	/*{ ClkClientWin,         0,              Button2,        killclient,     {0} },*/
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

