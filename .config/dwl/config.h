/*
=====================================================
-----------------------------------------------------
|        D W L  C O N F I G U R A T I O N           |
|          .config/dwl/config.def.h                 |
|Copy this configuration to config.h to make changes|
|       to UI. Temp changes to config.h only.       |
|See LICENSE file for copyright and license details.|
|          Jason Bradberry, 2026                    |
-----------------------------------------------------
=====================================================
*/

/**** APPEARANCE ****/
#include "include/colors-wal-dwl.h"
/*
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }
static const float rootcolor[]             = COLOR(0x222222ff);
static const float bordercolor[]           = COLOR(0x444444ff);
static const float focuscolor[]            = COLOR(0x005577ff);
static const float urgentcolor[]           = COLOR(0xff0000ff);
*/
static const float my_focuscolor[]         = COLOR(0xffffffff);
static const int sloppyfocus               = 1;
static const int bypass_surface_visibility = 0;
static const unsigned int borderpx         = 1;
static const unsigned int snap             = 32;
static const float fullscreen_bg[]         = {0.7f, 0.8f, 0.9f, 1.0f};
static const int respect_monitor_reserved_area = 0;

/* tagging - TAGCOUNT must be no greater than 31 */
#define TAGCOUNT (9)

/* logging */
static int log_level = WLR_ERROR;

/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/**** OUTPUTS ****/
/* monitors */
/* (x=-1, y=-1) is reserved as an "autoconfigure" monitor position indicator
 * https://gitlab.freedesktop.org/xorg/xserver/-/issues/899 */
static const MonitorRule monrules[] = {
   /* name        mfact  nmaster scale layout       rotate/reflect               x    y
    * example of a HiDPI laptop monitor:
    { "eDP-1",    0.5f,  1,      2,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL, -1,  -1 }, 
	{ NULL,       0.55f, 1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL, -1,  -1 }, */
    { "eDP-1",    0.5f,  1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL, -1,  -1 },
    { "HDMI-A-1", 0.5f,  1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL, -1,  -1 },
	/* default monitor rule: can be changed but cannot be eliminated; at least one monitor rule must exist */
};

/**** INPUTS ****/
/* keyboard */
static const struct xkb_rule_names xkb_rules = {
	/* can specify fields: rules, model, layout, variant, options */
	/* example:
	.options = "ctrl:nocaps",
	*/
	.options = NULL,
};

static const int repeat_rate = 100;
static const int repeat_delay = 300;

/* Trackpad */
static const int tap_to_click = 1;
static const int tap_and_drag = 1;
static const int drag_lock = 1;
static const int natural_scrolling = 0;
static const int disable_while_typing = 1;
static const int left_handed = 0;
static const int middle_button_emulation = 0;

/* You can choose between:
LIBINPUT_CONFIG_SCROLL_NO_SCROLL
LIBINPUT_CONFIG_SCROLL_2FG
LIBINPUT_CONFIG_SCROLL_EDGE
LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN
*/
static const enum libinput_config_scroll_method scroll_method = LIBINPUT_CONFIG_SCROLL_2FG;

/* You can choose between:
LIBINPUT_CONFIG_CLICK_METHOD_NONE
LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS
LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER
*/
static const enum libinput_config_click_method click_method = LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS;

/* You can choose between:
LIBINPUT_CONFIG_SEND_EVENTS_ENABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE
*/
static const uint32_t send_events_mode = LIBINPUT_CONFIG_SEND_EVENTS_ENABLED;

/* You can choose between:
LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT
LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE
*/
static const enum libinput_config_accel_profile accel_profile = LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE;
static const double accel_speed = 0.0;

/* You can choose between:
LIBINPUT_CONFIG_TAP_MAP_LRM -- 1/2/3 finger tap maps to left/right/middle
LIBINPUT_CONFIG_TAP_MAP_LMR -- 1/2/3 finger tap maps to left/middle/right
*/
static const enum libinput_config_tap_button_map button_map = LIBINPUT_CONFIG_TAP_MAP_LRM;

/* If you want to use the windows key for MOD, use WLR_MODIFIER_LOGO */
#define MOD WLR_MODIFIER_LOGO
#define ALT WLR_MODIFIER_ALT
#define CTRL WLR_MODIFIER_CTRL
#define SHIFT WLR_MODIFIER_SHIFT
#define MEH ALT|CTRL|SHIFT
#define HYPER ALT|CTRL|SHIFT|MOD

#define TAGKEYS(KEY,SKEY,TAG) \
  { MOD,                    KEY,            view,            {.ui = 1 << TAG} }, \
  { MOD|CTRL,               KEY,            toggleview,      {.ui = 1 << TAG} }, \
  { MOD|SHIFT,              SKEY,           tag,             {.ui = 1 << TAG} }, \
  { MEH,                    SKEY,           tag,             {.ui = 1 << TAG} }, \
  { MOD|CTRL|SHIFT, SKEY,                   toggletag,       {.ui = 1 << TAG} }

/**** WINDOW RULES ****/
static const Rule rules[] = {
  /* app_id     title           tags float mon skey   x     y    w     h
       Start on currently visible tags floating, not tiled
       Start on ONLY tag "9"
  { "Gimp_EXAMPLE", NULL,        0,   1,   -1,  0      -1,   -1, 1000, 0.75  },
  { "firefox_EXAMPLE", NULL,  1 << 8, 0,   -1,  0      -1,   -1,   -1, -1    }, */
  { NULL,      "termdrop",       0,   1,   -1, 'd',   150,    0, 1620, 900   },
  { NULL,      "yazidrop",       0,   1,   -1, 'h',   150,   90, 1620, 900   },
  { NULL,      "btopdrop",       0,   1,   -1, 's',   150,  180, 1620, 900   },
  { NULL,      "volume",         0,   1,   -1, 'x',   500,   90,  920, 400   },
  { NULL,      "moosicdrop",     0,   1,   -1, 'm',   500,   90,  920, 500   },
  { NULL,      "bluedrop",       0,   1,   -1, 'b',   500,   90,  920, 500   },
  { "mpv",      NULL,            0,   1,   -1,  0,    500,   90,  920, 518   },
  { "vlc",      NULL,            0,   1,   -1,  0,    500,   90,  920, 518   },
  { NULL,      "galculator",     0,   1,   -1,  0,    750,   90,  420, 450   },
  { "spotube",  NULL,         1 << 0, 0,    1,  0,     -1,   -1,   -1,  -1   }, 
  /* default/example rule: can be changed but cannot be eliminated; at least one rule must exist */
};

/* named scratchpads - First arg only serves to match against key in rules*/
static const char *ter_scratch[] = { "d", "kitty", "-T", "termdrop", NULL };
static const char *yazi_scratch[] = { "h", "kitty", "-T", "yazidrop", "-e", "yazi", NULL };
static const char *btop_scratch[] = { "s", "kitty", "-T", "btopdrop", "-e", "btop", NULL };
static const char *volume_scratch[] = { "x", "kitty", "-T", "volume", "-e", "wiremix", NULL };
static const char *moosic_scratch[] = { "m", "kitty", "-T", "moosicdrop", "-e", "pianobar", NULL };
static const char *bt_scratch[] = { "b", "kitty", "-T", "bluedrop", "-e", "bluetui", NULL };

/****   COMMAND DEFINITIONS   ****/

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define DOTS_DIR "/mnt/data/moosicmaan/CONFIG"
#define CONFIG_DIR "/home/moosicmaan/.config"
#define SCRIPTS_DIR "/home/moosicmaan/.config/.scripts"

/* MENUS */
static const char *menu_run[] = {
    "sh", "-c",
    "pkill rofi || rofi -config " CONFIG_DIR
    "/rofi/dmenu.rasi -show run",
    NULL
};
static const char *menu_drun[] = {
    "sh", "-c",
    "pkill rofi || rofi -config " CONFIG_DIR
    "/rofi/config.rasi -show drun",
    NULL
};
static const char *menu_win[] = {
    "sh", "-c",
    "pkill rofi || rofi -config " CONFIG_DIR
    "/rofi/config.rasi -show window",
    NULL
};
static const char *rofi_power[] = { "wlogout", NULL };

/* APPLICATIONS */
static const char *termcmd[]  = { "kitty", NULL };
static const char *my_term2[] = { "alcritty", NULL };
static const char *browscmd[]  = { "zen-browser", NULL };
static const char *my_browsv[] = { "qutebrowser", NULL };
static const char *my_email[] = { "thunderbird", NULL };
static const char *my_editg[] = { "kate", NULL };
static const char *my_editc[] = { "sh", "-c", "kitty -e nvim", NULL };
static const char *my_filesg[] = { "dolphin", NULL };
static const char *my_filesc[] = { "sh", "-c", "kitty -e yazi", NULL };
static const char *my_office[] = { "onlyoffice-desktopeditors", NULL };
static const char *my_image[] = { "gimp", NULL };
static const char *emojis[] = { "sh", "-c", "pkill emote || emote", NULL };
static const char *aichat[] = { "brave", "--app=https://chat.openai.com", NULL };
static const char *kmonadl[] = { SCRIPTS_DIR "/ut-kbd-lap", NULL };
static const char *kmonade[] = { SCRIPTS_DIR "/ut-kbd-350", NULL };
static const char *barch[] = { SCRIPTS_DIR "/rofi-blackmenu", NULL };
static const char *screenshot[] = { SCRIPTS_DIR "/ut-screenshot", NULL };
static const char *edit_config[] = { 
    "sh", "-c",
    "cd " DOTS_DIR " && kitty -e nvim",
    NULL 
};

/* BACKGROUND/WAYBAR */
static const char *wallr[] = { SCRIPTS_DIR "/ut-wallpaper", "--random", NULL };
static const char *walls[] = { SCRIPTS_DIR "/ut-wallpaper", "--select", NULL };
static const char *bars[] = { SCRIPTS_DIR "/wb-switch",  NULL };
static const char *bartog[] = {
    "sh", "-c", "pkill waybar || " SCRIPTS_DIR "/wb-launch", NULL };

/* MEDIA / MEDIA KEYS */
// #include <xkbcommon/xkbcommon-keysyms.h>
static const char *my_music[] = { "spotube", NULL };
static const char *my_media[] = { "mpv", "--player-operation-mode=pseudo-gui", NULL };
static const char *jamrofi[] = { SCRIPTS_DIR "/rofi-beats", NULL };
static const char *mfavs[] = { SCRIPTS_DIR "/rofi-beat-favs", NULL };
static const char *mpp[] = { SCRIPTS_DIR "/media-ctrl", "--pause", NULL };
static const char *volu[] = { SCRIPTS_DIR "/media-vol", "--inc", NULL };
static const char *vold[] = { SCRIPTS_DIR "/media-vol", "--dec", NULL };
static const char *volt[] = { SCRIPTS_DIR "/media-vol", "--toggle", NULL };
static const char *mnxt[] = { SCRIPTS_DIR "/media-ctrl", "--nxt", NULL };
static const char *mprv[] = { SCRIPTS_DIR "/media-ctrl", "--prv", NULL };
static const char *mnow[] = { SCRIPTS_DIR "/media-ctrl", "--show", NULL };
static const char *mstop[] = { SCRIPTS_DIR "/media-ctrl", "--pause", NULL };
static const char *calc[] = { "sh", "-c", "pkill galculator || galculator", NULL };

/* HELPER FUNCTIONS */
static const char *thisreen[] = { SCRIPTS_DIR "/ut-this-screen", NULL };

static void
focusmonleft_notify(const Arg *arg)
{
    Arg left = { .i = WLR_DIRECTION_LEFT };

    focusmon(&left);
    spawn(&(Arg){ .v = thisreen });
}

static void
focusmonright_notify(const Arg *arg)
{
    Arg left = { .i = WLR_DIRECTION_RIGHT };

    focusmon(&left);
    spawn(&(Arg){ .v = thisreen });
}

/****   KEYBINDINGS   ****/
static const Key keys[] = {
/* modifier    key                           function               argument */
/*---SCRATCHPADS---*/
  { HYPER,     XKB_KEY_4,                    focusortogglematchingscratch, {.v = yazi_scratch } },
  { HYPER,     XKB_KEY_8,                    togglescratch,        {.v = ter_scratch } },
  { HYPER,     XKB_KEY_2,                    focusortogglescratch, {.v = volume_scratch } },
  { HYPER,     XKB_KEY_1,                    focusortogglescratch, {.v = moosic_scratch } },
  { HYPER,     XKB_KEY_6,                    focusortogglescratch, {.v = btop_scratch } },
  { MOD|ALT,   XKB_KEY_d,                    focusortogglescratch, {.v = ter_scratch } },
  { MOD|ALT,   XKB_KEY_x,                    focusortogglescratch, {.v = volume_scratch } },
  { MOD|ALT,   XKB_KEY_m,                    focusortogglescratch, {.v = moosic_scratch } },
  { MOD|ALT,   XKB_KEY_s,                    focusortogglescratch, {.v = btop_scratch } },
  { MOD|ALT,   XKB_KEY_h,                    focusortogglescratch, {.v = yazi_scratch } },
  { MOD|ALT,   XKB_KEY_b,                    focusortogglescratch, {.v = bt_scratch } },
/*---APPLICATIONS---*/
  { MOD,       XKB_KEY_Return,               spawn,                {.v = termcmd} },
  { MOD|CTRL,  XKB_KEY_Return,               spawn,                {.v = my_email} },
  { MOD|SHIFT, XKB_KEY_Return,               spawn,                {.v = my_filesg} },
  { MOD,       XKB_KEY_t,                    spawn,                {.v = my_term2} },
  { MOD,       XKB_KEY_n,                    spawn,                {.v = edit_config} },
  { MOD,       XKB_KEY_o,                    spawn,                {.v = browscmd} },
  { MOD,       XKB_KEY_b,                    spawn,                {.v = my_browsv} },
  { MOD,       XKB_KEY_i,                    spawn,                {.v = emojis} },
  { CTRL|ALT,  XKB_KEY_a,                    spawn,                {.v = aichat} },
  { MOD,       XKB_KEY_Print,                spawn,                {.v = screenshot} },
  { MOD,       XKB_KEY_F3,                   spawn,                {.v = my_filesc} },
  { MOD,       XKB_KEY_F4,                   spawn,                {.v = my_editg} },
  { MOD,       XKB_KEY_F4,                   spawn,                {.v = my_image} },
  { MOD,       XKB_KEY_F5,                   spawn,                {.v = my_editc} },
  { MOD,       XKB_KEY_F6,                   spawn,                {.v = my_office} },
/*---MEDIA / MEDIA KEYS---*/
  { MOD,       XKB_KEY_m,                    spawn,                {.v = my_music} },
  { MOD|SHIFT, XKB_KEY_M,                    spawn,                {.v = my_media} },
  { 0,         XKB_KEY_Print,                spawn,                {.v = screenshot} },
  { 0,         XKB_KEY_XF86Calculator,       spawn,                {.v = calc} },
  { 0,         XKB_KEY_XF86AudioPlay,        spawn,                {.v = mpp} },
  { 0,         XKB_KEY_XF86AudioRaiseVolume, spawn,                {.v = volu} },
  { 0,         XKB_KEY_XF86AudioLowerVolume, spawn,                {.v = vold} },
  { 0,         XKB_KEY_XF86AudioMute,        spawn,                {.v = volt} },
  { 0,         XKB_KEY_XF86AudioNext,        spawn,                {.v = mnxt} },
  { 0,         XKB_KEY_XF86AudioPrev,        spawn,                {.v = mprv} },
  { 0,         XKB_KEY_XF86AudioStop,        spawn,                {.v = mstop} },
  { HYPER,     XKB_KEY_d,                    spawn,                {.v = mfavs} },
  { HYPER,     XKB_KEY_l,                    spawn,                {.v = mnow} },
  { CTRL|ALT,  XKB_KEY_m,                    spawn,                {.v = jamrofi} },
/*---MENUS/SELECTORS---*/
  { MOD,       XKB_KEY_p,                    spawn,                {.v = menu_run} },
  { MOD|CTRL,  XKB_KEY_p,                    spawn,                {.v = menu_win} },
  { MOD|SHIFT, XKB_KEY_P,                    spawn,                {.v = menu_drun} },
  { CTRL|ALT,  XKB_KEY_Delete,               spawn,                {.v = rofi_power } },
  { CTRL|ALT,  XKB_KEY_b,                    spawn,                {.v = barch} },
  { MOD|CTRL,  XKB_KEY_b,                    spawn,                {.v = bartog} },
  { MOD|CTRL,  XKB_KEY_w,                    spawn,                {.v = wallr} },
  { MOD|CTRL,  XKB_KEY_s,                    spawn,                {.v = walls} },
  { MOD|CTRL,  XKB_KEY_t,                    spawn,                {.v = bars} },
  { HYPER,     XKB_KEY_b,                    togglebar,            {0} },
/*--DWL/ENVIRONMENT---*/
  { CTRL|ALT,  XKB_KEY_k,                    spawn,                {.v = kmonade} },
  { CTRL|ALT,  XKB_KEY_j,                    spawn,                {.v = kmonadl} },
  { MOD,       XKB_KEY_q,                    killclient,           {0} },
  { MOD,       XKB_KEY_h,                    focusstack,           {.i = +1} },
  { MOD,       XKB_KEY_l,                    focusstack,           {.i = -1} },
  { MOD,       XKB_KEY_i,                    incnmaster,           {.i = +1} },
  { MOD,       XKB_KEY_d,                    incnmaster,           {.i = -1} },
  { MOD|SHIFT, XKB_KEY_H,                    setmfact,             {.f = -0.05f} },
  { MOD|SHIFT, XKB_KEY_L,                    setmfact,             {.f = +0.05f} },
  { MOD,       XKB_KEY_z,                    zoom,                 {0} },
  { MOD,       XKB_KEY_Tab,                  view,                 {0} },
  { ALT,       XKB_KEY_t,                    setlayout,            {.v = &layouts[0]} },
  { ALT,       XKB_KEY_f,                    setlayout,            {.v = &layouts[1]} },
  { ALT,       XKB_KEY_m,                    setlayout,            {.v = &layouts[2]} },
  { ALT,       XKB_KEY_space,                setlayout,            {0} },
  { MOD|SHIFT, XKB_KEY_F,                    togglefullscreen,     {0} },
  { 0,         XKB_KEY_F11,                  togglefullscreen,     {0} },
  { MOD,       XKB_KEY_f,                    togglefloating,       {0} },
  { MOD,       XKB_KEY_0,                    view,                 {.ui = ~0} },
  { MOD|SHIFT, XKB_KEY_parenright,           tag,                  {.ui = ~0} },
  { MOD,       XKB_KEY_comma,                focusmonleft_notify,  {0} },
  { MOD,       XKB_KEY_period,               focusmonright_notify, {0} },
  { MOD|SHIFT, XKB_KEY_less,                 tagmon,               {.i = WLR_DIRECTION_LEFT} },
  { MOD|SHIFT, XKB_KEY_greater,              tagmon,               {.i = WLR_DIRECTION_RIGHT} },
  { MOD|SHIFT, XKB_KEY_Q,                    quit,                 {0} },

  TAGKEYS(     XKB_KEY_1, XKB_KEY_exclam,                          0),
  TAGKEYS(     XKB_KEY_2, XKB_KEY_at,                              1),
  TAGKEYS(     XKB_KEY_3, XKB_KEY_numbersign,                      2),
  TAGKEYS(     XKB_KEY_4, XKB_KEY_dollar,                          3),
  TAGKEYS(     XKB_KEY_5, XKB_KEY_percent,                         4),
  TAGKEYS(     XKB_KEY_6, XKB_KEY_asciicircum,                     5),
  TAGKEYS(     XKB_KEY_7, XKB_KEY_ampersand,                       6),
  TAGKEYS(     XKB_KEY_8, XKB_KEY_asterisk,                        7),
  TAGKEYS(     XKB_KEY_9, XKB_KEY_parenleft,                       8),

  /* Ctrl-Alt-Backspace and Ctrl-Alt-Fx used to be handled by X server */
  { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_Terminate_Server, quit, {0} },
  /* Ctrl-Alt-Fx is used to switch to another VT, if you don't know what a VT is
   * do not removethem.
   */
#define CHVT(n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_XF86Switch_VT_##n, chvt, {.ui = (n)} }
  CHVT(1), CHVT(2), CHVT(3), CHVT(4), CHVT(5), CHVT(6),
  CHVT(7), CHVT(8), CHVT(9), CHVT(10), CHVT(11), CHVT(12),
};

static const Button buttons[] = {
  { MOD, BTN_LEFT,   moveresize,     {.ui = CurMove} },
  { MOD, BTN_MIDDLE, togglefloating, {0} },
  { MOD, BTN_RIGHT,  moveresize,     {.ui = CurResize} },
};

static const Axis axes[] = {
    /* example of volume control:
    { MOD, AxisUp, spawn, SHCMD("volume-up") },
    { MOD, AxisDown, spawn, SHCMD("volume-down") }, */
    { 0, 0, NULL, {0} },
};
