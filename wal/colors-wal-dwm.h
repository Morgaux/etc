static const char norm_fg[] = "#cae4d9";
static const char norm_bg[] = "#0C0201";
static const char norm_border[] = "#8d9f97";

static const char sel_fg[] = "#cae4d9";
static const char sel_bg[] = "#936858";
static const char sel_border[] = "#cae4d9";

static const char urg_fg[] = "#cae4d9";
static const char urg_bg[] = "#B45344";
static const char urg_border[] = "#B45344";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
