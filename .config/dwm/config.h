/* =====================================================
   -----------------------------------------------------
   |        D W M  C O N F I G U R A T I O N           |
   |          .config/dwm/config.def.h                 |
   |Copy this configuration to config.h to make changes|
   |       to UI. Temp changes to config.h only.       |
   |See LICENSE file for copyright and license details.|
   |          Jason Bradberry, 2024                    |
   -----------------------------------------------------
   =====================================================
*/

/**** APPEARANCE ****/
static const unsigned int borderpx  = 2;      /* border pixel of windows */
static const unsigned int snap      = 32;     /* snap pixel */
static const unsigned int gappih    = 4;      /* horiz inner gap between windows */
static const unsigned int gappiv    = 4;      /* vert inner gap between windows */
static const unsigned int gappoh    = 4;      /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 4;      /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;      /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;      /* 0 means no bar */
static const int topbar             = 1;      /* 0 means bottom bar */
static const int barpadding_x       = 4;      // horizontal padding for the bar (left/right)
static const int barpadding_y       = 4;      // vertical padding for the bar (top)
static const int showsystray        = 1;      /* 0 means no systray */
static const unsigned int systraypinning = 1; /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft  = 0; /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 6; /* systray spacing */
static const int systraypinningfailfirst = 1; /* 1: if pinning fails, display systray on the first monitor,
                                                 False: display systray on the last monitor*/
static const char *fonts[]          = { "NotoSansM Nerd Font Mono:size=10" };
static const char dmenufont[]       = "NotoSansM Nerd Font Mono:size=10";
static const unsigned int baralpha = 0xA3;
static const unsigned int borderalpha = OPAQUE;
static const char col_1[]           = "#282A36";
static const char col_2[]           = "#BD93F9";
static const char col_3[]           = "#6272A4";
static const char col_4[]           = "#F8F8F2";
static const char col_bg[]          = "#1d1b13";
static const char col_border[]      = "#FF79C6";
static const char col_accent[]      = "#50FA7B";
static const char col_pinned[]      = "#FFB86C";
static const char *colors[][3]      = {
/*               fg         bg     border   */
  [SchemeNorm] = { col_4,   col_1,   col_2 },
  [SchemeSel]  = { col_4,   col_1,   col_border },
};
static const unsigned int alphas[][3]      = {
    /*               fg      bg        border*/
  [SchemeNorm] = { OPAQUE, baralpha, borderalpha },
  [SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* TAGS */
static const char *tagsel[][2] = {
 /*   fg         bg    */
  { col_4,      col_1 },                          /* norm */
  { col_1,      col_4 },                          /* sel */
  { col_1,      col_2 },                          /* occ but not sel */
  { col_1,      col_pinned },                     /* has pinned tag */
};


/**** WINDOW RULES AND LAYOUTS ****/
/* TAGGING */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
// static const char *tags[] = { "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX" };
// static const char *tags[] = { "󰬺", "󰬻", "󰬼", "󰬽", "󰬾", "󰬿", "󰭀", "󰭁", "󰭂" };
// static const char *tags[] = { "󰲠", "󰲢", "󰲤", "󰲦", "󰲨", "󰲪", "󰲬", "󰲮", "󰲰" };
// static const char *tags[] = { "󰫮", "󰫱", "󰫴", "󰫷", "M", "󰫽", "󰬀", "󰬃", "󰬇" };

/* RULES */
static const Rule rules[] = {
/* xprop(1):
* WM_CLASS(STRING) = instance, class
* WM_NAME(STRING) = title
   class                       instance title                          tagsmask float mon key  float x,y,w,h   fbor*/
/*{ "Gimp",                      NULL,   NULL,                           0,       1,   -1,  0,  50,50,500,500,   9 },*/
  { "Firefox",                   NULL,   NULL,                           1 << 8,  0,   -1,  0,  50,50,500,500,   9 },
  { NULL,                        NULL,   "termdrop",                     0,       1,   -1, 's', 150,50,1620,900, 4 },
  { NULL,                        NULL,   "yazidrop",                     0,       1,   -1, 'j', 150,50,1620,900, 9 },
  { NULL,                        NULL,   "btopdrop",                     0,       1,   -1, 'l', 150,50,1620,900, 9 },
  { NULL,                        NULL,   "moosicdrop",                   0,       1,   -1, 'm', 150,50,1620,600, 9 },
  { NULL,                        NULL,   "Volume Control",               0,       1,   -1, 'x', 150,50,1620,600, 9 },
  { NULL,                        NULL,   "weatherreport",                0,       1,   -1,  0,  150,50,1620,900, 9 },
  { "mpv",                       NULL,   NULL,                           0,       1,   -1,  0,  50,50,800,450,   9 },
  { "vlc",                       NULL,   NULL,                           0,       1,   -1,  0,  50,50,800,450,   9 },
  { NULL,                        NULL,   "galculator",                   0,       1,   -1,  0,  50,50,800,450,   9 },
  { NULL,                        NULL,   "btrfs-assistant",              0,       1,   -1,  0,  50,50,800,950,   9 },
  { NULL,                        NULL,   "fsearch",                      0,       1,   -1,  0,  50,50,800,450,   9 },
  { NULL,                        NULL,   "Bluetooth Devices",            0,       1,   -1,  0,  50,50,800,450,   9 },
  { NULL,                        NULL,   "Network Connections",          0,       1,   -1,  0,  50,50,800,450,   9 },
  { NULL,                        NULL,   "Garuda Assistant",             0,       1,   -1,  0,  50,50,800,600,   9 },
  { "garuda-welcome",            NULL,   NULL,                           0,       1,   -1,  0,  50,50,800,950,   9 },
  { "garuda-gamer",              NULL,   NULL,                           0,       1,   -1,  0,  50,50,800,950,   9 },
  { "garuda-boot-options",       NULL,   NULL,                           0,       1,   -1,  0,  50,50,800,950,   9 },
  { "garuda-network-assistant",  NULL,   NULL,                           0,       1,   -1,  0,  50,50,800,950,   9 },
  { "garuda-settings-manaager",  NULL,   NULL,                           0,       1,   -1,  0,  50,50,800,950,   9 },
};

/* LAYOUTS */
static const float mfact     = 0.50;          /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;             /* number of clients in master area */
static const int resizehints = 0;             /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1;          /* 1 will force focus on the fullscreen window */
#include "fibonacci.c"
static const Layout layouts[] = {
/* symbol     arrange function */
  { "󰝤󰕱",      tile },                        /* []=first entry is default */
  { "󰉧󰉨",      NULL },                        /* ><>no layout function means floating behavior */
  { "",      monocle },                      /* [M]only one visable window per tag */
  { "󰝤󰁥",      spiral },                      /* [@]much like hyprland*/
  { "󰝤",     dwindle },                      /* [\\]smaller to the SE*/
};

/* AUTOSTART */
static const char *const autostart[] = {
  "/home/moosicmaan/.config/dwm/include/autostart.sh", NULL,
  NULL /* terminate */
};


/**** ENVIRONMENT DEFINITIONS ****/
#define MODKEY Mod4Mask
#define AltMask Mod1Mask
#define MEH (Mod1Mask|ControlMask|ShiftMask)
#define HYPER (Mod1Mask|ControlMask|ShiftMask|Mod4Mask)

#define TAGKEYS(KEY,TAG) \
  &((Keychord){1, {{MODKEY, KEY}},                          view,           {.ui = 1 << TAG} }), \
  &((Keychord){1, {{MODKEY|ControlMask, KEY}},              toggleview,     {.ui = 1 << TAG} }), \
  &((Keychord){1, {{MODKEY|ShiftMask, KEY}},                tag,            {.ui = 1 << TAG} }), \
  &((Keychord){1, {{MEH, KEY}},                             tag,            {.ui = 1 << TAG} }), \
  &((Keychord){1, {{MODKEY|ControlMask|ShiftMask, KEY}},    toggletag,      {.ui = 1 << TAG} }),

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/usr/bin/bash", "-c", cmd, NULL } }

#define STATUSBAR "dwmblocks"

/*   APPLICATION DEFINITIONS   */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
    "dmenu_run",
    "-y", "4", 
    "-x", "4", 
    "-z", "1912",
    "-m", dmenumon, 
    "-fn", dmenufont,
    "-nb", col_1, 
    "-nf", col_3, 
    "-sb", col_bg, 
    "-sf", col_4, 
    NULL
};
static const char *menu_drun[] = { 
    "rofi", 
    "-config", "/home/moosicmaan/.config/rofi/launchers/type-1/style-7.rasi",
    "-show", "drun", 
    NULL 
};
static const char *menu_win[] = { 
    "rofi",
    "-config", "/home/moosicmaan/.config/rofi/launchers/type-1/style-7.rasi",
    "-show", "window", 
    NULL
};
static const char *rofi_power[] = { 
    "rofi", 
    "-config", "/home/moosicmaan/.config/rofi/launchers/type-1/style-9.rasi", 
    "-show", "powermenu", 
    "-modi", "powermenu:~/.config/.scripts/rofi-power", 
    NULL 
};
static const char *termcmd[]  = { "kitty", NULL };
static const char *my_term2[] = { "konsole", NULL };
static const char *browscmd[]  = { "zen-browser", NULL };
static const char *my_browsv[] = { "qutebrowser", NULL };
static const char *my_email[] = { "thunderbird", NULL };
static const char *my_editg[] = { "kate", NULL };
static const char *my_editc[] = { "neovide", NULL };
static const char *my_filesg[] = { "dolphin", NULL };
static const char *my_music[] = { "org.kde.elise", NULL };
static const char *my_media[] = { "vlc", NULL };
static const char *my_image[] = { "gimp", NULL };
static const char *emojis[] = { "pkill", "emote", "||", "emote", NULL };
static const char *calc[] = { "pkill", "galculator", "||", "galculator", NULL };
static const char *variq[] = { "variety", "-q", NULL };
static const char *varin[] = { "variety", "-n", NULL };
static const char *varif[] = { "variety", "-f", NULL };
static const char *varip[] = { "variety", "-p", NULL };
static const char *aichat[] = { "brave", "--app=https://chat.openai.com", NULL };
static const char *kmonadl[] = { "/home/moosicmaan/.config/.scripts/ut-kbd-lap", NULL };
static const char *kmonade[] = { "/home/moosicmaan/.config/.scripts/ut-kbd-350", NULL };
static const char *jamrofi[] = { "/home/moosicmaan/.config/.scripts/rofi-beats", NULL };
static const char *mfavs[] = { "/home/moosicmaan/.config/.scripts/rofi-beat-favs", NULL };
static const char *barch[] = { "/home/moosicmaan/.config/.scripts/rofi-blackmenu", NULL };
static const char *screenshot[] = { "/home/moosicmaan/.config/.scripts/ut-screenshot", NULL };

/*   MEDIA KEYS   */
#include <X11/XF86keysym.h>
static const char *mpp[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--pause", NULL };
static const char *volu[] = { "/home/moosicmaan/.config/.scripts/media-vol", "--inc", NULL };
static const char *vold[] = { "/home/moosicmaan/.config/.scripts/media-vol", "--dec", NULL };
static const char *volt[] = { "/home/moosicmaan/.config/.scripts/media-vol", "--toggle", NULL };
static const char *mnxt[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--nxt", NULL };
static const char *mprv[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--prv", NULL };
static const char *mnow[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--show", NULL };
static const char *mstop[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--pause", NULL };

/*   FOR SCRATCHPADS - First arg only serves to match against key in rules   */
static const char *ter_scratch[] = {"s", "kitty", "-T", "termdrop", NULL};
static const char *yazi_scratch[] = {"j", "kitty", "-T", "yazidrop", "-e", "yazi", NULL};
static const char *btop_scratch[] = {"l", "kitty", "-T", "btopdrop", "-e", "btop", NULL};
static const char *volume_scratch[] = {"x", "pavucontrol", NULL};
static const char *moosic_scratch[] = {
    "m", "kitty",
    "-T", "moosicdrop",
    "-e", "/home/moosicmaan/.config/.scripts/rofi-beats",
    NULL
};

/****KEYCHORDS/KEY BINDINGS****/
static Keychord *keychords[] = {
  /*                Keys                                  function         argument */
  /*   SCRATCHPADS   */
  &((Keychord){1, {{MODKEY|AltMask,               XK_i}}, togglescratch,  {.v = ter_scratch } }),
  &((Keychord){1, {{HYPER,                        XK_8}}, togglescratch,  {.v = ter_scratch } }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_j}}, togglescratch,  {.v = yazi_scratch } }),
  &((Keychord){1, {{HYPER,                        XK_4}}, togglescratch,  {.v = yazi_scratch } }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_m}}, togglescratch,  {.v = moosic_scratch } }),
  &((Keychord){1, {{HYPER,                        XK_1}}, togglescratch,  {.v = moosic_scratch } }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_l}}, togglescratch,  {.v = btop_scratch } }),
  &((Keychord){1, {{HYPER,                        XK_6}}, togglescratch,  {.v = btop_scratch } }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_x}}, togglescratch,  {.v = volume_scratch } }),
  &((Keychord){1, {{HYPER,                        XK_2}}, togglescratch,  {.v = volume_scratch } }),
 
  /*   APPLICATIONS   */
  &((Keychord){1, {{MODKEY,                  XK_Return}}, spawn,          {.v = termcmd } }),
  &((Keychord){1, {{MODKEY|ShiftMask,        XK_Return}}, spawn,          {.v = my_filesg } }),
  &((Keychord){1, {{MODKEY|ControlMask,      XK_Return}}, spawn,          {.v = my_email } }),
  &((Keychord){1, {{MODKEY,                   XK_Print}}, spawn,          {.v = screenshot } }),
  &((Keychord){1, {{0,                        XK_Print}}, spawn,          {.v = screenshot } }),
  &((Keychord){1, {{ControlMask|AltMask,     XK_Delete}}, spawn,          {.v = rofi_power } }),
  &((Keychord){1, {{ControlMask|AltMask,          XK_b}}, spawn,          {.v = barch } }),
  &((Keychord){1, {{ControlMask|AltMask,          XK_m}}, spawn,          {.v = jamrofi } }),
  &((Keychord){1, {{MEH,                          XK_k}}, spawn,          {.v = kmonade } }),
  &((Keychord){1, {{MEH,                          XK_j}}, spawn,          {.v = kmonadl } }),
  &((Keychord){1, {{HYPER,                        XK_i}}, spawn,          {.v = mfavs } }),
  &((Keychord){1, {{MODKEY,                       XK_p}}, spawn,          {.v = dmenucmd } }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_p}}, spawn,          {.v = menu_drun } }),
  &((Keychord){1, {{MODKEY|ControlMask,           XK_p}}, spawn,          {.v = menu_win } }),
  &((Keychord){1, {{MODKEY,                       XK_o}}, spawn,          {.v = browscmd } }),
  &((Keychord){1, {{MODKEY,                       XK_t}}, spawn,          {.v = my_term2 } }),
  &((Keychord){1, {{MODKEY,                       XK_b}}, spawn,          {.v = my_browsv } }),
  &((Keychord){1, {{MODKEY,                       XK_m}}, spawn,          {.v = my_music } }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_m}}, spawn,          {.v = my_media } }),
  &((Keychord){1, {{MODKEY,                       XK_i}}, spawn,          {.v = emojis } }),
  &((Keychord){1, {{MODKEY,                       XK_a}}, spawn,          {.v = aichat } }),
  &((Keychord){1, {{MODKEY,                      XK_F3}}, spawn,          {.v = my_editg } }),
  &((Keychord){1, {{MODKEY,                      XK_F4}}, spawn,          {.v = my_image } }),
  &((Keychord){1, {{AltMask,                      XK_q}}, spawn,          {.v = variq } }),
  &((Keychord){1, {{AltMask,                      XK_n}}, spawn,          {.v = varin } }),
  &((Keychord){1, {{AltMask,                      XK_f}}, spawn,          {.v = varif } }),
  &((Keychord){1, {{AltMask,                      XK_p}}, spawn,          {.v = varip } }),

/*   MEDIA KEYS   */
  &((Keychord){1, {{0,         XF86XK_AudioRaiseVolume}}, spawn,          {.v = volu } }),
  &((Keychord){1, {{0,         XF86XK_AudioLowerVolume}}, spawn,          {.v = vold } }),
  &((Keychord){1, {{0,               XF86XK_AudioMedia}}, spawn,          {.v = mnow } }),
  &((Keychord){1, {{HYPER,                        XK_m}}, spawn,          {.v = mnow } }),
  &((Keychord){1, {{0,                XF86XK_AudioMute}}, spawn,          {.v = volt } }),
  &((Keychord){1, {{0,                XF86XK_AudioPlay}}, spawn,          {.v = mpp } }),
  &((Keychord){1, {{0,                XF86XK_AudioStop}}, spawn,          {.v = mstop } }),
  &((Keychord){1, {{0,                XF86XK_AudioNext}}, spawn,          {.v = mnxt } }),
  &((Keychord){1, {{0,                XF86XK_AudioPrev}}, spawn,          {.v = mprv } }),
  &((Keychord){1, {{0,               XF86XK_Calculator}}, spawn,          {.v = calc } }),

  /*   EXPERIMENTAL   */
  &((Keychord){3, {{MODKEY, XK_space}, {0, XK_o}, {0, XK_y}}, spawn,      {.v = my_media } }),

  /*   -V-NVIM EDITING-V-   */
  &((Keychord){2, {{MODKEY, XK_n}, {0, XK_n}}, spawn,                     {.v = my_editc } }),
  &((Keychord){2, {{MODKEY, XK_n}, {0, XK_m}}, spawn, SHCMD("cd /mnt/data/moosicmaan/CONFIG/ && neovide") }),
  &((Keychord){2, {{MODKEY, XK_n}, {0, XK_c}}, spawn, SHCMD("neovide $HOME/.config/") }),
  &((Keychord){2, {{MODKEY, XK_n}, {0, XK_d}}, spawn, SHCMD("neovide $HOME/.config/dwm/") }),
  &((Keychord){2, {{MODKEY, XK_n}, {0, XK_h}}, spawn, SHCMD("neovide $HOME/.config/hypr/") }),
  &((Keychord){2, {{MODKEY, XK_n}, {0, XK_q}}, spawn, SHCMD("neovide $HOME/.config/qtile/") }),
  &((Keychord){2, {{MODKEY, XK_n}, {0, XK_a}}, spawn, SHCMD("neovide $HOME/.config/awesome/") }),
  &((Keychord){2, {{MODKEY, XK_n}, {0, XK_w}}, spawn, SHCMD("neovide $HOME/.config/waybar/") }),
  &((Keychord){2, {{MODKEY, XK_n}, {0, XK_s}}, spawn, SHCMD("neovide $HOME/.config/.scripts/") }),

  /*   VANITY GAPS   */
  &((Keychord){1, {{MODKEY|AltMask,               XK_0}}, togglegaps,     {0} }),
  &((Keychord){1, {{MODKEY|AltMask|ShiftMask,     XK_0}}, defaultgaps,    {0} }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_g}}, incrgaps,       {.i = +1 } }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_h}}, incrgaps,       {.i = -1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ShiftMask,     XK_h}}, incrogaps,      {.i = +1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ShiftMask,     XK_g}}, incrogaps,      {.i = -1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ControlMask,   XK_h}}, incrigaps,      {.i = +1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ControlMask,   XK_g}}, incrigaps,      {.i = -1 } }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_y}}, incrihgaps,     {.i = +1 } }),
  &((Keychord){1, {{MODKEY|AltMask,               XK_u}}, incrihgaps,     {.i = -1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ControlMask,   XK_y}}, incrivgaps,     {.i = +1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ControlMask,   XK_u}}, incrivgaps,     {.i = -1 } }),
  &((Keychord){1, {{HYPER,                        XK_y}}, incrohgaps,     {.i = +1 } }),
  &((Keychord){1, {{HYPER,                        XK_u}}, incrohgaps,     {.i = -1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ShiftMask,     XK_y}}, incrovgaps,     {.i = +1 } }),
  &((Keychord){1, {{MODKEY|AltMask|ShiftMask,     XK_u}}, incrovgaps,     {.i = -1 } }),
 
  /*   WINDOWS LAYOUTS MONITORS   */
  &((Keychord){1, {{MODKEY|ControlMask,           XK_b}}, togglebar,      {0} }),
  &((Keychord){1, {{MODKEY,                       XK_h}}, focusstack,     {.i = +1 } }),
  &((Keychord){1, {{MODKEY,                       XK_l}}, focusstack,     {.i = -1 } }),
  &((Keychord){1, {{AltMask,                      XK_i}}, incnmaster,     {.i = +1 } }),
  &((Keychord){1, {{AltMask,                      XK_d}}, incnmaster,     {.i = -1 } }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_h}}, setmfact,       {.f = -0.05} }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_l}}, setmfact,       {.f = +0.05} }),
  &((Keychord){1, {{MODKEY,                       XK_0}}, view,           {.ui = ~0 } }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_0}}, tag,            {.ui = ~0 } }),
  &((Keychord){1, {{MODKEY,                   XK_comma}}, focusmon,       {.i = -1 } }),
  &((Keychord){1, {{MODKEY,                  XK_period}}, focusmon,       {.i = +1 } }),
  &((Keychord){1, {{MODKEY|ShiftMask,         XK_comma}}, tagmon,         {.i = -1 } }),
  &((Keychord){1, {{MODKEY|ShiftMask,        XK_period}}, tagmon,         {.i = +1 } }),
  &((Keychord){1, {{MODKEY,                       XK_w}}, zoom,           {0} }),
  &((Keychord){1, {{AltMask,                    XK_Tab}}, view,           {0} }),
  &((Keychord){1, {{MODKEY,                     XK_Tab}}, view,           {0} }),
  &((Keychord){1, {{MODKEY,                       XK_q}}, killclient,     {0} }),
  &((Keychord){1, {{MODKEY,                       XK_f}}, togglefloating, {0} }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_f}}, togglefullscr,  {0} }),
  &((Keychord){1, {{MODKEY,                   XK_space}}, setlayout,      {0} }),
  &((Keychord){1, {{AltMask,                      XK_t}}, setlayout,      {.v = &layouts[0]} }), /*tiling*/
  &((Keychord){1, {{AltMask,                      XK_f}}, setlayout,      {.v = &layouts[1]} }), /*floating*/
  &((Keychord){1, {{AltMask,                      XK_m}}, setlayout,      {.v = &layouts[2]} }), /*monocle/fullscreen*/
  &((Keychord){1, {{AltMask,                      XK_s}}, setlayout,      {.v = &layouts[3]} }), /*spiral*/
  &((Keychord){1, {{AltMask,                      XK_w}}, setlayout,      {.v = &layouts[4]} }), /*dwindle*/

  /*   DWM ACTIONS   */
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_r}}, quit,           {1} }),
  &((Keychord){1, {{MODKEY|ShiftMask,             XK_q}}, quit,           {0} }),
     TAGKEYS(                                       XK_1,                  0)
     TAGKEYS(                                       XK_2,                  1)
     TAGKEYS(                                       XK_3,                  2)
     TAGKEYS(                                       XK_4,                  3)
     TAGKEYS(                                       XK_5,                  4)
     TAGKEYS(                                       XK_6,                  5)
     TAGKEYS(                                       XK_7,                  6)
     TAGKEYS(                                       XK_8,                  7)
     TAGKEYS(                                       XK_9,                  8)
};

/****MOUSE BUTTON DEFINITIONS****/
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
  /* click                event mask      button          function        argument */
  { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
  { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
  { ClkWinTitle,          0,              Button2,        zoom,           {0} },
  { ClkStatusText,        0,              Button1,        sigstatusbar,   {.i = 1} },
  { ClkStatusText,        0,              Button2,        sigstatusbar,   {.i = 2} },
  { ClkStatusText,        0,              Button3,        sigstatusbar,   {.i = 3} },
  { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
  { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
  { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
  { ClkTagBar,            0,              Button1,        view,           {0} },
  { ClkTagBar,            0,              Button3,        toggleview,     {0} },
  { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
  { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
