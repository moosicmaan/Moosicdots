/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }
/* appearance */
static const int sloppyfocus               = 1;  /* focus follows mouse */
static const int bypass_surface_visibility = 0;  /* 1 means idle inhibitors will disable idle tracking even if it's surface isn't visible  */
static const unsigned int borderpx         = 1;  /* border pixel of windows */
static const float rootcolor[]             = COLOR(0x000000ff);
static const float bordercolor[]           = COLOR(0x444444ff);
// static const float focuscolor[]            = COLOR(0x005577ff);
static const float focuscolor[]            = COLOR(0xFFFFFFff);
static const float urgentcolor[]           = COLOR(0xff0000ff);
/* This conforms to the xdg-protocol. Set the alpha to zero to restore the old behavior */
static const float fullscreen_bg[]         = {0.0f, 0.0f, 0.0f, 1.0f}; /* You can also use glsl colors */

/* tagging - TAGCOUNT must be no greater than 31 */
#define TAGCOUNT (9)

/* logging */
static int log_level = WLR_ERROR;

/* NOTE: ALWAYS keep a rule declared even if you don't use rules (e.g leave at least one example) */
static const Rule rules[] = {
	/* app_id             title       tags mask     isfloating   monitor */
	/* examples: */
	{ "Gimp_EXAMPLE",     NULL,       0,            1,           -1 }, /* Start on currently visible tags floating, not tiled */
	{ "firefox_EXAMPLE",  NULL,       1 << 8,       0,           -1 }, /* Start on ONLY tag "9" */
};

/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* monitors */
/* (x=-1, y=-1) is reserved as an "autoconfigure" monitor position indicator
 * WARNING: negative values other than (-1, -1) cause problems with Xwayland clients
 * https://gitlab.freedesktop.org/xorg/xserver/-/issues/899
*/
/* NOTE: ALWAYS add a fallback rule, even if you are completely sure it won't be used */
static const MonitorRule monrules[] = {
	/* name       mfact  nmaster scale layout       rotate/reflect                x    y */
	/* example of a HiDPI laptop monitor:
	{ "eDP-1",    0.5f,  1,      2,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
	*/
	/* defaults */
	{ NULL,       0.50f, 1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
};

/* keyboard */
static const struct xkb_rule_names xkb_rules = {
	/* can specify fields: rules, model, layout, variant, options */
	/* example:
	.options = "ctrl:nocaps",
	*/
	.options = NULL,
};

static const int repeat_rate = 95;
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

/* If you want to use the windows key for MODKEY, use WLR_MODIFIER_LOGO */
#define MODKEY WLR_MODIFIER_LOGO
#define AltMask WLR_MODIFIER_ALT
#define CtrlMask WLR_MODIFIER_CTRL
#define ShiftMask WLR_MODIFIER_SHIFT
#define MEH AltMask|CtrlMask|ShiftMask
#define HYPER AltMask|CtrlMask|ShiftMask|MODKEY

#define TAGKEYS(KEY,SKEY,TAG) \
	{ MODKEY,                    KEY,            view,            {.ui = 1 << TAG} }, \
	{ MODKEY|CtrlMask,           KEY,            toggleview,      {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,          SKEY,           tag,             {.ui = 1 << TAG} }, \
	{ MODKEY|CtrlMask|ShiftMask, SKEY,           toggletag,       {.ui = 1 << TAG} }
	// { MEH,                       SKEY,           tag,             {.ui = 1 << TAG} }, \

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *menu_drun[] = { 
    "rofi", "-config", "/home/moosicmaan/.config/rofi/config.rasi",
    "-show", "drun", 
    NULL 
};
static const char *menu_win[] = { 
    "rofi","-config", "/home/moosicmaan/.config/rofi/config.rasi",
    "-show", "window", 
    NULL
};
static const char *rofi_power[] = { 
    // "rofi", "-config", "/home/moosicmaan/.config/rofi/config-narrow.rasi", 
    // "-show", "powermenu", 
    // "-modi", "powermenu:~/.config/.scripts/rofi-power", 
    "wlogout",
    NULL 
};
static const char *termcmd[]  = { "foot", NULL };
static const char *menucmd[] = { "wmenu-run", NULL };
static const char *my_term2[] = { "kitty", NULL };
static const char *browscmd[]  = { "zen-browser", NULL };
static const char *my_browsv[] = { "qutebrowser", NULL };
static const char *my_email[] = { "thunderbird", NULL };
static const char *my_editg[] = { "kate", NULL };
static const char *my_editc[] = { "neovide", NULL };
static const char *my_filesg[] = { "dolphin", NULL };
static const char *my_music[] = { "org.kde.elisa", NULL };
static const char *my_media[] = { "vlc", NULL };
static const char *my_image[] = { "gimp", NULL };
static const char *emojis[] = { "emote", NULL };
static const char *aichat[] = { "brave", "--app=https://chat.openai.com", NULL };
static const char *kmonadl[] = { "/home/moosicmaan/.config/.scripts/ut-kbd-lap", NULL };
static const char *kmonade[] = { "/home/moosicmaan/.config/.scripts/ut-kbd-350", NULL };
static const char *barch[] = { "/home/moosicmaan/.config/.scripts/rofi-blackmenu", NULL };
static const char *screenshot[] = { "/home/moosicmaan/.config/.scripts/ut-screenshot", NULL };


/*   BACKGROUND/WAYBAR   */
static const char *wallr[] = { "/home/moosicmaan/.config/.scripts/ut-wallpaper", "--random", NULL };
static const char *walls[] = { "/home/moosicmaan/.config/.scripts/ut-wallpaper", "--select", NULL };
static const char *bars[] = { "/home/moosicmaan/.config/.scripts/hypr-barswitch",  NULL };
static const char *bartog[] = { "pkill", "waybar", "||", "/home/moosicmaan/.config/.scripts/hypr-barlaunch", NULL };
static const char *startdwl[] = { "/home/moosicmaan/.config/.scripts/dwl-startup",  NULL };


/*   MEDIA KEYS   */
// #include <xkbcommon/xkbcommon-keysyms.h>
static const char *jamrofi[] = { "/home/moosicmaan/.config/.scripts/rofi-beats", NULL };
static const char *mfavs[] = { "/home/moosicmaan/.config/.scripts/media-favs", NULL };
static const char *calc[] = { "galculator", NULL };
static const char *mpp[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--pause", NULL };
static const char *volu[] = { "/home/moosicmaan/.config/.scripts/media-vol", "--inc", NULL };
static const char *vold[] = { "/home/moosicmaan/.config/.scripts/media-vol", "--dec", NULL };
static const char *volt[] = { "/home/moosicmaan/.config/.scripts/media-vol", "--toggle", NULL };
static const char *mnxt[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--nxt", NULL };
static const char *mprv[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--prv", NULL };
static const char *mnow[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--show", NULL };
static const char *mstop[] = { "/home/moosicmaan/.config/.scripts/media-ctrl", "--pause", NULL };

/*   FOR SCRATCHPADS - First arg only serves to match against key in rules   
static const char *ter_scratch[] = {"s", "kitty", "-T", "termdrop", NULL};
static const char *yazi_scratch[] = {"j", "kitty", "-T", "yazidrop", "-e", "yazi", NULL};
static const char *btop_scratch[] = {"l", "kitty", "-T", "btopdrop", "-e", "btop", NULL};
static const char *volume_scratch[] = {"x", "pavucontrol", NULL};
static const char *moosic_scratch[] = {"m", "kitty", "-T", "moosicdrop", "-e", "/home/moosicmaan/.config/.scripts/rofi-beats", NULL};
*/

static const Key keys[] = {
	/* Note that Shift changes certain key codes: c -> C, 2 -> at, etc. */
	/* modifier                  key                           function          argument */
	{ MODKEY,                    XKB_KEY_p,                    spawn,            {.v = menucmd} },
	{ MODKEY|CtrlMask,           XKB_KEY_p,                    spawn,            {.v = menu_win} },
	{ MODKEY|ShiftMask,          XKB_KEY_P,                    spawn,            {.v = menu_drun} },
	{ MODKEY,                    XKB_KEY_Return,               spawn,            {.v = termcmd} },
	{ MODKEY,                    XKB_KEY_t,                    spawn,            {.v = my_term2} },
	{ MODKEY,                    XKB_KEY_o,                    spawn,            {.v = browscmd} },
	{ MODKEY,                    XKB_KEY_b,                    spawn,            {.v = my_browsv} },
	{ MODKEY|CtrlMask,           XKB_KEY_Return,               spawn,            {.v = my_email} },
	{ MODKEY,                    XKB_KEY_F3,                   spawn,            {.v = my_editg} },
	{ MODKEY,                    XKB_KEY_F5,                   spawn,            {.v = my_editc} },
	{ MODKEY|ShiftMask,          XKB_KEY_Return,               spawn,            {.v = my_filesg} },
	{ MODKEY,                    XKB_KEY_m,                    spawn,            {.v = my_music} },
	{ MODKEY|ShiftMask,          XKB_KEY_M,                    spawn,            {.v = my_media} },
	{ MODKEY,                    XKB_KEY_F4,                   spawn,            {.v = my_image} },
	{ MODKEY,                    XKB_KEY_i,                    spawn,            {.v = emojis} },
	{ MODKEY,                    XKB_KEY_a,                    spawn,            {.v = aichat} },
	{ HYPER,                     XKB_KEY_I,                    spawn,            {.v = mfavs} },
	{ MODKEY,                    XKB_KEY_Print,                spawn,            {.v = screenshot} },
	{ 0,                         XKB_KEY_Print,                spawn,            {.v = screenshot} },
	{ 0,                         XKB_KEY_XF86Calculator,       spawn,            {.v = calc} },
	{ 0,                         XKB_KEY_XF86AudioPlay,        spawn,            {.v = mpp} },
	{ 0,                         XKB_KEY_XF86AudioRaiseVolume, spawn,            {.v = volu} },
	{ 0,                         XKB_KEY_XF86AudioLowerVolume, spawn,            {.v = vold} },
	{ 0,                         XKB_KEY_XF86AudioMute,        spawn,            {.v = volt} },
	{ 0,                         XKB_KEY_XF86AudioNext,        spawn,            {.v = mnxt} },
	{ 0,                         XKB_KEY_XF86AudioPrev,        spawn,            {.v = mprv} },
	{ 0,                         XKB_KEY_XF86AudioStop,        spawn,            {.v = mstop} },
	{ HYPER,                     XKB_KEY_M,                    spawn,            {.v = mnow} },
  { CtrlMask|AltMask,          XKB_KEY_Delete,               spawn,            {.v = rofi_power } },
  { CtrlMask|AltMask,          XKB_KEY_b,                    spawn,            {.v = barch} },
  { CtrlMask|AltMask,          XKB_KEY_k,                    spawn,            {.v = kmonade} },
  { CtrlMask|AltMask,          XKB_KEY_j,                    spawn,            {.v = kmonadl} },
  { CtrlMask|AltMask,          XKB_KEY_m,                    spawn,            {.v = jamrofi} },

  { MODKEY|CtrlMask,           XKB_KEY_d,                    spawn,            {.v = startdwl} },
  { MODKEY|CtrlMask,           XKB_KEY_w,                    spawn,            {.v = wallr} },
  { MODKEY|CtrlMask,           XKB_KEY_s,                    spawn,            {.v = walls} },
  { MODKEY|CtrlMask,           XKB_KEY_t,                    spawn,            {.v = bars} },
  { MODKEY|CtrlMask,           XKB_KEY_b,                    spawn,            {.v = bartog} },
  { MODKEY|AltMask,            XKB_KEY_b,                    togglebar,        {0} },
	{ MODKEY,                    XKB_KEY_h,                    focusstack,       {.i = +1} },
	{ MODKEY,                    XKB_KEY_l,                    focusstack,       {.i = -1} },
	{ MODKEY,                    XKB_KEY_i,                    incnmaster,       {.i = +1} },
	{ MODKEY,                    XKB_KEY_d,                    incnmaster,       {.i = -1} },
	{ MODKEY|ShiftMask,          XKB_KEY_H,                    setmfact,         {.f = -0.05f} },
	{ MODKEY|ShiftMask,          XKB_KEY_L,                    setmfact,         {.f = +0.05f} },
	{ MODKEY,                    XKB_KEY_z,                    zoom,             {0} },
	{ MODKEY,                    XKB_KEY_Tab,                  view,             {0} },
	{ MODKEY,                    XKB_KEY_q,                    killclient,       {0} },
	{ AltMask,                   XKB_KEY_t,                    setlayout,        {.v = &layouts[0]} },
	{ AltMask,                   XKB_KEY_f,                    setlayout,        {.v = &layouts[1]} },
	{ AltMask,                   XKB_KEY_m,                    setlayout,        {.v = &layouts[2]} },
	{ AltMask,                   XKB_KEY_space,                setlayout,        {0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_F,                    togglefullscreen, {0} },
	{ 0,                         XKB_KEY_F1,                   togglefullscreen, {0} },
	{ MODKEY,                    XKB_KEY_f,                    togglefloating,   {0} },
	{ MODKEY,                    XKB_KEY_0,                    view,             {.ui = ~0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_parenright,           tag,              {.ui = ~0} },
	{ MODKEY,                    XKB_KEY_comma,                focusmon,         {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY,                    XKB_KEY_period,               focusmon,         {.i = WLR_DIRECTION_RIGHT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_less,                 tagmon,           {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_greater,              tagmon,           {.i = WLR_DIRECTION_RIGHT} },
	TAGKEYS(          XKB_KEY_1, XKB_KEY_exclam,                                 0),
	TAGKEYS(          XKB_KEY_2, XKB_KEY_at,                                     1),
	TAGKEYS(          XKB_KEY_3, XKB_KEY_numbersign,                             2),
	TAGKEYS(          XKB_KEY_4, XKB_KEY_dollar,                                 3),
	TAGKEYS(          XKB_KEY_5, XKB_KEY_percent,                                4),
	TAGKEYS(          XKB_KEY_6, XKB_KEY_asciicircum,                            5),
	TAGKEYS(          XKB_KEY_7, XKB_KEY_ampersand,                              6),
	TAGKEYS(          XKB_KEY_8, XKB_KEY_asterisk,                               7),
	TAGKEYS(          XKB_KEY_9, XKB_KEY_parenleft,                              8),
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Q,                    quit,             {0} },
	{ MODKEY|CtrlMask,           XKB_KEY_r,                    quit,             {1} },

	/* Ctrl-Alt-Backspace and Ctrl-Alt-Fx used to be handled by X server */
	{ WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_Terminate_Server, quit, {0} },
	/* Ctrl-Alt-Fx is used to switch to another VT, if you don't know what a VT is
	 * do not remove them.
	 */
#define CHVT(n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_XF86Switch_VT_##n, chvt, {.ui = (n)} }
	CHVT(1), CHVT(2), CHVT(3), CHVT(4), CHVT(5), CHVT(6),
	CHVT(7), CHVT(8), CHVT(9), CHVT(10), CHVT(11), CHVT(12),
};

static const Button buttons[] = {
	{ MODKEY, BTN_LEFT,   moveresize,     {.ui = CurMove} },
	{ MODKEY, BTN_MIDDLE, togglefloating, {0} },
	{ MODKEY, BTN_RIGHT,  moveresize,     {.ui = CurResize} },
};
