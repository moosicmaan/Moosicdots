#include QMK_KEYBOARD_H


#define MEHT_R  MEH_T(KC_R)
#define MEHT_U  MEH_T(KC_U)
#define MEH_D   MEH(KC_D)
#define MEH_U   MEH(KC_U)
#define OMEH    OSM(MOD_MEH) 
#define HYPR_U  HYPR(KC_U)
#define HYPR_M  HYPR(KC_M)
#define HYPR_I  HYPR(KC_I)
#define HYPR_D  HYPR(KC_D)
#define HYPRT_T HYPR_T(KC_T)
#define HYPRT_Y HYPR_T(KC_Y)
#define OHYPER  OSM(MOD_HYPR)
#define L1_Q    LT(1,KC_Q)
#define L1_ENT  LT(1,KC_ENT)
#define L1_P    LT(1,KC_P)
#define L2_W    LT(2,KC_W)
#define L2_O    LT(2,KC_O)
#define L2_BSPC LT(2,KC_BSPC) 
#define L3_E    LT(3,KC_E)
#define L3_I    LT(3,KC_I)
#define L3_HOME LT(3,KC_HOME) 
#define L4_QUOT LT(4,KC_QUOT)
#define L4_DEL  LT(4,KC_DEL) 
#define L5_X    LT(5,KC_X)
#define L5_END  LT(5,KC_END)
#define LG_D    LGUI_T(KC_D) 
#define LA_F    LALT_T(KC_F)
#define LC_MINS LCTL(KC_MINS) 
#define LC_EQL  LCTL(KC_EQL) 
#define LC_PPLS LCTL(KC_PPLS)
#define LC_S    LCTL_T(KC_S) 
#define LC_R    LCTL(KC_R)
#define LC_A    LCTL(KC_A) 
#define LC_Z    LCTL(KC_Z) 
#define LC_X    LCTL(KC_X) 
#define LC_C    LCTL(KC_C) 
#define LC_V    LCTL(KC_V)
#define LC_LS   LCTL(KC_LSFT)
#define LCA_F5  LCA(KC_F5)
#define LCA_F1  LCA(KC_F1)
#define LCA_DEL LCA(KC_DEL)
#define LS_A    LSFT_T(KC_A) 
#define LS_1    LSFT(KC_1)
#define LS_2    LSFT(KC_2)
#define LS_3    LSFT(KC_3)
#define LS_4    LSFT(KC_4)
#define LS_5    LSFT(KC_5)
#define LS_6    LSFT(KC_6)
#define LS_7    LSFT(KC_7)
#define LS_8    LSFT(KC_8)
#define LS_9    LSFT(KC_9)
#define LS_0    LSFT(KC_0)
#define LS_QUOT LSFT(KC_QUOT)
#define LS_BSLS LSFT(KC_BSLS)
#define LS_LBRC LSFT(KC_LBRC)
#define LS_RBRC LSFT(KC_RBRC)
#define LS_MINS LSFT(KC_MINS)
#define LS_SLSH LSFT(KC_SLSH)
#define LS_COMM LSFT(KC_COMM)
#define LS_GRV  LSFT(KC_GRV)
#define LS_DOT  LSFT(KC_DOT)
#define CS_EQL  LCTL(KC_KP_PLUS)
#define RS_SCLN RSFT_T(KC_SCLN) 
#define RA_M    RALT_T(KC_M) 
#define RG_COMM RGUI_T(KC_COMM) 
#define RC_DOT  RCTL_T(KC_DOT) 
#define RS_SLSH RSFT_T(KC_SLASH)
#define ALT_REP QK_ALT_REPEAT_KEY


#ifdef LAYOUT_split_3x6_3_ex2
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [0] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
      KC_TAB,   L1_Q,     L2_W,    L3_E,  MEHT_R, HYPRT_T, KC_PGUP,    KC_WH_U, HYPRT_Y, MEHT_U,  L3_I,    L2_O,    L1_P,    KC_BSLS,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
      KC_ESC,    LS_A,    LC_S,    LG_D,    LA_F,    KC_G, KC_PGDN,    KC_WH_D, KC_H,    KC_J,    KC_K,    KC_L,    RS_SCLN, L4_QUOT,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
       TD(0),    KC_Z,    L5_X,    KC_C,    KC_V,    KC_B,                      KC_N,    RA_M,    RG_COMM, RC_DOT,  RS_SLSH, ALT_REP,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                        L3_HOME, L2_BSPC, KC_SPACE,    L1_ENT,   L4_DEL,   L5_END
  //                                    |--------------------------|  |--------------------------|
  ),

  [1] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS, KC_PAUS,  KC_ESC, MS_WHLU, KC_SCRL, KC_ACL2, KC_TRNS,    KC_TRNS, KC_NO,   LC_MINS, LC_EQL,  CS_EQL,  KC_NO,   KC_NO,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,  KC_INS, MS_WHLL, MS_WHLD, MS_WHLR, KC_ACL1, KC_TRNS,    KC_TRNS, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_ENT, KC_NO,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_BTN5, KC_BTN4, KC_BTN3, KC_BTN2, KC_BTN1, KC_ACL0,                      MS_LEFT, MS_DOWN, MS_UP,   MS_RGHT, KC_BTN1, KC_BTN2,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         KC_TRNS, KC_TRNS, KC_BSPC,    KC_TRNS,  KC_TRNS, KC_TRNS
  //                                    |--------------------------|  |--------------------------|
  ),

  [2] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS, XXXXXXX, XXXXXXX, XXXXXXX,    OMEH,  OHYPER, KC_TRNS,    KC_TRNS, XXXXXXX, KC_7,    KC_8,    KC_9,    KC_PPLS, KC_PMNS,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS, KC_LSFT, KC_LCTL, KC_LGUI, KC_LALT, XXXXXXX, KC_TRNS,    KC_TRNS, XXXXXXX, KC_4,    KC_5,    KC_6,    KC_PAST, KC_PSLS,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_LSFT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_0,    KC_1,    KC_2,    KC_3,    KC_PDOT, KC_PEQL,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         KC_TRNS, KC_TRNS, KC_BSPC,    KC_TRNS,  KC_TRNS, KC_TRNS
  //                                    |--------------------------|  |--------------------------|
  ),

  [3] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,  KC_TAB,  KC_ESC, XXXXXXX,    LC_R, XXXXXXX, KC_TRNS,    KC_TRNS, XXXXXXX, KC_F7,   KC_F8,   KC_F9,   KC_F10,  LCA_F5,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,    LC_A,   LC_LS, KC_LGUI, KC_FIND, XXXXXXX, KC_TRNS,    KC_TRNS, XXXXXXX, KC_F4,   KC_F5,   KC_F6,   KC_F11,  LCA_F1,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_PSCR,    LC_Z,    LC_X,    LC_C,    LC_V, XXXXXXX,                      XXXXXXX, KC_F1,   KC_F2,   KC_F3,   KC_F12,  LCA_DEL,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                        KC_TRNS,  KC_TRNS, KC_BSPC,    KC_TRNS,  KC_TRNS, KC_TRNS
  //                                    |--------------------------|  |--------------------------|
  ),

  [4] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,    LS_4,    LS_1, KC_LBRC, KC_RBRC,    LS_8, KC_TRNS,    KC_TRNS, LS_7,    KC_QUOT, LS_QUOT, KC_SCLN, KC_PPLS, KC_PMNS,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_TRNS,    LS_2,    LS_3,    LS_9,    LS_0, KC_MINS, KC_TRNS,    KC_TRNS, KC_SLSH, LS_BSLS, KC_BSLS, KC_EQL,  KC_PAST, KC_PSLS,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_LSFT,  LS_GRV,    LS_5, LS_LBRC, LS_RBRC, LS_MINS,                      LS_SLSH, LS_6,    LS_COMM, LS_DOT,  KC_PDOT, KC_PEQL,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                        KC_TRNS, KC_TRNS,  KC_BSPC,    KC_TRNS,  KC_TRNS, KC_TRNS
  //                                    |--------------------------|  |--------------------------|
  ),

  [5] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, RM_TOGG,   MEH_U,    HYPR_U,  KC_MSEL, HYPR_M,  HYPR_I,  KC_MUTE, KC_MPLY, KC_CALC,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     RM_SPDU, RM_VALU, RM_SATU, RM_HUEU, RM_NEXT,   RM_ON,   MEH_D,    HYPR_D,  KC_MPRV, KC_VOLD, KC_VOLU, KC_MNXT, KC_MSTP, KC_EJCT,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     RM_SPDD, RM_VALD, RM_SATD, RM_HUED, RM_PREV,  RM_OFF,                      KC_MRWD, XXXXXXX, XXXXXXX, KC_MFFD, XXXXXXX, TG(6),
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                        KC_TRNS, KC_TRNS,  KC_BSPC,    KC_TRNS,  KC_TRNS, KC_TRNS
  //                                    |--------------------------|  |--------------------------|
  ),

  [6] = LAYOUT_split_3x6_3_ex2(
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
      KC_TAB,    KC_Q,    KC_W,    KC_E,    KC_R,    KC_T, KC_VOLU,    KC_MPLY, KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_BSPC,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
      KC_ESC,    KC_A,    KC_S,    KC_D,    KC_F,    KC_G, KC_VOLD,    KC_MNXT, KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
     KC_LSFT,    KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,                      KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, TG(6),
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         KC_LCTL, KC_LALT,  KC_SPC,    KC_ENT,  KC_LGUI, KC_ESC
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
#endif
