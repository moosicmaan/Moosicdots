#include QMK_KEYBOARD_H
// Layer 0
#define L1_B    LT1(KC_B)
#define L2_Y    LT2(KC_Y)
#define L3_O    LT3(KC_O)
#define MEHT_U  MEH_T(KC_U)
#define HALL_q  ALL_T(KC_QUOTE)

#define ESC     KC_ESCAPE
#define LS_C    LSFT_T(KC_C)
#define LC_I    LCTL_T(KC_I)
#define LG_E    LGUI_T(KC_E)
#define LA_A    LALT_T(KC_A)
#define COMMA   KC_COMMA

#define L5_X    LT5(KC_X)
#define MINUS   KC_MINUS

#define L3_HOME LT3(KC_HOME)
#define L2_BSPC LT2(KC_BSPACE)
#define SPACE   KC_SPACE

#define L1_V    LT1(KC_V)
#define L2_W    LT2(KC_W)
#define L3_D    LT3(KC_D)
#define MEHT_L  MEH_T(KC_L)
#define HALL_s  ALL_T(KC_SCOLON)

#define RS_N    RSFT_T(KC_N)
#define RC_S    RCTL_T(KC_S)
#define RG_T    RGUI_T(KC_T)
#define RA_H    RALT_T(KC_H)

#define ALT_REP QK_ALT_REPEAT_KEY
#define SLASH   KC_SLASH

#define L5_END  LT5(KC_END)
#define L4_DEL  LT4(KC_DELETE)
#define L1_ENT  LT1(KC_ENTER)

// Layer 1
#define PAUSE   KC_PAUSE
#define ESC     KC_ESCAPE
#define SCROLLL KC_SCROLLLOCK

#define INSERT  KC_INSERT

#define BSPC    KC_BSPACE

#define PLUS    LCTL(KC_KP_PLUS)
#define EQUAL   LCTL(KC_EQUAL)
#define MINUS   LCTL(KC_MINUS)

#define ENTER   KC_ENTER
#define RIGHT   KC_RIGHT
#define UP      KC_UP
#define DOWN    KC_DOWN
#define LEFT    KC_LEFT

// Layer 2
#define OMEH    OSM(MOD_MEH)
#define OHYPER  OSM(MOD_HYPR)

#define PERCENT LSFT(KC_5)

#define LS      KC_LSHIFT",
#define LC      KC_LCTRL",
#define LG      KC_LGUI",
#define LA      KC_LALT",

#define KP_MIN   KC_KP_MINUS",
#define KP_PLUS  KC_KP_PLUS",

#define SLASH   KC_KP_SLASH",
#define ASTER   KC_KP_ASTERISK",

#define EQUAL   KC_EQUAL",

// Layer 3

#define LC_T    LCA(KC_T)",

#define LC_A    LCTL(KC_A)",
#define LC_G    LCA(KC_G)",

#define KC_PSCR KC_PSCREEN",
#define LC_Z    LCTL(KC_Z)",
#define LC_X    LCTL(KC_X)",
#define LC_C    LCTL(KC_C)",
#define LC_V    LCTL(KC_V)",

#define LCA_DEL LCA(KC_DELETE)",

// Layer 4





t
#ifdef LAYOUT_split_3x6_3_ex2
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [0] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
      KC_TAB,    L1_B,    L2_Y,    L3_O,  MEHT_U, HALL_q,  KC_PGUP,    KC_WH_U, HALL_s,  MEHT_L,  L3_D,    L2_W,    L1_V,    KC_Z,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
         ESC,    LS_C,    LC_I,    LG_E,    LA_A, COMMA,   KC_PGDN,    KC_WH_D, KC_DOT,  RA_H,    RG_T,    RC_S,    RS_N,    KC_Q,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
       TD(0),    KC_G,    L5_X,    KC_J,    KC_K, KC_MINUS,                     SLASH,   KC_R,    KC_M,    KC_F,    KC_P,    ALT_REP,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                        L3_HOME, L2_BSPC,    SPACE,    L1_ENT,   L4_DEL,   L5_END
  //                                    |--------------------------|  |--------------------------|
  ),

  [1] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS, KC_PAUS,     ESC, KC_WH_U, SCROLLL, KC_ACL2, KC_TRNS,    KC_TRNS, KC_NO,   MINUS,   EQUAL,   PLUS,    KC_NO,   KC_NO,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,  INSERT, KC_WH_L, KC_WH_D, KC_WH_R, KC_ACL1, KC_TRNS,    KC_TRNS, LEFT,    DOWN,    UP,      RIGHT,   ENTER,   KC_NO,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_BTN5, KC_BTN4, KC_BTN3, KC_BTN2, KC_BTN1, KC_ACL0,                      KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, KC_BTN1, KC_BTN2,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         KC_TRNS, KC_TRNS,    BSPC,    KC_TRNS,  KC_TRNS, KC_TRNS
  //                                    |--------------------------|  |--------------------------|
  ),

                -1
  [2] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS, XXXXXXX, XXXXXXX, XXXXXXX,    OMEH,  OHYPER, KC_TRNS,    KC_TRNS, PERCENT, KC_7,    KC_8,    KC_9,    KP_PLUS, KP_MIN,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,      LS,      LC,      LG,      LA,   COMMA, KC_TRNS,    KC_TRNS, KC_DOT,  KC_4,    KC_5,    KC_6,    ASTER,   SLASH,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
          LS, XXXXXXX, PERCENT, XXXXXXX, XXXXXXX,   MINUS,                      SPACE,   KC_1,    KC_2,    KC_3,    KC_DOT,  EQUAL
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         KC_TRNS, KC_TRNS,    BSPC,    KC_TRNS, KC_0, KC_TRNS
  //                                    |--------------------------|  |--------------------------|
  ),

1
  [3] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,  KC_TAB,     ESC, XXXXXXX,    LC_R,    LC_T, KC_TRNS,    KC_TRNS, XXXXXXX, KC_F7,   KC_F8,   KC_F9,   KC_F10,  XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,    LC_A,      LC,      LG,      LA,    LA_G, KC_TRNS,    KC_TRNS, XXXXXXX, KC_F4,   KC_F5,   KC_F6,   KC_F11,  XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_PSCR,    LC_Z,    LC_X,    LC_C,    LC_V, XXXXXXX,                      XXXXXXX, KC_F1,   KC_F2,   KC_F3,   KC_F12,  LCA_DEL,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                        KC_TRNS,  KC_TRNS,    BSPC,    KC_TRNS,  L4_DEL, KC_TRNS,
  //                                    |--------------------------|  |--------------------------|
  ),

  [4] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,    LS_4,    LS_1, KC_LBRC, KC_RBRC,    LS_8, KC_TRNS,    KC_TRNS, LS_7,    KC_QUOT, LS_QUOT, KC_SCLN, KC_PPLS, KC_PMNS,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,    LS_2,    LS_3,    LS_9,    LS_0, KC_MINS, KC_TRNS,    KC_TRNS, KC_SLSH, LS_BSLS, KC_BSLS, KC_EQL,  KC_PAST, KC_PSLS,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_LSFT,  LS_GRV,    LS_5, LS_LBRC, LS_RBRC, LS_MINS,                      LS_6,    LS_4,    LS_COMM, LS_DOT,  KC_PDOT, KC_PEQL,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                        KC_TRNS, KC_TRNS,     BSPC,    KC_TRNS,  L4_DEL, KC_TRNS
  //                                    |--------------------------|  |--------------------------|
  ),

  [5] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, RM_TOGG,  MEH_UP,    HYPR_UP,  KC_MSEL, HYPR_U,  HYPR_I,  KC_MUTE, KC_MPLY, KC_CALC,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     RM_SPDU, RM_VALU, RM_SATU, RM_HUEU, RM_NEXT,   RM_ON, MEH_DWN,    HYPR_DN,  KC_MPRV, KC_VOLD, KC_VOLU, KC_MNXT, KC_MSTP, KC_EJCT,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     RM_SPDD, RM_VALD, RM_SATD, RM_HUED, RM_PREV,  RM_OFF,                      XXXXXXX, HYPR_M,  HYPR_co, HYPR_dt, XXXXXXX, TG(6),
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                        KC_TRNS, KC_TRNS,     BSPC,    KC_TRNS,  KC_TRNS, KC_TRNS
  //                                    |--------------------------|  |--------------------------|
  ),

  [6] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
      KC_TAB,    KC_Q,    KC_W,    KC_E,    KC_R,    KC_T, KC_VOLU,    KC_MPLY, KC_Y,    KC_7,    KC_8,    KC_9,    KC_P,    KC_BSPC,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
      KC_ESC,    KC_A,    KC_S,    KC_D,    KC_F,    KC_G, KC_VOLD,    KC_MNXT, KC_H,    KC_4,    KC_5,    KC_6,    KC_SCLN, KC_QUOT,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_LSFT,    KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,                      KC_0,    KC_1,    KC_2,    KC_3,    KC_SLSH, TG(6),
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         KC_LCTL, KC_LALT,  KC_SPC,    KC_ENT,  KC_DEL,  KC_LGUI
  //                                    |--------------------------|  |--------------------------|
  ),

  [7] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         XXXXXXX, XXXXXXX,  KC_SPC,     XXXXXXX, XXXXXXX, XXXXXXX
  //                                    |--------------------------|  |--------------------------|
  )
};
