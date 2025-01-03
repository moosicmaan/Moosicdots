/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 8;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 8;       /* vert inner gap between windows */
static const unsigned int gappoh    = 8;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 8;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;     /* 0 means no bar */
static const int topbar             = 1;     /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#010101";
static const char col_gray2[]       = "#222222";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#020202";
static const char col_white[]       = "#ffffff";
static const char col_accent[]       = "#aaaafe";
static const char col_pinned[]       = "#aaffee";
static const char *colors[][3]      = {
/*               fg         bg         border   */
[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
[SchemeSel]  = { col_gray4, col_cyan,  col_white  },
};

static const char *const autostart[] = {
	"/home/moosicmaan/.config/dwm/include/autostart.sh", NULL,
	NULL /* terminate */
};

static const char *tagsel[][2] = {
   /*   fg         bg    */
  { col_gray3, col_gray1 }, /* norm */
  { col_gray1, col_accent  }, /* sel */
  { col_gray1,  col_gray3 }, /* occ but not sel */
  { col_gray1,  col_pinned }, /* has pinned tag */
};
/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
/* xprop(1):
*	WM_CLASS(STRING) = instance, class
*	WM_NAME(STRING) = title
	  class      instance    title          tags mask  isfloating  monitor Scratchkey float x,y,w,h   floatborderpx*/
/*{ "Gimp",     NULL,       NULL,           0,         1,          -1,     0,       50,50,500,500,     9 },*/
	{ "Firefox",  NULL,       NULL,           1 << 8,    0,          -1,     0,       50,50,500,500,     9 },
	{ NULL,       NULL,   "kittydrop",        0,         1,          -1,    's',      150,50,1620,900,   9 },
	{ NULL,       NULL,   "yazidrop",         0,         1,          -1,    'j',      150,50,1620,900,   9 },
	{ NULL,       NULL,   "btopdrop",         0,         1,          -1,    'l',      150,50,1620,900,   9 },
	{ NULL,       NULL,   "moosCube",         0,         1,          -1,    'p',      150,50,1620,900,   9 },
	{ NULL,       NULL,   "Volume Control",   0,         1,          -1,    'v',      150,50,1620,900,   9 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
/* symbol     arrange function */
{ "[]=",      tile },    /* first entry is default */
{ "><>",      NULL },    /* no layout function means floating behavior */
{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define AltMask Mod1Mask
/*#define TAGKEYS(KEY,TAG) \*/
/*{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \*/
/*{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \*/
/*{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \*/
/*{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },*/
#define TAGKEYS(KEY,TAG)                                                                                               \
       &((Keychord){1, {{MODKEY, KEY}},                                        view,           {.ui = 1 << TAG} }), \
       &((Keychord){1, {{MODKEY|ControlMask, KEY}},                            toggleview,     {.ui = 1 << TAG} }), \
       &((Keychord){1, {{MODKEY|ShiftMask, KEY}},                              tag,            {.ui = 1 << TAG} }), \
       &((Keychord){1, {{MODKEY|ControlMask|ShiftMask, KEY}},                  toggletag,      {.ui = 1 << TAG} }),

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "kitty", NULL };
static const char *browscmd[]  = { "brave", NULL };
static const char *my_term2[] = { "wezterm", NULL };
static const char *my_browsv[] = { "qutebrowser", NULL };
static const char *my_email[] = { "thunderbird", NULL };
static const char *my_editg[] = { "geany", NULL };
static const char *my_editc[] = { "neovide", NULL };
static const char *my_filesg[] = { "pcmanfm-qt", NULL };
static const char *my_filesc[] = { "kitty", "-e", "yazi", NULL };
static const char *menu_drun[] = { "rofi", "-config", "/home/moosicmaan/.config/rofi/config-raa.rasi", "-show", "drun", NULL };
static const char *menu_win[] = { "rofi","-config", "/home/moosicmaan/.config/rofi/config.rasi", "-show", "window", NULL };
static const char *my_music[] = { "spotube", NULL };
static const char *my_media[] = { "vlc", NULL };
static const char *my_image[] = { "gimp", NULL };
static const char *emojis[] = { "emote", NULL };
static const char *variq[] = { "variety", "-q", NULL };
static const char *varin[] = { "variety", "-n", NULL };
static const char *varif[] = { "variety", "-f", NULL };
static const char *varip[] = { "variety", "-p", NULL };
static const char *rofi_power[] = { "rofi", "-show", "powermenu", "-modi", "powermenu:~/.config/.scripts/jb-rofi-power.sh", NULL };
/*First arg only serves to match against key in rules*/
static const char *ter_scratch[] = {"s", "kitty", "-T", "kittydrop", NULL};
static const char *yazi_scratch[] = {"j", "kitty", "-T", "yazidrop", "-e", "yazi", NULL};
static const char *btop_scratch[] = {"l", "kitty", "-T", "btopdrop", "-e", "btop", NULL};
static const char *moosic_scratch[] = {"p", "kitty", "-T", "moosCube", "-e", "musikcube", NULL};
static const char *volume_scratch[] = {"v", "pavucontrol-qt", NULL};

static Keychord *keychords[] = {
  /*                             Keys                          function        argument */
  /****SCRATCHPADS****/
	&((Keychord){1, {{MODKEY|AltMask,               XK_i}},      togglescratch,  {.v = ter_scratch } }),
	&((Keychord){1, {{MODKEY|AltMask,               XK_j}},      togglescratch,  {.v = yazi_scratch } }),
	&((Keychord){1, {{MODKEY|AltMask,               XK_p}},      togglescratch,  {.v = moosic_scratch } }),
	&((Keychord){1, {{MODKEY|AltMask,               XK_l}},      togglescratch,  {.v = btop_scratch } }),
	&((Keychord){1, {{MODKEY|AltMask,               XK_v}},      togglescratch,  {.v = volume_scratch } }),
 
  /****APPLICATIONS****/
	&((Keychord){1, {{ControlMask|AltMask,     XK_Delete}},      spawn,          {.v = rofi_power } }),
	&((Keychord){1, {{MODKEY,                       XK_p}},      spawn,          {.v = dmenucmd } }),
	&((Keychord){1, {{MODKEY|ShiftMask,             XK_p}},      spawn,          {.v = menu_drun } }),
	&((Keychord){1, {{MODKEY|ControlMask,           XK_p}},      spawn,          {.v = menu_win } }),
	&((Keychord){1, {{MODKEY,                  XK_Return}},      spawn,          {.v = termcmd } }),
  &((Keychord){2, {{MODKEY, XK_e},            {0, XK_e}},      spawn,          {.v = termcmd } }),
	&((Keychord){1, {{MODKEY|ShiftMask,        XK_Return}},      spawn,          {.v = my_filesg } }),
	&((Keychord){1, {{MODKEY|ControlMask,      XK_Return}},      spawn,          {.v = my_email } }),
	&((Keychord){1, {{MODKEY,                       XK_b}},      spawn,          {.v = browscmd } }),
	&((Keychord){1, {{MODKEY,                       XK_t}},      spawn,          {.v = my_term2 } }),
	&((Keychord){1, {{MODKEY,                       XK_o}},      spawn,          {.v = my_browsv } }),
	&((Keychord){1, {{MODKEY,                      XK_F3}},      spawn,          {.v = my_editg } }),
	&((Keychord){1, {{MODKEY,                      XK_F4}},      spawn,          {.v = my_image } }),
	&((Keychord){1, {{MODKEY,                       XK_n}},      spawn,          {.v = my_editc } }),
	&((Keychord){1, {{MODKEY,                       XK_m}},      spawn,          {.v = my_music } }),
	&((Keychord){1, {{MODKEY,                       XK_i}},      spawn,          {.v = emojis } }),
	&((Keychord){1, {{MODKEY|ShiftMask,             XK_m}},      spawn,          {.v = my_media } }),
	&((Keychord){1, {{MODKEY|AltMask,               XK_y}},      spawn,          {.v = my_filesc } }),
	&((Keychord){1, {{AltMask,                      XK_q}},      spawn,          {.v = variq } }),
	&((Keychord){1, {{AltMask,                      XK_n}},      spawn,          {.v = varin } }),
	&((Keychord){1, {{AltMask,                      XK_f}},      spawn,          {.v = varif } }),
	&((Keychord){1, {{AltMask,                      XK_p}},      spawn,          {.v = varip } }),
 
  /****VANITY GAPS****/
  &((Keychord){1, {{MODKEY|AltMask,               XK_h}},      incrgaps,       {.i = +1 } }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_g}},      incrgaps,       {.i = -1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ShiftMask,     XK_h}},      incrogaps,      {.i = +1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ShiftMask,     XK_g}},      incrogaps,      {.i = -1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ControlMask,   XK_h}},      incrigaps,      {.i = +1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ControlMask,   XK_g}},      incrigaps,      {.i = -1 } }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_0}},      togglegaps,     {0} }),
  &((Keychord){1, {{MODKEY|AltMask|ShiftMask,     XK_0}},      defaultgaps,    {0} }),
  &((Keychord){1, {{MODKEY,                       XK_y}},      incrihgaps,     {.i = +1 } }),
  &((Keychord){1, {{MODKEY,                       XK_h}},      incrihgaps,     {.i = -1 } }),
  &((Keychord){1, {{MODKEY|ControlMask,           XK_y}},      incrivgaps,     {.i = +1 } }),
  &((Keychord){1, {{MODKEY|ControlMask,           XK_o}},      incrivgaps,     {.i = -1 } }),
  &((Keychord){1, {{MODKEY|Mod1Mask,              XK_y}},      incrohgaps,     {.i = +1 } }),
  &((Keychord){1, {{MODKEY|Mod1Mask,              XK_o}},      incrohgaps,     {.i = -1 } }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_y}},      incrovgaps,     {.i = +1 } }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_o}},      incrovgaps,     {.i = -1 } }),
 
  /****WINDOWS LAYOUTS MONITORS****/
	&((Keychord){1, {{MODKEY|ShiftMask,             XK_b}},      togglebar,      {0} }),
	&((Keychord){1, {{MODKEY,                       XK_h}},      focusstack,     {.i = +1 } }),
	&((Keychord){1, {{MODKEY,                       XK_l}},      focusstack,     {.i = -1 } }),
	&((Keychord){1, {{AltMask,                      XK_i}},      incnmaster,     {.i = +1 } }),
	&((Keychord){1, {{AltMask,                      XK_d}},      incnmaster,     {.i = -1 } }),
	&((Keychord){1, {{MODKEY|ShiftMask,             XK_j}},      setmfact,       {.f = -0.05} }),
	&((Keychord){1, {{MODKEY|ShiftMask,             XK_k}},      setmfact,       {.f = +0.05} }),
	&((Keychord){1, {{AltMask,                 XK_Return}},      zoom,           {0} }),
	&((Keychord){1, {{AltMask,                    XK_Tab}},      view,           {0} }),
	&((Keychord){1, {{MODKEY,                     XK_Tab}},      view,           {0} }),
	&((Keychord){1, {{MODKEY,                       XK_q}},      killclient,     {0} }),
	&((Keychord){1, {{AltMask,                      XK_t}},      setlayout,      {.v = &layouts[0]} }),
	&((Keychord){1, {{AltMask,                      XK_f}},      setlayout,      {.v = &layouts[1]} }),
	&((Keychord){1, {{AltMask,                      XK_m}},      setlayout,      {.v = &layouts[2]} }),
	&((Keychord){1, {{MODKEY,                   XK_space}},      setlayout,      {0} }),
	&((Keychord){1, {{MODKEY,                       XK_f}},      togglefloating, {0} }),
	&((Keychord){1, {{MODKEY,                       XK_0}},      view,           {.ui = ~0 } }),
	&((Keychord){1, {{MODKEY|ShiftMask,             XK_0}},      tag,            {.ui = ~0 } }),
	&((Keychord){1, {{MODKEY,                   XK_comma}},      focusmon,       {.i = -1 } }),
	&((Keychord){1, {{MODKEY,                  XK_period}},      focusmon,       {.i = +1 } }),
	&((Keychord){1, {{MODKEY|ShiftMask,         XK_comma}},      tagmon,         {.i = -1 } }),
	&((Keychord){1, {{MODKEY|ShiftMask,        XK_period}},      tagmon,         {.i = +1 } }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_q}},      quit,           {0} }),
	   TAGKEYS(                        XK_1,                      0)
	   TAGKEYS(                        XK_2,                      1)
	   TAGKEYS(                        XK_3,                      2)
	   TAGKEYS(                        XK_4,                      3)
	   TAGKEYS(                        XK_5,                      4)
	   TAGKEYS(                        XK_6,                      5)
	   TAGKEYS(                        XK_7,                      6)
	   TAGKEYS(                        XK_8,                      7)
	   TAGKEYS(                        XK_9,                      8)
 };

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

